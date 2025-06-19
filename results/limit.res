Using database: classicmodels

-- Query 1: Get the first 10 customers
--- Result ---
customerNumber	customerName	country
103	Atelier graphique	France
112	Signal Gift Stores	USA
114	Australian Collectors, Co.	Australia
119	La Rochelle Gifts	France
121	Baane Mini Imports	Norway
124	Mini Gifts Distributors Ltd.	USA
125	Havel & Zbyszek Co	Poland
128	Blauer See Auto, Co.	Germany
129	Mini Wheels Co.	USA
131	Land of Toys Inc.	USA
--- End Result (Success) ---

==============================

-- Query 2: Get the 5 most recent orders
--- Result ---
orderNumber	orderDate	status
10425	2005-05-31	In Process
10424	2005-05-31	In Process
10423	2005-05-30	In Process
10422	2005-05-30	In Process
10420	2005-05-29	In Process
--- End Result (Success) ---

==============================

-- Query 3: Get the top 3 most expensive products
--- Result ---
productCode	productName	buyPrice
S10_4962	1962 LanciaA Delta 16V	103.42
S18_2238	1998 Chrysler Plymouth Prowler	101.51
S10_1949	1952 Alpine Renault 1300	98.58
--- End Result (Success) ---

==============================

-- Query 4: Skip the first 5 rows and get the next 5 (pagination)
--- Result ---
customerNumber	customerName
124	Mini Gifts Distributors Ltd.
125	Havel & Zbyszek Co
128	Blauer See Auto, Co.
129	Mini Wheels Co.
131	Land of Toys Inc.
--- End Result (Success) ---

==============================

-- Query 5: Page 3 of customers with 10 per page (OFFSET = (page-1)*limit)
--- Result ---
customerNumber	customerName
168	American Souvenirs Inc
169	Porto Imports Co.
171	Daedalus Designs Imports
172	La Corne D'abondance, Co.
173	Cambridge Collectables Co.
175	Gift Depot Inc.
177	Osaka Souveniers Co.
181	Vitachrome Inc.
186	Toys of Finland, Co.
187	AV Stores, Co.
--- End Result (Success) ---

==============================

-- Query 6: Use LIMIT with JOIN - get 5 employee-office pairs
--- Result ---
employeeNumber	firstName	lastName	city
1002	Diane	Murphy	San Francisco
1056	Mary	Patterson	San Francisco
1076	Jeff	Firrelli	San Francisco
1088	William	Patterson	Sydney
1102	Gerard	Bondur	Paris
--- End Result (Success) ---

==============================

-- Query 7: LIMIT with WHERE condition - top 3 customers in USA
--- Result ---
customerName	country	creditLimit
Mini Gifts Distributors Ltd.	USA	210500.00
Muscle Machine Inc	USA	138500.00
Marta's Replicas Co.	USA	123700.00
--- End Result (Success) ---

==============================

-- Query 8: LIMIT 1 - Get the customer with the highest credit limit
--- Result ---
customerNumber	customerName	creditLimit
141	Euro+ Shopping Channel	227600.00
--- End Result (Success) ---

==============================

