import sys
import subprocess
import pathlib
from PyQt6.QtWidgets import (
    QApplication, QMainWindow, QWidget, QVBoxLayout,
    QPushButton, QTextEdit, QLabel, QSplitter, QListWidget, QListWidgetItem
)
from PyQt6.QtCore import QThread, pyqtSignal, Qt
from PyQt6.QtGui import QFont, QTextBlockFormat, QTextCursor
from ansi2html import Ansi2HTMLConverter

# --- Configuration -----------------------------------------------------------
# These paths are based on the file structure from your scripts.
BASE_DIR = pathlib.Path(__file__).parent.resolve()
RUNNER_SH = BASE_DIR / "runner.sh"
FEATURE_DIR = BASE_DIR / "features"
CONTROL_DIR = BASE_DIR / "control_files"
RESULT_DIR = BASE_DIR / "results"
DIFF_DIR = BASE_DIR / "diffs"
ANALYSIS_DIR = BASE_DIR / "analysis"
ANALYSIS_FILE = ANALYSIS_DIR / "parallel_analysis_report.txt"

# --- Worker Thread for Running Tests -----------------------------------------
# This is the key to a non-freezing, responsive UI. The test suite runs here.
class TestRunnerWorker(QThread):
    """
    Runs the shell script in a background thread to prevent the UI from locking up.
    It can run the full suite or a single, specified test.
    """
    new_output = pyqtSignal(str)
    process_finished = pyqtSignal(int)
    
    # This attribute will hold the name of a single test to run
    single_test_name = None

    def run(self):
        """This method is executed when the thread's start() method is called."""
        try:
            # Ensure all necessary directories exist before running
            for p in [FEATURE_DIR, CONTROL_DIR, ANALYSIS_DIR, RESULT_DIR, DIFF_DIR]:
                p.mkdir(exist_ok=True)
            
            command = []
            # Choose command based on whether a single test is requested
            if self.single_test_name:
                self.new_output.emit(f"--- Running single test: {self.single_test_name} ---\n")
                command = ["bash", str(RUNNER_SH), self.single_test_name]
            else:
                self.new_output.emit("--- Running full test suite ---\n")
                test_names = [p.stem for p in FEATURE_DIR.glob("*.sql")]
                if not test_names:
                    self.new_output.emit("ERROR: No *.sql files found in 'features' directory.\n")
                    self.process_finished.emit(-1)
                    return
                command = ["bash", str(RUNNER_SH)] + test_names

            # subprocess.Popen allows us to read the output stream in real-time.
            self.process = subprocess.Popen(
                command,
                stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT,
                text=True,
                bufsize=1,
                universal_newlines=True
            )

            # Read output from the script line-by-line
            for line in self.process.stdout:
                self.new_output.emit(line)

            self.process.wait()
            self.process_finished.emit(self.process.returncode)

        except FileNotFoundError:
            self.new_output.emit(f"FATAL ERROR: Script '{RUNNER_SH}' not found.\n")
            self.process_finished.emit(-1)
        except Exception as e:
            self.new_output.emit(f"An unexpected error occurred: {e}\n")
            self.process_finished.emit(-1)

