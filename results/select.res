Using database: classicmodels

-- Query 1: Select all columns from the employees table
--- Result ---
employeeNumber	lastName	firstName	extension	email	officeCode	reportsTo	jobTitle
1002	Murphy	Diane	x5800	dmurphy@classicmodelcars.com	1	NULL	President
1056	Patterson	Mary	x4611	mpatterso@classicmodelcars.com	1	1002	VP Sales
1076	Firrelli	Jeff	x9273	jfirrelli@classicmodelcars.com	1	1002	VP Marketing
1088	Patterson	William	x4871	wpatterson@classicmodelcars.com	6	1056	Sales Manager (APAC)
1102	Bondur	Gerard	x5408	gbondur@classicmodelcars.com	4	1056	Sale Manager (EMEA)
1143	Bow	Anthony	x5428	abow@classicmodelcars.com	1	1056	Sales Manager (NA)
1165	Jennings	Leslie	x3291	ljennings@classicmodelcars.com	1	1143	Sales Rep
1166	Thompson	Leslie	x4065	lthompson@classicmodelcars.com	1	1143	Sales Rep
1188	Firrelli	Julie	x2173	jfirrelli@classicmodelcars.com	2	1143	Sales Rep
1216	Patterson	Steve	x4334	spatterson@classicmodelcars.com	2	1143	Sales Rep
1286	Tseng	Foon Yue	x2248	ftseng@classicmodelcars.com	3	1143	Sales Rep
1323	Vanauf	George	x4102	gvanauf@classicmodelcars.com	3	1143	Sales Rep
1337	Bondur	Loui	x6493	lbondur@classicmodelcars.com	4	1102	Sales Rep
1370	Hernandez	Gerard	x2028	ghernande@classicmodelcars.com	4	1102	Sales Rep
1401	Castillo	Pamela	x2759	pcastillo@classicmodelcars.com	4	1102	Sales Rep
1501	Bott	Larry	x2311	lbott@classicmodelcars.com	7	1102	Sales Rep
1504	Jones	Barry	x102	bjones@classicmodelcars.com	7	1102	Sales Rep
1611	Fixter	Andy	x101	afixter@classicmodelcars.com	6	1088	Sales Rep
1612	Marsh	Peter	x102	pmarsh@classicmodelcars.com	6	1088	Sales Rep
1619	King	Tom	x103	tking@classicmodelcars.com	6	1088	Sales Rep
1621	Nishi	Mami	x101	mnishi@classicmodelcars.com	5	1056	Sales Rep
1625	Kato	Yoshimi	x102	ykato@classicmodelcars.com	5	1621	Sales Rep
1702	Gerard	Martin	x2312	mgerard@classicmodelcars.com	4	1102	Sales Rep
--- End Result (Success) ---

==============================

-- Query 2: Select all products with price greater than 100, ordered by price descending
--- Result ---
productCode	productName	productLine	productScale	productVendor	productDescription	quantityInStock	buyPrice	MSRP
S10_4962	1962 LanciaA Delta 16V	Classic Cars	1:10	Second Gear Diecast	Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.	6791	103.42	147.74
S18_2238	1998 Chrysler Plymouth Prowler	Classic Cars	1:18	Gearbox Collectibles	Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.	4724	101.51	163.73
--- End Result (Success) ---

==============================

-- Query 3: Select the first 10 customers (TOP equivalent using LIMIT)
--- Result ---
customerNumber	customerName	contactLastName	contactFirstName	phone	addressLine1	addressLine2	city	state	postalCode	country	salesRepEmployeeNumber	creditLimit
103	Atelier graphique	Schmitt	Carine 	40.32.2555	54, rue Royale	NULL	Nantes	NULL	44000	France	1370	21000.00
112	Signal Gift Stores	King	Jean	7025551838	8489 Strong St.	NULL	Las Vegas	NV	83030	USA	1166	71800.00
114	Australian Collectors, Co.	Ferguson	Peter	03 9520 4555	636 St Kilda Road	Level 3	Melbourne	Victoria	3004	Australia	1611	117300.00
119	La Rochelle Gifts	Labrune	Janine 	40.67.8555	67, rue des Cinquante Otages	NULL	Nantes	NULL	44000	France	1370	118200.00
121	Baane Mini Imports	Bergulfsen	Jonas 	07-98 9555	Erling Skakkes gate 78	NULL	Stavern	NULL	4110	Norway	1504	81700.00
124	Mini Gifts Distributors Ltd.	Nelson	Susan	4155551450	5677 Strong St.	NULL	San Rafael	CA	97562	USA	1165	210500.00
125	Havel & Zbyszek Co	Piestrzeniewicz	Zbyszek 	(26) 642-7555	ul. Filtrowa 68	NULL	Warszawa	NULL	01-012	Poland	NULL	0.00
128	Blauer See Auto, Co.	Keitel	Roland	+49 69 66 90 2555	Lyonerstr. 34	NULL	Frankfurt	NULL	60528	Germany	1504	59700.00
129	Mini Wheels Co.	Murphy	Julie	6505555787	5557 North Pendale Street	NULL	San Francisco	CA	94217	USA	1165	64600.00
131	Land of Toys Inc.	Lee	Kwai	2125557818	897 Long Airport Avenue	NULL	NYC	NY	10022	USA	1323	114900.00
--- End Result (Success) ---

==============================

