Using database: classicmodels

-- Query 1: Customers from USA AND with credit limit over 50,000
--- Result ---
customerNumber	customerName	country	creditLimit
112	Signal Gift Stores	USA	71800.00
124	Mini Gifts Distributors Ltd.	USA	210500.00
129	Mini Wheels Co.	USA	64600.00
131	Land of Toys Inc.	USA	114900.00
151	Muscle Machine Inc	USA	138500.00
157	Diecast Classics Inc.	USA	100600.00
161	Technics Stores Inc.	USA	84600.00
175	Gift Depot Inc.	USA	84300.00
181	Vitachrome Inc.	USA	76400.00
204	Online Mini Collectables	USA	68700.00
205	Toys4GrownUps.com	USA	90700.00
239	Collectable Mini Designs Co.	USA	105000.00
286	Marta's Replicas Co.	USA	123700.00
319	Mini Classics	USA	102700.00
320	Mini Creations Ltd.	USA	94500.00
321	Corporate Gift Ideas Co.	USA	105000.00
339	Classic Gift Ideas, Inc	USA	81100.00
347	Men 'R' US Retailers, Ltd.	USA	57700.00
363	Online Diecast Creations Co.	USA	114200.00
379	Collectables For Less Inc.	USA	70700.00
424	Classic Legends Inc.	USA	67500.00
450	The Sharp Gifts Warehouse	USA	77600.00
455	Super Scale Inc.	USA	95400.00
462	FunGiftIdeas.com	USA	85800.00
475	West Coast Collectables Co.	USA	55400.00
486	Motor Mint Distributors Inc.	USA	72600.00
487	Signal Collectibles Ltd.	USA	60300.00
495	Diecast Collectables	USA	85100.00
--- End Result (Success) ---

==============================

-- Query 2: Customers from USA OR Canada
--- Result ---
customerNumber	customerName	country
112	Signal Gift Stores	USA
124	Mini Gifts Distributors Ltd.	USA
129	Mini Wheels Co.	USA
131	Land of Toys Inc.	USA
151	Muscle Machine Inc	USA
157	Diecast Classics Inc.	USA
161	Technics Stores Inc.	USA
168	American Souvenirs Inc	USA
173	Cambridge Collectables Co.	USA
175	Gift Depot Inc.	USA
181	Vitachrome Inc.	USA
198	Auto-Moto Classics Inc.	USA
202	Canadian Gift Exchange Network	Canada
204	Online Mini Collectables	USA
205	Toys4GrownUps.com	USA
219	Boards & Toys Co.	USA
233	Québec Home Shopping Network	Canada
239	Collectable Mini Designs Co.	USA
260	Royal Canadian Collectables, Ltd.	Canada
286	Marta's Replicas Co.	USA
319	Mini Classics	USA
320	Mini Creations Ltd.	USA
321	Corporate Gift Ideas Co.	USA
328	Tekni Collectables Inc.	USA
339	Classic Gift Ideas, Inc	USA
347	Men 'R' US Retailers, Ltd.	USA
362	Gifts4AllAges.com	USA
363	Online Diecast Creations Co.	USA
379	Collectables For Less Inc.	USA
424	Classic Legends Inc.	USA
447	Gift Ideas Corp.	USA
450	The Sharp Gifts Warehouse	USA
455	Super Scale Inc.	USA
456	Microscale Inc.	USA
462	FunGiftIdeas.com	USA
475	West Coast Collectables Co.	USA
486	Motor Mint Distributors Inc.	USA
487	Signal Collectibles Ltd.	USA
495	Diecast Collectables	USA
--- End Result (Success) ---

==============================

