Using database: classicmodels

-- Query 1: Customers whose names start with 'A'
--- Result ---
customerNumber	customerName
103	Atelier graphique
114	Australian Collectors, Co.
168	American Souvenirs Inc
187	AV Stores, Co.
198	Auto-Moto Classics Inc.
206	Asian Shopping Network, Co
237	ANG Resellers
242	Alpha Cognac
249	Amica Models & Co.
256	Auto Associés & Cie.
276	Anna's Decorations, Ltd
333	Australian Gift Network, Co
348	Asian Treasures, Inc.
406	Auto Canal+ Petit
465	Anton Designs, Ltd.
471	Australian Collectables, Ltd
--- End Result (Success) ---

==============================

-- Query 2: Customers whose names end with 'Inc.'
--- Result ---
customerNumber	customerName
131	Land of Toys Inc.
157	Diecast Classics Inc.
161	Technics Stores Inc.
175	Gift Depot Inc.
181	Vitachrome Inc.
198	Auto-Moto Classics Inc.
311	Oulu Toy Supplies, Inc.
328	Tekni Collectables Inc.
348	Asian Treasures, Inc.
379	Collectables For Less Inc.
424	Classic Legends Inc.
455	Super Scale Inc.
456	Microscale Inc.
486	Motor Mint Distributors Inc.
--- End Result (Success) ---

==============================

-- Query 3: Customers whose names contain 'Corp'
--- Result ---
customerNumber	customerName
321	Corporate Gift Ideas Co.
447	Gift Ideas Corp.
484	Iberia Gift Imports, Corp.
--- End Result (Success) ---

==============================

-- Query 4: Customers whose contact first name starts with 'Mi'
--- Result ---
customerName	contactFirstName
Vitachrome Inc.	Michael
Online Mini Collectables	Miguel
King Kong Collectables, Co.	Mike
Vida Sport, Ltd	Mihael
Down Under Souveniers, Inc	Mike
Bavarian Collectables Imports, Co.	Michael
--- End Result (Success) ---

==============================

-- Query 5: Products that start with 'S10'
--- Result ---
productCode	productName
S10_1678	1969 Harley Davidson Ultimate Chopper
S10_1949	1952 Alpine Renault 1300
S10_2016	1996 Moto Guzzi 1100i
S10_4698	2003 Harley-Davidson Eagle Drag Bike
S10_4757	1972 Alfa Romeo GTA
S10_4962	1962 LanciaA Delta 16V
--- End Result (Success) ---

==============================

-- Query 6: Employees whose last names contain 'son'
--- Result ---
employeeNumber	firstName	lastName
1056	Mary	Patterson
1088	William	Patterson
1166	Leslie	Thompson
1216	Steve	Patterson
--- End Result (Success) ---

==============================