# --- Main Application Window ------------------------------------------------
class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Automated SQL-Testing Dashboard")
        self.setGeometry(100, 100, 1200, 800)
        
        # Create an ANSI to HTML converter instance
        self.converter = Ansi2HTMLConverter(inline=True, linkify=False)

        # --- UI Elements ---
        self.run_button = QPushButton("▶︎ Run Full Test Suite")
        self.test_list = QListWidget()
        
        # Use a slightly larger, readable monospace font
        monospace_font = QFont("Courier New", 11)
        self.test_list.setFont(monospace_font)

        self.log_output = QTextEdit()
        self.log_output.setReadOnly(True)
        self.log_output.setFont(monospace_font)

        self.summary_report = QTextEdit()
        self.summary_report.setReadOnly(True)
        self.summary_report.setFont(monospace_font)

        self.ctr_view = QTextEdit()
        self.ctr_view.setReadOnly(True)
        self.ctr_view.setFont(monospace_font)

        self.res_view = QTextEdit()
        self.res_view.setReadOnly(True)
        self.res_view.setFont(monospace_font)

        self.diff_view = QTextEdit()
        self.diff_view.setReadOnly(True)
        self.diff_view.setFont(monospace_font)

        # --- Layouts ---
        main_splitter = QSplitter(Qt.Orientation.Horizontal)

        sidebar_widget = QWidget()
        sidebar_layout = QVBoxLayout(sidebar_widget)
        sidebar_layout.addWidget(self.run_button)
        sidebar_layout.addWidget(QLabel("Available Tests (Double-click to run one):"))
        sidebar_layout.addWidget(self.test_list)
        main_splitter.addWidget(sidebar_widget)

        content_splitter = QSplitter(Qt.Orientation.Vertical)
        top_content_splitter = QSplitter(Qt.Orientation.Horizontal)
        
        log_widget = QWidget()
        log_layout = QVBoxLayout(log_widget)
        log_layout.addWidget(QLabel("Real-time Test Output"))
        log_layout.addWidget(self.log_output)
        top_content_splitter.addWidget(log_widget)

        summary_widget = QWidget()
        summary_layout = QVBoxLayout(summary_widget)
        summary_layout.addWidget(QLabel("Summary Report"))
        summary_layout.addWidget(self.summary_report)
        top_content_splitter.addWidget(summary_widget)

        top_content_splitter.setSizes([600, 400])
        content_splitter.addWidget(top_content_splitter)

        bottom_content_splitter = QSplitter(Qt.Orientation.Horizontal)

        ctr_widget = QWidget()
        ctr_layout = QVBoxLayout(ctr_widget)
        ctr_layout.addWidget(QLabel("Expected Output (.ctr)"))
        ctr_layout.addWidget(self.ctr_view)
        bottom_content_splitter.addWidget(ctr_widget)
        
        res_widget = QWidget()
        res_layout = QVBoxLayout(res_widget)
        res_layout.addWidget(QLabel("Actual Output (.res)"))
        res_layout.addWidget(self.res_view)
        bottom_content_splitter.addWidget(res_widget)
        
        self.diff_widget = QWidget() 
        diff_layout = QVBoxLayout(self.diff_widget)
        diff_layout.addWidget(QLabel("Differences (.diff)"))
        diff_layout.addWidget(self.diff_view)
        bottom_content_splitter.addWidget(self.diff_widget)

        content_splitter.addWidget(bottom_content_splitter)
        content_splitter.setSizes([400, 400])

        main_splitter.addWidget(content_splitter)
        main_splitter.setSizes([220, 980])

        self.setCentralWidget(main_splitter)

        # --- Worker Thread and Connections ---
        self.worker = TestRunnerWorker()
        self.run_button.clicked.connect(self.start_full_test_run)
        self.test_list.itemDoubleClicked.connect(self.start_single_test_run)
        
        self.worker.new_output.connect(self.append_log_output)
        self.worker.process_finished.connect(self.on_test_run_finished)
        self.test_list.currentItemChanged.connect(self.display_test_details)

        # --- Initial State ---
        self.populate_test_list()

    def populate_test_list(self):
        """Scans the features directory and populates the list of tests."""
        self.test_list.clear()
        if not FEATURE_DIR.is_dir():
            return
        test_names = sorted([p.stem for p in FEATURE_DIR.glob("*.sql")])
        for name in test_names:
            self.test_list.addItem(QListWidgetItem(name))

    def _prepare_and_start_run(self):
        """Common setup logic before starting any test run."""
        self.log_output.clear()
        self.summary_report.clear()
        self.run_button.setEnabled(False)
        self.test_list.setEnabled(False) 
        self.worker.start()

    def start_full_test_run(self):
        """Handles the 'Run Full Test Suite' button click."""
        self.worker.single_test_name = None 
        self.run_button.setText("⏳ Running All...")
        self._prepare_and_start_run()

    def start_single_test_run(self, item: QListWidgetItem):
        """Handles a double-click on a test item to run it individually."""
        test_name = item.text()
        self.worker.single_test_name = test_name
        self.run_button.setText(f"⏳ Running {test_name}...")
        self._prepare_and_start_run()

    # --- MODIFIED: This method now correctly handles line breaks ---
    def append_log_output(self, text: str):
        """
        Safely appends text from the worker thread to the log view, converting
        ANSI to HTML and correctly preserving line breaks.
        """
        # Move cursor to the end to ensure the view auto-scrolls
        cursor = self.log_output.textCursor()
        cursor.movePosition(QTextCursor.MoveOperation.End)
        self.log_output.setTextCursor(cursor)

        # The ansi2html converter translates color codes but strips the trailing newline.
        # We must handle the line break manually.
        html_fragment = self.converter.convert(text, full=False)
        
        # insertHtml does not append a newline. We insert the converted fragment,
        # and then we insert a block break to create a new line. This correctly
        # mirrors the line-by-line output from the subprocess.
        # We clean the fragment of newlines just in case to prevent double breaks.
        cursor.insertHtml(html_fragment.replace('\n', ''))
        
        # If the original text from the process contained a newline, it signifies
        # the end of a line, so we create a new block (paragraph).
        if '\n' in text:
            cursor.insertBlock()

    def on_test_run_finished(self, return_code: int):
        """Handles the completion of the test run."""
        self.run_button.setEnabled(True)
        self.test_list.setEnabled(True) 
        self.run_button.setText("▶︎ Run Full Test Suite")
        
        final_message = f"\n✅ Test run completed with Exit Code: {return_code}.\n"
        self.append_log_output(final_message)
        
        self.load_summary_report()
        self.populate_test_list()
        
        if self.test_list.count() > 0:
            if self.worker.single_test_name:
                items = self.test_list.findItems(self.worker.single_test_name, Qt.MatchFlag.MatchExactly)
                if items:
                    self.test_list.setCurrentItem(items[0])
            else:
                self.test_list.setCurrentRow(0)

    def load_summary_report(self):
        """Loads the final analysis report into its text view."""
        if ANALYSIS_FILE.exists():
            try:
                self.summary_report.setText(ANALYSIS_FILE.read_text())
            except Exception as e:
                self.summary_report.setText(f"Error reading summary file:\n{e}")
        else:
            self.summary_report.setText("Analysis report file not found.")

    def display_test_details(self, current_item: QListWidgetItem, previous_item: QListWidgetItem):
        """Loads and displays the .ctr, .res, and .diff files for the selected test."""
        if current_item is None:
            for view in [self.ctr_view, self.res_view, self.diff_view]:
                view.clear()
            self.diff_widget.hide()
            return
            
        test_name = current_item.text()
        
        def read_file(path: pathlib.Path) -> str:
            try:
                return path.read_text(encoding='utf-8')
            except Exception as e:
                return f"[Could not read file: {e}]"

        self.ctr_view.setText(read_file(CONTROL_DIR / f"{test_name}.ctr"))
        self.res_view.setText(read_file(RESULT_DIR / f"{test_name}.res"))
        
        diff_path = DIFF_DIR / f"{test_name}.diff"
        if diff_path.exists() and diff_path.stat().st_size > 0:
            self.diff_view.setText(read_file(diff_path))
            self.diff_widget.show()
        else:
            self.diff_view.clear()
            self.diff_widget.hide()


# --- Application Entry Point ------------------------------------------------
if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = MainWindow()
    window.show()
    sys.exit(app.exec())

