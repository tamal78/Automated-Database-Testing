import streamlit as st
import subprocess
import pathlib
import difflib
import textwrap

# --- Paths ---
BASE_DIR = pathlib.Path(__file__).parent
RUNNER_SH = BASE_DIR / "runner.sh"
FEATURE_DIR = BASE_DIR / "features"
CONTROL_DIR = BASE_DIR / "control_files"
RESULT_DIR = BASE_DIR / "results"
DIFF_DIR = BASE_DIR / "diffs"
ANALYSIS_FILE = BASE_DIR / "analysis" / "analysis.txt"

st.set_page_config(page_title="SQL Test Runner", layout="wide")

st.title("📊 Automated SQL‑Testing Dashboard")

# --- Helper functions -------------------------------------------------------

def run_test_suite() -> subprocess.CompletedProcess:
    """Execute runner.sh and return CompletedProcess."""
    return subprocess.run(["bash", str(RUNNER_SH)], capture_output=True, text=True)


def read_file(path: pathlib.Path) -> str:
    try:
        return path.read_text()
    except Exception:
        return "[Unable to read file]"


def get_test_names():
    return sorted([p.stem for p in FEATURE_DIR.glob("*.sql")])


def load_diff_data(test_name):
    ctr_path = CONTROL_DIR / f"{test_name}.ctr"
    res_path = RESULT_DIR / f"{test_name}.res"
    diff_path = DIFF_DIR / f"{test_name}.diff"

    return {
        "ctr": read_file(ctr_path),
        "res": read_file(res_path),
        "diff": read_file(diff_path),
    }

# --- Main UI ---------------------------------------------------------------

if "last_run" not in st.session_state:
    st.session_state.last_run = None

with st.sidebar:
    st.header("Actions")
    if st.button("▶︎ Run Test Suite"):
        with st.status("Running tests…", expanded=True) as status:
            proc = run_test_suite()
            st.write(proc.stdout)
            if proc.returncode == 0:
                status.update(state="complete", label="All tests passed ✅")
            else:
                status.update(state="error", label="Some tests failed ❌")
        st.session_state.last_run = True

# Show analysis summary if available
if ANALYSIS_FILE.exists():
    st.subheader("Summary Report")
    st.code(read_file(ANALYSIS_FILE))
else:
    st.info("Run the test suite to generate a report.")

# Show individual test details
if st.session_state.get("last_run"):
    st.subheader("Test Details")
    tests = get_test_names()
    selected = st.selectbox("Select a test case", tests)
    data = load_diff_data(selected)

    cols = st.columns(2)
    with cols[0]:
        st.caption("Expected Output (.ctr)")
        st.text(data["ctr"])
    with cols[1]:
        st.caption("Actual Output (.res)")
        st.text(data["res"])

    st.caption("Differences (Unified Diff)")
    if data["diff"].strip():
        st.text(data["diff"])
    else:
        st.success("No differences – query passed.")

st.markdown("---")

st.write(
    textwrap.dedent(
        """
        **How to use:**
        1. Place your *.sql* test files in `Features/` and their corresponding *.ctr* files in `Control_files/`.
        2. Click **Run Test Suite** in the sidebar.
        3. Review the summary report and inspect differences for failed tests.
        """
    )
)