-- Query 7: Products with names containing a space followed by a capital letter
--- Result ---
productCode	productName
S10_1678	1969 Harley Davidson Ultimate Chopper
S10_1949	1952 Alpine Renault 1300
S10_4698	2003 Harley-Davidson Eagle Drag Bike
S10_4757	1972 Alfa Romeo GTA
S10_4962	1962 LanciaA Delta 16V
S12_1099	1968 Ford Mustang
S12_1108	2001 Ferrari Enzo
S12_1666	1958 Setra Bus
S12_3148	1969 Corvair Monza
S12_3380	1968 Dodge Charger
S12_3891	1969 Ford Falcon
S12_3990	1970 Plymouth Hemi Cuda
S12_4473	1957 Chevy Pickup
S12_4675	1969 Dodge Charger
S18_1097	1940 Ford Pickup Truck
S18_1129	1993 Mazda RX-7
S18_1342	1937 Lincoln Berline
S18_1367	1936 Mercedes-Benz 500K Special Roadster
S18_1589	1965 Aston Martin DB5
S18_1662	1980s Black Hawk Helicopter
S18_1749	1917 Grand Touring Sedan
S18_1889	1948 Porsche 356-A Roadster
S18_1984	1995 Honda Civic
S18_2238	1998 Chrysler Plymouth Prowler
S18_2248	1911 Ford Town Car
S18_2319	1964 Mercedes Tour Bus
S18_2325	1932 Model A Ford J-Coupe
S18_2581	P-51-D Mustang
S18_2625	1936 Harley Davidson El Knucklehead
S18_2795	1928 Mercedes-Benz SSK
S18_2870	1999 Indy 500 Monte Carlo SS
S18_2957	1934 Ford V8 Coupe
S18_3029	1999 Yamaha Speed Boat
S18_3136	18th Century Vintage Horse Carriage
S18_3140	1903 Ford Model A
S18_3232	1992 Ferrari 360 Spider red
S18_3233	1985 Toyota Supra
S18_3259	Collectable Wooden Train
S18_3278	1969 Dodge Super Bee
S18_3320	1917 Maxwell Touring Car
S18_3482	1976 Ford Gran Torino
S18_3685	1948 Porsche Type 356 Roadster
S18_3782	1957 Vespa GS150
S18_3856	1941 Chevrolet Special Deluxe Cabriolet
S18_4409	1932 Alfa Romeo 8C2300 Spider Sport
S18_4522	1904 Buick Runabout
S18_4600	1940s Ford truck
S18_4668	1939 Cadillac Limousine
S18_4721	1957 Corvette Convertible
S18_4933	1957 Ford Thunderbird
S24_1046	1970 Chevy Chevelle SS 454
S24_1444	1970 Dodge Coronet
S24_1578	1997 BMW R 1100 S
S24_1628	1966 Shelby Cobra 427 S/C
S24_1785	1928 British Royal Navy Airplane
S24_1937	1939 Chevrolet Deluxe Coupe
S24_2000	1960 BSA Gold Star DBD34
S24_2011	18th century schooner
S24_2022	1938 Cadillac V-16 Presidential Limousine
S24_2300	1962 Volkswagen Microbus
S24_2360	1982 Ducati 900 Monster
S24_2766	1949 Jaguar XK 120
S24_2840	1958 Chevy Corvette Limited Edition
S24_2841	1900s Vintage Bi-Plane
S24_2887	1952 Citroen-15CV
S24_2972	1982 Lamborghini Diablo
S24_3151	1912 Ford Model T Delivery Wagon
S24_3191	1969 Chevrolet Camaro Z28
S24_3371	1971 Alpine Renault 1600s
S24_3420	1937 Horch 930V Limousine
S24_3432	2002 Chevy Corvette
S24_3816	1940 Ford Delivery Sedan
S24_3856	1956 Porsche 356A Coupe
S24_3949	Corsair F4U ( Bird Cage)
S24_3969	1936 Mercedes Benz 500k Roadster
S24_4048	1992 Porsche Cayenne Turbo Silver
S24_4258	1936 Chrysler Airflow
S24_4278	1900s Vintage Tri-Plane
S24_4620	1961 Chevrolet Impala
S32_1268	1980’s GM Manhattan Express
S32_1374	1997 BMW F650 ST
S32_2206	1982 Ducati 996 R
S32_2509	1954 Greyhound Scenicruiser
S32_3207	1950's Chicago Surface Lines Streetcar
S32_3522	1996 Peterbilt 379 Stake Bed with Outrigger
S32_4289	1928 Ford Phaeton Deluxe
S32_4485	1974 Ducati 350 Mk3 Desmo
S50_1341	1930 Buick Marquette Phaeton
S50_1392	Diamond T620 Semi-Skirted Tanker
S50_1514	1962 City of Detroit Streetcar
S50_4713	2002 Yamaha YZR M1
S700_1138	The Schooner Bluenose
S700_1691	American Airlines: B767-300
S700_1938	The Mayflower
S700_2047	HMS Bounty
S700_2466	America West Airlines B757-200
S700_2610	The USS Constitution Ship
S700_2824	1982 Camaro Z28
S700_2834	ATA: B757-300
S700_3505	The Titanic
S700_3962	The Queen Mary
S700_4002	American Airlines: MD-11S
S72_1253	Boeing X-32A JSF
S72_3212	Pont Yacht
--- End Result (Success) ---

==============================