-- Query 3: Customers NOT from the USA
--- Result ---
customerNumber	customerName	country
103	Atelier graphique	France
114	Australian Collectors, Co.	Australia
119	La Rochelle Gifts	France
121	Baane Mini Imports	Norway
125	Havel & Zbyszek Co	Poland
128	Blauer See Auto, Co.	Germany
141	Euro+ Shopping Channel	Spain
144	Volvo Model Replicas, Co	Sweden
145	Danish Wholesale Imports	Denmark
146	Saveley & Henriot, Co.	France
148	Dragon Souveniers, Ltd.	Singapore
166	Handji Gifts& Co	Singapore
167	Herkku Gifts	Norway  
169	Porto Imports Co.	Portugal
171	Daedalus Designs Imports	France
172	La Corne D'abondance, Co.	France
177	Osaka Souveniers Co.	Japan
186	Toys of Finland, Co.	Finland
187	AV Stores, Co.	UK
189	Clover Collections, Co.	Ireland
201	UK Collectables, Ltd.	UK
202	Canadian Gift Exchange Network	Canada
206	Asian Shopping Network, Co	Singapore
209	Mini Caravy	France
211	King Kong Collectables, Co.	Hong Kong
216	Enaco Distributors	Spain
223	Natürlich Autos	Germany
227	Heintze Collectables	Denmark
233	Québec Home Shopping Network	Canada
237	ANG Resellers	Spain
240	giftsbymail.co.uk	UK
242	Alpha Cognac	France
247	Messner Shopping Network	Germany
249	Amica Models & Co.	Italy
250	Lyon Souveniers	France
256	Auto Associés & Cie.	France
259	Toms Spezialitäten, Ltd	Germany
260	Royal Canadian Collectables, Ltd.	Canada
273	Franken Gifts, Co	Germany
276	Anna's Decorations, Ltd	Australia
278	Rovelli Gifts	Italy
282	Souveniers And Things Co.	Australia
293	BG&E Collectables	Switzerland
298	Vida Sport, Ltd	Switzerland
299	Norway Gifts By Mail, Co.	Norway  
303	Schuyler Imports	Netherlands
307	Der Hund Imports	Germany
311	Oulu Toy Supplies, Inc.	Finland
314	Petit Auto	Belgium
323	Down Under Souveniers, Inc	New Zealand
324	Stylish Desk Decors, Co.	UK
333	Australian Gift Network, Co	Australia
334	Suominen Souveniers	Finland
335	Cramer Spezialitäten, Ltd	Germany
344	CAF Imports	Spain
348	Asian Treasures, Inc.	Ireland
350	Marseille Mini Autos	France
353	Reims Collectables	France
356	SAR Distributors, Co	South Africa
357	GiftsForHim.com	New Zealand
361	Kommission Auto	Germany
369	Lisboa Souveniers, Inc	Portugal
376	Precious Collectables	Switzerland
381	Royale Belge	Belgium
382	Salzburg Collectables	Austria
385	Cruz & Sons Co.	Philippines
386	L'ordine Souveniers	Italy
398	Tokyo Collectables, Ltd	Japan
406	Auto Canal+ Petit	France
409	Stuttgart Collectable Exchange	Germany
412	Extreme Desk Decorations, Ltd	New Zealand
415	Bavarian Collectables Imports, Co.	Germany
443	Feuer Online Stores, Inc	Germany
448	Scandinavian Gift Ideas	Sweden
452	Mini Auto Werke	Austria
458	Corrida Auto Replicas, Ltd	Spain
459	Warburg Exchange	Germany
465	Anton Designs, Ltd.	Spain
471	Australian Collectables, Ltd	Australia
473	Frau da Collezione	Italy
477	Mit Vergnügen & Co.	Germany
480	Kremlin Collectables, Co.	Russia
481	Raanan Stores, Inc	Israel
484	Iberia Gift Imports, Corp.	Spain
489	Double Decker Gift Stores, Ltd	UK
496	Kelly's Gift Shop	New Zealand
--- End Result (Success) ---

==============================