-- Query 4: Select distinct cities from which customers are located
--- Result ---
city
Nantes
Las Vegas
Melbourne
Stavern
San Rafael
Warszawa
Frankfurt
San Francisco
NYC
Madrid
Luleå
Kobenhavn
Lyon
Singapore
Allentown
Burlingame
Bergen
New Haven
Lisboa
Lille
Paris
Cambridge
Bridgewater
Kita-ku
Helsinki
Manchester
Dublin
Brickhaven
Liverpool
Vancouver
Pasadena
Strasbourg
Central Hong Kong
Barcelona
Glendale
Cunewalde
Århus
Montréal
San Diego
Cowes
Toulouse
Torino
Versailles
Köln
Tsawassen
München
North Sydney
Bergamo
Chatswood
Fribourg
Genève
Oslo
Amsterdam
Berlin
Oulu
Bruxelles
White Plains
New Bedford
Auckland  
London
Newark
South Brisbane
Espoo
Brandenburg
Philadelphia
Los Angeles
Cork
Marseille
Reims
Hatfield
Auckland
Münster
Boston
Nashua
Bern
Charleroi
Salzburg
Makati City
Reggio Emilia
Minato-ku
Stuttgart
Wellington
Munich
Leipzig
Bräcke
San Jose
Graz
Aachen
Glen Waverly
Milan
Burbank
Mannheim
Saint Petersburg
Herzlia
Sevilla
Brisbane
--- End Result (Success) ---

==============================

-- Query 5: Select all orders placed in 2005 and create a temporary table (SELECT INTO equivalent)
--- Result ---
--- End Result (Success) ---

==============================

-- Query 6: Select customer names and rename the column using alias
--- Result ---
name
Atelier graphique
Signal Gift Stores
Australian Collectors, Co.
La Rochelle Gifts
Baane Mini Imports
Mini Gifts Distributors Ltd.
Havel & Zbyszek Co
Blauer See Auto, Co.
Mini Wheels Co.
Land of Toys Inc.
Euro+ Shopping Channel
Volvo Model Replicas, Co
Danish Wholesale Imports
Saveley & Henriot, Co.
Dragon Souveniers, Ltd.
Muscle Machine Inc
Diecast Classics Inc.
Technics Stores Inc.
Handji Gifts& Co
Herkku Gifts
American Souvenirs Inc
Porto Imports Co.
Daedalus Designs Imports
La Corne D'abondance, Co.
Cambridge Collectables Co.
Gift Depot Inc.
Osaka Souveniers Co.
Vitachrome Inc.
Toys of Finland, Co.
AV Stores, Co.
Clover Collections, Co.
Auto-Moto Classics Inc.
UK Collectables, Ltd.
Canadian Gift Exchange Network
Online Mini Collectables
Toys4GrownUps.com
Asian Shopping Network, Co
Mini Caravy
King Kong Collectables, Co.
Enaco Distributors
Boards & Toys Co.
Natürlich Autos
Heintze Collectables
Québec Home Shopping Network
ANG Resellers
Collectable Mini Designs Co.
giftsbymail.co.uk
Alpha Cognac
Messner Shopping Network
Amica Models & Co.
Lyon Souveniers
Auto Associés & Cie.
Toms Spezialitäten, Ltd
Royal Canadian Collectables, Ltd.
Franken Gifts, Co
Anna's Decorations, Ltd
Rovelli Gifts
Souveniers And Things Co.
Marta's Replicas Co.
BG&E Collectables
Vida Sport, Ltd
Norway Gifts By Mail, Co.
Schuyler Imports
Der Hund Imports
Oulu Toy Supplies, Inc.
Petit Auto
Mini Classics
Mini Creations Ltd.
Corporate Gift Ideas Co.
Down Under Souveniers, Inc
Stylish Desk Decors, Co.
Tekni Collectables Inc.
Australian Gift Network, Co
Suominen Souveniers
Cramer Spezialitäten, Ltd
Classic Gift Ideas, Inc
CAF Imports
Men 'R' US Retailers, Ltd.
Asian Treasures, Inc.
Marseille Mini Autos
Reims Collectables
SAR Distributors, Co
GiftsForHim.com
Kommission Auto
Gifts4AllAges.com
Online Diecast Creations Co.
Lisboa Souveniers, Inc
Precious Collectables
Collectables For Less Inc.
Royale Belge
Salzburg Collectables
Cruz & Sons Co.
L'ordine Souveniers
Tokyo Collectables, Ltd
Auto Canal+ Petit
Stuttgart Collectable Exchange
Extreme Desk Decorations, Ltd
Bavarian Collectables Imports, Co.
Classic Legends Inc.
Feuer Online Stores, Inc
Gift Ideas Corp.
Scandinavian Gift Ideas
The Sharp Gifts Warehouse
Mini Auto Werke
Super Scale Inc.
Microscale Inc.
Corrida Auto Replicas, Ltd
Warburg Exchange
FunGiftIdeas.com
Anton Designs, Ltd.
Australian Collectables, Ltd
Frau da Collezione
West Coast Collectables Co.
Mit Vergnügen & Co.
Kremlin Collectables, Co.
Raanan Stores, Inc
Iberia Gift Imports, Corp.
Motor Mint Distributors Inc.
Signal Collectibles Ltd.
Double Decker Gift Stores, Ltd
Diecast Collectables
Kelly's Gift Shop
--- End Result (Success) ---

==============================