-- Query 8: Customers whose name is exactly 6 characters long
--- Result ---
customerNumber	customerName
103	Atelier graphique
112	Signal Gift Stores
114	Australian Collectors, Co.
119	La Rochelle Gifts
121	Baane Mini Imports
124	Mini Gifts Distributors Ltd.
125	Havel & Zbyszek Co
128	Blauer See Auto, Co.
129	Mini Wheels Co.
131	Land of Toys Inc.
141	Euro+ Shopping Channel
144	Volvo Model Replicas, Co
145	Danish Wholesale Imports
146	Saveley & Henriot, Co.
148	Dragon Souveniers, Ltd.
151	Muscle Machine Inc
157	Diecast Classics Inc.
166	Handji Gifts& Co
167	Herkku Gifts
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
189	Clover Collections, Co.
198	Auto-Moto Classics Inc.
201	UK Collectables, Ltd.
202	Canadian Gift Exchange Network
204	Online Mini Collectables
205	Toys4GrownUps.com
206	Asian Shopping Network, Co
209	Mini Caravy
211	King Kong Collectables, Co.
216	Enaco Distributors
219	Boards & Toys Co.
223	Natürlich Autos
227	Heintze Collectables
233	Québec Home Shopping Network
237	ANG Resellers
239	Collectable Mini Designs Co.
240	giftsbymail.co.uk
242	Alpha Cognac
247	Messner Shopping Network
249	Amica Models & Co.
250	Lyon Souveniers
256	Auto Associés & Cie.
259	Toms Spezialitäten, Ltd
260	Royal Canadian Collectables, Ltd.
273	Franken Gifts, Co
276	Anna's Decorations, Ltd
278	Rovelli Gifts
282	Souveniers And Things Co.
286	Marta's Replicas Co.
293	BG&E Collectables
298	Vida Sport, Ltd
299	Norway Gifts By Mail, Co.
303	Schuyler Imports
307	Der Hund Imports
311	Oulu Toy Supplies, Inc.
314	Petit Auto
319	Mini Classics
320	Mini Creations Ltd.
321	Corporate Gift Ideas Co.
323	Down Under Souveniers, Inc
324	Stylish Desk Decors, Co.
328	Tekni Collectables Inc.
333	Australian Gift Network, Co
334	Suominen Souveniers
335	Cramer Spezialitäten, Ltd
339	Classic Gift Ideas, Inc
344	CAF Imports
347	Men 'R' US Retailers, Ltd.
348	Asian Treasures, Inc.
350	Marseille Mini Autos
353	Reims Collectables
356	SAR Distributors, Co
357	GiftsForHim.com
361	Kommission Auto
362	Gifts4AllAges.com
363	Online Diecast Creations Co.
369	Lisboa Souveniers, Inc
376	Precious Collectables
379	Collectables For Less Inc.
381	Royale Belge
382	Salzburg Collectables
385	Cruz & Sons Co.
386	L'ordine Souveniers
398	Tokyo Collectables, Ltd
406	Auto Canal+ Petit
409	Stuttgart Collectable Exchange
412	Extreme Desk Decorations, Ltd
415	Bavarian Collectables Imports, Co.
424	Classic Legends Inc.
443	Feuer Online Stores, Inc
447	Gift Ideas Corp.
448	Scandinavian Gift Ideas
450	The Sharp Gifts Warehouse
452	Mini Auto Werke
455	Super Scale Inc.
456	Microscale Inc.
458	Corrida Auto Replicas, Ltd
459	Warburg Exchange
462	FunGiftIdeas.com
465	Anton Designs, Ltd.
471	Australian Collectables, Ltd
473	Frau da Collezione
475	West Coast Collectables Co.
477	Mit Vergnügen & Co.
480	Kremlin Collectables, Co.
481	Raanan Stores, Inc
484	Iberia Gift Imports, Corp.
486	Motor Mint Distributors Inc.
487	Signal Collectibles Ltd.
489	Double Decker Gift Stores, Ltd
495	Diecast Collectables
496	Kelly's Gift Shop
--- End Result (Success) ---

==============================

-- Query 10: Case-insensitive match (LIKE is case-insensitive in MySQL by default)
--- Result ---
customerNumber	customerName
339	Classic Gift Ideas, Inc
424	Classic Legends Inc.
--- End Result (Success) ---

==============================