-- Query 4: Orders with status 'Shipped' AND required date before 2005-01-01
--- Result ---
orderNumber	orderDate	requiredDate	status
10100	2003-01-06	2003-01-13	Shipped
10101	2003-01-09	2003-01-18	Shipped
10102	2003-01-10	2003-01-18	Shipped
10103	2003-01-29	2003-02-07	Shipped
10104	2003-01-31	2003-02-09	Shipped
10105	2003-02-11	2003-02-21	Shipped
10106	2003-02-17	2003-02-24	Shipped
10107	2003-02-24	2003-03-03	Shipped
10108	2003-03-03	2003-03-12	Shipped
10109	2003-03-10	2003-03-19	Shipped
10110	2003-03-18	2003-03-24	Shipped
10111	2003-03-25	2003-03-31	Shipped
10112	2003-03-24	2003-04-03	Shipped
10113	2003-03-26	2003-04-02	Shipped
10114	2003-04-01	2003-04-07	Shipped
10115	2003-04-04	2003-04-12	Shipped
10116	2003-04-11	2003-04-19	Shipped
10117	2003-04-16	2003-04-24	Shipped
10118	2003-04-21	2003-04-29	Shipped
10119	2003-04-28	2003-05-05	Shipped
10120	2003-04-29	2003-05-08	Shipped
10121	2003-05-07	2003-05-13	Shipped
10122	2003-05-08	2003-05-16	Shipped
10123	2003-05-20	2003-05-29	Shipped
10124	2003-05-21	2003-05-29	Shipped
10125	2003-05-21	2003-05-27	Shipped
10126	2003-05-28	2003-06-07	Shipped
10127	2003-06-03	2003-06-09	Shipped
10128	2003-06-06	2003-06-12	Shipped
10129	2003-06-12	2003-06-18	Shipped
10130	2003-06-16	2003-06-24	Shipped
10131	2003-06-16	2003-06-25	Shipped
10132	2003-06-25	2003-07-01	Shipped
10133	2003-06-27	2003-07-04	Shipped
10134	2003-07-01	2003-07-10	Shipped
10135	2003-07-02	2003-07-12	Shipped
10136	2003-07-04	2003-07-14	Shipped
10137	2003-07-10	2003-07-20	Shipped
10138	2003-07-07	2003-07-16	Shipped
10139	2003-07-16	2003-07-23	Shipped
10140	2003-07-24	2003-08-02	Shipped
10141	2003-08-01	2003-08-09	Shipped
10142	2003-08-08	2003-08-16	Shipped
10143	2003-08-10	2003-08-18	Shipped
10144	2003-08-13	2003-08-21	Shipped
10145	2003-08-25	2003-09-02	Shipped
10146	2003-09-03	2003-09-13	Shipped
10147	2003-09-05	2003-09-12	Shipped
10148	2003-09-11	2003-09-21	Shipped
10149	2003-09-12	2003-09-18	Shipped
10150	2003-09-19	2003-09-27	Shipped
10151	2003-09-21	2003-09-30	Shipped
10152	2003-09-25	2003-10-03	Shipped
10153	2003-09-28	2003-10-05	Shipped
10154	2003-10-02	2003-10-12	Shipped
10155	2003-10-06	2003-10-13	Shipped
10156	2003-10-08	2003-10-17	Shipped
10157	2003-10-09	2003-10-15	Shipped
10158	2003-10-10	2003-10-18	Shipped
10159	2003-10-10	2003-10-19	Shipped
10160	2003-10-11	2003-10-17	Shipped
10161	2003-10-17	2003-10-25	Shipped
10162	2003-10-18	2003-10-26	Shipped
10163	2003-10-20	2003-10-27	Shipped
10165	2003-10-22	2003-10-31	Shipped
10166	2003-10-21	2003-10-30	Shipped
10168	2003-10-28	2003-11-03	Shipped
10169	2003-11-04	2003-11-14	Shipped
10170	2003-11-04	2003-11-12	Shipped
10171	2003-11-05	2003-11-13	Shipped
10172	2003-11-05	2003-11-14	Shipped
10173	2003-11-05	2003-11-15	Shipped
10174	2003-11-06	2003-11-15	Shipped
10175	2003-11-06	2003-11-14	Shipped
10176	2003-11-06	2003-11-15	Shipped
10177	2003-11-07	2003-11-17	Shipped
10178	2003-11-08	2003-11-16	Shipped
10180	2003-11-11	2003-11-19	Shipped
10181	2003-11-12	2003-11-19	Shipped
10182	2003-11-12	2003-11-21	Shipped
10183	2003-11-13	2003-11-22	Shipped
10184	2003-11-14	2003-11-22	Shipped
10185	2003-11-14	2003-11-21	Shipped
10186	2003-11-14	2003-11-20	Shipped
10187	2003-11-15	2003-11-24	Shipped
10188	2003-11-18	2003-11-26	Shipped
10189	2003-11-18	2003-11-25	Shipped
10190	2003-11-19	2003-11-29	Shipped
10191	2003-11-20	2003-11-30	Shipped
10192	2003-11-20	2003-11-29	Shipped
10193	2003-11-21	2003-11-28	Shipped
10194	2003-11-25	2003-12-02	Shipped
10195	2003-11-25	2003-12-01	Shipped
10196	2003-11-26	2003-12-03	Shipped
10197	2003-11-26	2003-12-02	Shipped
10198	2003-11-27	2003-12-06	Shipped
10199	2003-12-01	2003-12-10	Shipped
10200	2003-12-01	2003-12-09	Shipped
10201	2003-12-01	2003-12-11	Shipped
10202	2003-12-02	2003-12-09	Shipped
10203	2003-12-02	2003-12-11	Shipped
10204	2003-12-02	2003-12-10	Shipped
10205	2003-12-03	2003-12-09	Shipped
10206	2003-12-05	2003-12-13	Shipped
10207	2003-12-09	2003-12-17	Shipped
10208	2004-01-02	2004-01-11	Shipped
10209	2004-01-09	2004-01-15	Shipped
10210	2004-01-12	2004-01-22	Shipped
10211	2004-01-15	2004-01-25	Shipped
10212	2004-01-16	2004-01-24	Shipped
10213	2004-01-22	2004-01-28	Shipped
10214	2004-01-26	2004-02-04	Shipped
10215	2004-01-29	2004-02-08	Shipped
10216	2004-02-02	2004-02-10	Shipped
10217	2004-02-04	2004-02-14	Shipped
10218	2004-02-09	2004-02-16	Shipped
10219	2004-02-10	2004-02-17	Shipped
10220	2004-02-12	2004-02-19	Shipped
10221	2004-02-18	2004-02-26	Shipped
10222	2004-02-19	2004-02-27	Shipped
10223	2004-02-20	2004-02-29	Shipped
10224	2004-02-21	2004-03-02	Shipped
10225	2004-02-22	2004-03-01	Shipped
10226	2004-02-26	2004-03-06	Shipped
10227	2004-03-02	2004-03-12	Shipped
10228	2004-03-10	2004-03-18	Shipped
10229	2004-03-11	2004-03-20	Shipped
10230	2004-03-15	2004-03-24	Shipped
10231	2004-03-19	2004-03-26	Shipped
10232	2004-03-20	2004-03-30	Shipped
10233	2004-03-29	2004-04-04	Shipped
10234	2004-03-30	2004-04-05	Shipped
10235	2004-04-02	2004-04-12	Shipped
10236	2004-04-03	2004-04-11	Shipped
10237	2004-04-05	2004-04-12	Shipped
10238	2004-04-09	2004-04-16	Shipped
10239	2004-04-12	2004-04-21	Shipped
10240	2004-04-13	2004-04-20	Shipped
10241	2004-04-13	2004-04-20	Shipped
10242	2004-04-20	2004-04-28	Shipped
10243	2004-04-26	2004-05-03	Shipped
10244	2004-04-29	2004-05-09	Shipped
10245	2004-05-04	2004-05-12	Shipped
10246	2004-05-05	2004-05-13	Shipped
10247	2004-05-05	2004-05-11	Shipped
10249	2004-05-08	2004-05-17	Shipped
10250	2004-05-11	2004-05-19	Shipped
10251	2004-05-18	2004-05-24	Shipped
10252	2004-05-26	2004-06-04	Shipped
10254	2004-06-03	2004-06-13	Shipped
10255	2004-06-04	2004-06-12	Shipped
10256	2004-06-08	2004-06-16	Shipped
10257	2004-06-14	2004-06-24	Shipped
10258	2004-06-15	2004-06-25	Shipped
10259	2004-06-15	2004-06-22	Shipped
10261	2004-06-17	2004-06-25	Shipped
10263	2004-06-28	2004-07-04	Shipped
10264	2004-06-30	2004-07-06	Shipped
10265	2004-07-02	2004-07-09	Shipped
10266	2004-07-06	2004-07-14	Shipped
10267	2004-07-07	2004-07-17	Shipped
10268	2004-07-12	2004-07-18	Shipped
10269	2004-07-16	2004-07-22	Shipped
10270	2004-07-19	2004-07-27	Shipped
10271	2004-07-20	2004-07-29	Shipped
10272	2004-07-20	2004-07-26	Shipped
10273	2004-07-21	2004-07-28	Shipped
10274	2004-07-21	2004-07-29	Shipped
10275	2004-07-23	2004-08-02	Shipped
10276	2004-08-02	2004-08-11	Shipped
10277	2004-08-04	2004-08-12	Shipped
10278	2004-08-06	2004-08-16	Shipped
10279	2004-08-09	2004-08-19	Shipped
10280	2004-08-17	2004-08-27	Shipped
10281	2004-08-19	2004-08-28	Shipped
10282	2004-08-20	2004-08-26	Shipped
10283	2004-08-20	2004-08-30	Shipped
10284	2004-08-21	2004-08-29	Shipped
10285	2004-08-27	2004-09-04	Shipped
10286	2004-08-28	2004-09-06	Shipped
10287	2004-08-30	2004-09-06	Shipped
10288	2004-09-01	2004-09-11	Shipped
10289	2004-09-03	2004-09-13	Shipped
10290	2004-09-07	2004-09-15	Shipped
10291	2004-09-08	2004-09-17	Shipped
10292	2004-09-08	2004-09-18	Shipped
10293	2004-09-09	2004-09-18	Shipped
10294	2004-09-10	2004-09-17	Shipped
10295	2004-09-10	2004-09-17	Shipped
10296	2004-09-15	2004-09-22	Shipped
10297	2004-09-16	2004-09-22	Shipped
10298	2004-09-27	2004-10-05	Shipped
10299	2004-09-30	2004-10-10	Shipped
10300	2003-10-04	2003-10-13	Shipped
10301	2003-10-05	2003-10-15	Shipped
10302	2003-10-06	2003-10-16	Shipped
10303	2004-10-06	2004-10-14	Shipped
10304	2004-10-11	2004-10-20	Shipped
10305	2004-10-13	2004-10-22	Shipped
10306	2004-10-14	2004-10-21	Shipped
10307	2004-10-14	2004-10-23	Shipped
10308	2004-10-15	2004-10-24	Shipped
10309	2004-10-15	2004-10-24	Shipped
10310	2004-10-16	2004-10-24	Shipped
10311	2004-10-16	2004-10-23	Shipped
10312	2004-10-21	2004-10-27	Shipped
10313	2004-10-22	2004-10-28	Shipped
10314	2004-10-22	2004-11-01	Shipped
10315	2004-10-29	2004-11-08	Shipped
10316	2004-11-01	2004-11-09	Shipped
10317	2004-11-02	2004-11-12	Shipped
10318	2004-11-02	2004-11-09	Shipped
10319	2004-11-03	2004-11-11	Shipped
10320	2004-11-03	2004-11-13	Shipped
10321	2004-11-04	2004-11-12	Shipped
10322	2004-11-04	2004-11-12	Shipped
10323	2004-11-05	2004-11-12	Shipped
10324	2004-11-05	2004-11-11	Shipped
10325	2004-11-05	2004-11-13	Shipped
10326	2004-11-09	2004-11-16	Shipped
10328	2004-11-12	2004-11-21	Shipped
10329	2004-11-15	2004-11-24	Shipped
10330	2004-11-16	2004-11-25	Shipped
10331	2004-11-17	2004-11-23	Shipped
10332	2004-11-17	2004-11-25	Shipped
10333	2004-11-18	2004-11-27	Shipped
10335	2004-11-19	2004-11-29	Shipped
10336	2004-11-20	2004-11-26	Shipped
10337	2004-11-21	2004-11-30	Shipped
10338	2004-11-22	2004-12-02	Shipped
10339	2004-11-23	2004-11-30	Shipped
10340	2004-11-24	2004-12-01	Shipped
10341	2004-11-24	2004-12-01	Shipped
10342	2004-11-24	2004-12-01	Shipped
10343	2004-11-24	2004-12-01	Shipped
10344	2004-11-25	2004-12-02	Shipped
10345	2004-11-25	2004-12-01	Shipped
10346	2004-11-29	2004-12-05	Shipped
10347	2004-11-29	2004-12-07	Shipped
10348	2004-11-01	2004-11-08	Shipped
10349	2004-12-01	2004-12-07	Shipped
10350	2004-12-02	2004-12-08	Shipped
10351	2004-12-03	2004-12-11	Shipped
10352	2004-12-03	2004-12-12	Shipped
10353	2004-12-04	2004-12-11	Shipped
10354	2004-12-04	2004-12-10	Shipped
10355	2004-12-07	2004-12-14	Shipped
10356	2004-12-09	2004-12-15	Shipped
10357	2004-12-10	2004-12-16	Shipped
10358	2004-12-10	2004-12-16	Shipped
10359	2004-12-15	2004-12-23	Shipped
10360	2004-12-16	2004-12-22	Shipped
10361	2004-12-17	2004-12-24	Shipped
--- End Result (Success) ---

==============================

-- Query 5: Products priced between 50 and 100 OR with quantityInStock > 500
--- Result ---
productCode	productName	buyPrice	quantityInStock
S10_1678	1969 Harley Davidson Ultimate Chopper	48.81	7933
S10_1949	1952 Alpine Renault 1300	98.58	7305
S10_2016	1996 Moto Guzzi 1100i	68.99	6625
S10_4698	2003 Harley-Davidson Eagle Drag Bike	91.02	5582
S10_4757	1972 Alfa Romeo GTA	85.68	3252
S10_4962	1962 LanciaA Delta 16V	103.42	6791
S12_1099	1968 Ford Mustang	95.34	68
S12_1108	2001 Ferrari Enzo	95.59	3619
S12_1666	1958 Setra Bus	77.90	1579
S12_2823	2002 Suzuki XREO	66.27	9997
S12_3148	1969 Corvair Monza	89.14	6906
S12_3380	1968 Dodge Charger	75.16	9123
S12_3891	1969 Ford Falcon	83.05	1049
S12_3990	1970 Plymouth Hemi Cuda	31.92	5663
S12_4473	1957 Chevy Pickup	55.70	6125
S12_4675	1969 Dodge Charger	58.73	7323
S18_1097	1940 Ford Pickup Truck	58.33	2613
S18_1129	1993 Mazda RX-7	83.51	3975
S18_1342	1937 Lincoln Berline	60.62	8693
S18_1367	1936 Mercedes-Benz 500K Special Roadster	24.26	8635
S18_1589	1965 Aston Martin DB5	65.96	9042
S18_1662	1980s Black Hawk Helicopter	77.27	5330
S18_1749	1917 Grand Touring Sedan	86.70	2724
S18_1889	1948 Porsche 356-A Roadster	53.90	8826
S18_1984	1995 Honda Civic	93.89	9772
S18_2238	1998 Chrysler Plymouth Prowler	101.51	4724
S18_2248	1911 Ford Town Car	33.30	540
S18_2319	1964 Mercedes Tour Bus	74.86	8258
S18_2325	1932 Model A Ford J-Coupe	58.48	9354
S18_2432	1926 Ford Fire Engine	24.92	2018
S18_2581	P-51-D Mustang	49.00	992
S18_2625	1936 Harley Davidson El Knucklehead	24.23	4357
S18_2795	1928 Mercedes-Benz SSK	72.56	548
S18_2870	1999 Indy 500 Monte Carlo SS	56.76	8164
S18_2949	1913 Ford Model T Speedster	60.78	4189
S18_2957	1934 Ford V8 Coupe	34.35	5649
S18_3029	1999 Yamaha Speed Boat	51.61	4259
S18_3136	18th Century Vintage Horse Carriage	60.74	5992
S18_3140	1903 Ford Model A	68.30	3913
S18_3232	1992 Ferrari 360 Spider red	77.90	8347
S18_3233	1985 Toyota Supra	57.01	7733
S18_3259	Collectable Wooden Train	67.56	6450
S18_3278	1969 Dodge Super Bee	49.05	1917
S18_3320	1917 Maxwell Touring Car	57.54	7913
S18_3482	1976 Ford Gran Torino	73.49	9127
S18_3685	1948 Porsche Type 356 Roadster	62.16	8990
S18_3782	1957 Vespa GS150	32.95	7689
S18_3856	1941 Chevrolet Special Deluxe Cabriolet	64.58	2378
S18_4027	1970 Triumph Spitfire	91.92	5545
S18_4409	1932 Alfa Romeo 8C2300 Spider Sport	43.26	6553
S18_4522	1904 Buick Runabout	52.66	8290
S18_4600	1940s Ford truck	84.76	3128
S18_4668	1939 Cadillac Limousine	23.14	6645
S18_4721	1957 Corvette Convertible	69.93	1249
S18_4933	1957 Ford Thunderbird	34.21	3209
S24_1046	1970 Chevy Chevelle SS 454	49.24	1005
S24_1444	1970 Dodge Coronet	32.37	4074
S24_1578	1997 BMW R 1100 S	60.86	7003
S24_1628	1966 Shelby Cobra 427 S/C	29.18	8197
S24_1785	1928 British Royal Navy Airplane	66.74	3627
S24_1937	1939 Chevrolet Deluxe Coupe	22.57	7332
S24_2011	18th century schooner	82.34	1898
S24_2022	1938 Cadillac V-16 Presidential Limousine	20.61	2847
S24_2300	1962 Volkswagen Microbus	61.34	2327
S24_2360	1982 Ducati 900 Monster	47.10	6840
S24_2766	1949 Jaguar XK 120	47.25	2350
S24_2840	1958 Chevy Corvette Limited Edition	15.91	2542
S24_2841	1900s Vintage Bi-Plane	34.25	5942
S24_2887	1952 Citroen-15CV	72.82	1452
S24_2972	1982 Lamborghini Diablo	16.24	7723
S24_3151	1912 Ford Model T Delivery Wagon	46.91	9173
S24_3191	1969 Chevrolet Camaro Z28	50.51	4695
S24_3371	1971 Alpine Renault 1600s	38.58	7995
S24_3420	1937 Horch 930V Limousine	26.30	2902
S24_3432	2002 Chevy Corvette	62.11	9446
S24_3816	1940 Ford Delivery Sedan	48.64	6621
S24_3856	1956 Porsche 356A Coupe	98.30	6600
S24_3949	Corsair F4U ( Bird Cage)	29.34	6812
S24_3969	1936 Mercedes Benz 500k Roadster	21.75	2081
S24_4048	1992 Porsche Cayenne Turbo Silver	69.78	6582
S24_4258	1936 Chrysler Airflow	57.46	4710
S24_4278	1900s Vintage Tri-Plane	36.23	2756
S24_4620	1961 Chevrolet Impala	32.33	7869
S32_1268	1980’s GM Manhattan Express	53.93	5099
S32_1374	1997 BMW F650 ST	66.92	178
S32_2206	1982 Ducati 996 R	24.14	9241
S32_2509	1954 Greyhound Scenicruiser	25.98	2874
S32_3207	1950's Chicago Surface Lines Streetcar	26.72	8601
S32_3522	1996 Peterbilt 379 Stake Bed with Outrigger	33.61	814
S32_4485	1974 Ducati 350 Mk3 Desmo	56.13	3341
S50_1341	1930 Buick Marquette Phaeton	27.06	7062
S50_1392	Diamond T620 Semi-Skirted Tanker	68.29	1016
S50_1514	1962 City of Detroit Streetcar	37.49	1645
S50_4713	2002 Yamaha YZR M1	34.17	600
S700_1138	The Schooner Bluenose	34.00	1897
S700_1691	American Airlines: B767-300	51.15	5841
S700_1938	The Mayflower	43.30	737
S700_2047	HMS Bounty	39.83	3501
S700_2466	America West Airlines B757-200	68.80	9653
S700_2610	The USS Constitution Ship	33.97	7083
S700_2824	1982 Camaro Z28	46.53	6934
S700_2834	ATA: B757-300	59.33	7106
S700_3167	F/A 18 Hornet 1/72	54.40	551
S700_3505	The Titanic	51.09	1956
S700_3962	The Queen Mary	53.63	5088
S700_4002	American Airlines: MD-11S	36.27	8820
S72_1253	Boeing X-32A JSF	32.77	4857
--- End Result (Success) ---

==============================

-- Query 6: Employees in office 1 OR 4 AND with job title 'Sales Rep'
--- Result ---
employeeNumber	firstName	lastName	officeCode	jobTitle
1165	Leslie	Jennings	1	Sales Rep
1166	Leslie	Thompson	1	Sales Rep
1337	Loui	Bondur	4	Sales Rep
1370	Gerard	Hernandez	4	Sales Rep
1401	Pamela	Castillo	4	Sales Rep
1702	Martin	Gerard	4	Sales Rep
--- End Result (Success) ---

==============================

-- Query 7: Customers from Germany, France, or Italy AND with credit limit < 50000
--- Result ---
customerName	country	creditLimit
Atelier graphique	France	21000.00
Natürlich Autos	Germany	0.00
Messner Shopping Network	Germany	0.00
Franken Gifts, Co	Germany	0.00
Der Hund Imports	Germany	0.00
Cramer Spezialitäten, Ltd	Germany	0.00
Kommission Auto	Germany	0.00
Stuttgart Collectable Exchange	Germany	0.00
Feuer Online Stores, Inc	Germany	0.00
Warburg Exchange	Germany	0.00
Frau da Collezione	Italy	34800.00
Mit Vergnügen & Co.	Germany	0.00
--- End Result (Success) ---

==============================

-- Query 8: Orders that are either 'Cancelled' or required before 2003 AND status is not 'Shipped'
--- Result ---
orderNumber	orderDate	requiredDate	status
10167	2003-10-23	2003-10-30	Cancelled
10179	2003-11-11	2003-11-17	Cancelled
10248	2004-05-07	2004-05-14	Cancelled
10253	2004-06-01	2004-06-09	Cancelled
10260	2004-06-16	2004-06-22	Cancelled
10262	2004-06-24	2004-07-01	Cancelled
--- End Result (Success) ---

==============================

