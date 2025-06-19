Using database: classicmodels

-- Query 1: INNER JOIN - List employees and their office city and country
--- Result ---
employeeNumber	firstName	lastName	city	country
1002	Diane	Murphy	San Francisco	USA
1056	Mary	Patterson	San Francisco	USA
1076	Jeff	Firrelli	San Francisco	USA
1143	Anthony	Bow	San Francisco	USA
1165	Leslie	Jennings	San Francisco	USA
1166	Leslie	Thompson	San Francisco	USA
1188	Julie	Firrelli	Boston	USA
1216	Steve	Patterson	Boston	USA
1286	Foon Yue	Tseng	NYC	USA
1323	George	Vanauf	NYC	USA
1102	Gerard	Bondur	Paris	France
1337	Loui	Bondur	Paris	France
1370	Gerard	Hernandez	Paris	France
1401	Pamela	Castillo	Paris	France
1702	Martin	Gerard	Paris	France
1621	Mami	Nishi	Tokyo	Japan
1625	Yoshimi	Kato	Tokyo	Japan
1088	William	Patterson	Sydney	Australia
1611	Andy	Fixter	Sydney	Australia
1612	Peter	Marsh	Sydney	Australia
1619	Tom	King	Sydney	Australia
1501	Larry	Bott	London	UK
1504	Barry	Jones	London	UK
--- End Result (Success) ---

==============================

-- Query 2: LEFT JOIN - List all customers and any orders they may have
--- Result ---
customerNumber	customerName	orderNumber	orderDate
103	Atelier graphique	10123	2003-05-20
103	Atelier graphique	10298	2004-09-27
103	Atelier graphique	10345	2004-11-25
112	Signal Gift Stores	10124	2003-05-21
112	Signal Gift Stores	10278	2004-08-06
112	Signal Gift Stores	10346	2004-11-29
114	Australian Collectors, Co.	10120	2003-04-29
114	Australian Collectors, Co.	10125	2003-05-21
114	Australian Collectors, Co.	10223	2004-02-20
114	Australian Collectors, Co.	10342	2004-11-24
114	Australian Collectors, Co.	10347	2004-11-29
119	La Rochelle Gifts	10275	2004-07-23
119	La Rochelle Gifts	10315	2004-10-29
119	La Rochelle Gifts	10375	2005-02-03
119	La Rochelle Gifts	10425	2005-05-31
121	Baane Mini Imports	10103	2003-01-29
121	Baane Mini Imports	10158	2003-10-10
121	Baane Mini Imports	10309	2004-10-15
121	Baane Mini Imports	10325	2004-11-05
124	Mini Gifts Distributors Ltd.	10113	2003-03-26
124	Mini Gifts Distributors Ltd.	10135	2003-07-02
124	Mini Gifts Distributors Ltd.	10142	2003-08-08
124	Mini Gifts Distributors Ltd.	10182	2003-11-12
124	Mini Gifts Distributors Ltd.	10229	2004-03-11
124	Mini Gifts Distributors Ltd.	10271	2004-07-20
124	Mini Gifts Distributors Ltd.	10282	2004-08-20
124	Mini Gifts Distributors Ltd.	10312	2004-10-21
124	Mini Gifts Distributors Ltd.	10335	2004-11-19
124	Mini Gifts Distributors Ltd.	10357	2004-12-10
124	Mini Gifts Distributors Ltd.	10368	2005-01-19
124	Mini Gifts Distributors Ltd.	10371	2005-01-23
124	Mini Gifts Distributors Ltd.	10382	2005-02-17
124	Mini Gifts Distributors Ltd.	10385	2005-02-28
124	Mini Gifts Distributors Ltd.	10390	2005-03-04
124	Mini Gifts Distributors Ltd.	10396	2005-03-23
124	Mini Gifts Distributors Ltd.	10421	2005-05-29
125	Havel & Zbyszek Co	NULL	NULL
128	Blauer See Auto, Co.	10101	2003-01-09
128	Blauer See Auto, Co.	10230	2004-03-15
128	Blauer See Auto, Co.	10300	2003-10-04
128	Blauer See Auto, Co.	10323	2004-11-05
129	Mini Wheels Co.	10111	2003-03-25
129	Mini Wheels Co.	10201	2003-12-01
129	Mini Wheels Co.	10333	2004-11-18
131	Land of Toys Inc.	10107	2003-02-24
131	Land of Toys Inc.	10248	2004-05-07
131	Land of Toys Inc.	10292	2004-09-08
131	Land of Toys Inc.	10329	2004-11-15
141	Euro+ Shopping Channel	10104	2003-01-31
141	Euro+ Shopping Channel	10128	2003-06-06
141	Euro+ Shopping Channel	10133	2003-06-27
141	Euro+ Shopping Channel	10153	2003-09-28
141	Euro+ Shopping Channel	10156	2003-10-08
141	Euro+ Shopping Channel	10190	2003-11-19
141	Euro+ Shopping Channel	10203	2003-12-02
141	Euro+ Shopping Channel	10205	2003-12-03
141	Euro+ Shopping Channel	10212	2004-01-16
141	Euro+ Shopping Channel	10244	2004-04-29
141	Euro+ Shopping Channel	10246	2004-05-05
141	Euro+ Shopping Channel	10262	2004-06-24
141	Euro+ Shopping Channel	10279	2004-08-09
141	Euro+ Shopping Channel	10311	2004-10-16
141	Euro+ Shopping Channel	10350	2004-12-02
141	Euro+ Shopping Channel	10355	2004-12-07
141	Euro+ Shopping Channel	10358	2004-12-10
141	Euro+ Shopping Channel	10378	2005-02-10
141	Euro+ Shopping Channel	10379	2005-02-10
141	Euro+ Shopping Channel	10380	2005-02-16
141	Euro+ Shopping Channel	10383	2005-02-22
141	Euro+ Shopping Channel	10386	2005-03-01
141	Euro+ Shopping Channel	10394	2005-03-15
141	Euro+ Shopping Channel	10412	2005-05-03
141	Euro+ Shopping Channel	10417	2005-05-13
141	Euro+ Shopping Channel	10424	2005-05-31
144	Volvo Model Replicas, Co	10112	2003-03-24
144	Volvo Model Replicas, Co	10320	2004-11-03
144	Volvo Model Replicas, Co	10326	2004-11-09
144	Volvo Model Replicas, Co	10334	2004-11-19
145	Danish Wholesale Imports	10105	2003-02-11
145	Danish Wholesale Imports	10238	2004-04-09
145	Danish Wholesale Imports	10256	2004-06-08
145	Danish Wholesale Imports	10327	2004-11-10
145	Danish Wholesale Imports	10406	2005-04-15
146	Saveley & Henriot, Co.	10194	2003-11-25
146	Saveley & Henriot, Co.	10208	2004-01-02
146	Saveley & Henriot, Co.	10227	2004-03-02
148	Dragon Souveniers, Ltd.	10117	2003-04-16
148	Dragon Souveniers, Ltd.	10150	2003-09-19
148	Dragon Souveniers, Ltd.	10165	2003-10-22
148	Dragon Souveniers, Ltd.	10277	2004-08-04
148	Dragon Souveniers, Ltd.	10387	2005-03-02
151	Muscle Machine Inc	10127	2003-06-03
151	Muscle Machine Inc	10204	2003-12-02
151	Muscle Machine Inc	10267	2004-07-07
151	Muscle Machine Inc	10349	2004-12-01
157	Diecast Classics Inc.	10272	2004-07-20
157	Diecast Classics Inc.	10281	2004-08-19
157	Diecast Classics Inc.	10318	2004-11-02
157	Diecast Classics Inc.	10422	2005-05-30
161	Technics Stores Inc.	10140	2003-07-24
161	Technics Stores Inc.	10168	2003-10-28
161	Technics Stores Inc.	10317	2004-11-02
161	Technics Stores Inc.	10362	2005-01-05
166	Handji Gifts& Co	10217	2004-02-04
166	Handji Gifts& Co	10259	2004-06-15
166	Handji Gifts& Co	10288	2004-09-01
166	Handji Gifts& Co	10409	2005-04-23
167	Herkku Gifts	10181	2003-11-12
167	Herkku Gifts	10188	2003-11-18
167	Herkku Gifts	10289	2004-09-03
168	American Souvenirs Inc	NULL	NULL
169	Porto Imports Co.	NULL	NULL
171	Daedalus Designs Imports	10180	2003-11-11
171	Daedalus Designs Imports	10224	2004-02-21
172	La Corne D'abondance, Co.	10114	2003-04-01
172	La Corne D'abondance, Co.	10286	2004-08-28
172	La Corne D'abondance, Co.	10336	2004-11-20
173	Cambridge Collectables Co.	10228	2004-03-10
173	Cambridge Collectables Co.	10249	2004-05-08
175	Gift Depot Inc.	10172	2003-11-05
175	Gift Depot Inc.	10263	2004-06-28
175	Gift Depot Inc.	10413	2005-05-05
177	Osaka Souveniers Co.	10210	2004-01-12
177	Osaka Souveniers Co.	10240	2004-04-13
181	Vitachrome Inc.	10102	2003-01-10
181	Vitachrome Inc.	10237	2004-04-05
181	Vitachrome Inc.	10324	2004-11-05
186	Toys of Finland, Co.	10155	2003-10-06
186	Toys of Finland, Co.	10299	2004-09-30
186	Toys of Finland, Co.	10377	2005-02-09
187	AV Stores, Co.	10110	2003-03-18
187	AV Stores, Co.	10306	2004-10-14
187	AV Stores, Co.	10332	2004-11-17
189	Clover Collections, Co.	10220	2004-02-12
189	Clover Collections, Co.	10297	2004-09-16
198	Auto-Moto Classics Inc.	10130	2003-06-16
198	Auto-Moto Classics Inc.	10290	2004-09-07
198	Auto-Moto Classics Inc.	10352	2004-12-03
201	UK Collectables, Ltd.	10253	2004-06-01
201	UK Collectables, Ltd.	10302	2003-10-06
201	UK Collectables, Ltd.	10403	2005-04-08
202	Canadian Gift Exchange Network	10206	2003-12-05
202	Canadian Gift Exchange Network	10313	2004-10-22
204	Online Mini Collectables	10276	2004-08-02
204	Online Mini Collectables	10294	2004-09-10
205	Toys4GrownUps.com	10145	2003-08-25
205	Toys4GrownUps.com	10189	2003-11-18
205	Toys4GrownUps.com	10367	2005-01-12
206	Asian Shopping Network, Co	NULL	NULL
209	Mini Caravy	10241	2004-04-13
209	Mini Caravy	10255	2004-06-04
209	Mini Caravy	10405	2005-04-14
211	King Kong Collectables, Co.	10187	2003-11-15
211	King Kong Collectables, Co.	10200	2003-12-01
216	Enaco Distributors	10118	2003-04-21
216	Enaco Distributors	10197	2003-11-26
216	Enaco Distributors	10340	2004-11-24
219	Boards & Toys Co.	10154	2003-10-02
219	Boards & Toys Co.	10376	2005-02-08
223	Natürlich Autos	NULL	NULL
227	Heintze Collectables	10161	2003-10-17
227	Heintze Collectables	10314	2004-10-22
233	Québec Home Shopping Network	10171	2003-11-05
233	Québec Home Shopping Network	10261	2004-06-17
233	Québec Home Shopping Network	10411	2005-05-01
237	ANG Resellers	NULL	NULL
239	Collectable Mini Designs Co.	10222	2004-02-19
239	Collectable Mini Designs Co.	10226	2004-02-26
240	giftsbymail.co.uk	10232	2004-03-20
240	giftsbymail.co.uk	10316	2004-11-01
242	Alpha Cognac	10136	2003-07-04
242	Alpha Cognac	10178	2003-11-08
242	Alpha Cognac	10397	2005-03-28
247	Messner Shopping Network	NULL	NULL
249	Amica Models & Co.	10280	2004-08-17
249	Amica Models & Co.	10293	2004-09-09
250	Lyon Souveniers	10134	2003-07-01
250	Lyon Souveniers	10356	2004-12-09
250	Lyon Souveniers	10395	2005-03-17
256	Auto Associés & Cie.	10216	2004-02-02
256	Auto Associés & Cie.	10304	2004-10-11
259	Toms Spezialitäten, Ltd	10191	2003-11-20
259	Toms Spezialitäten, Ltd	10310	2004-10-16
260	Royal Canadian Collectables, Ltd.	10235	2004-04-02
260	Royal Canadian Collectables, Ltd.	10283	2004-08-20
273	Franken Gifts, Co	NULL	NULL
276	Anna's Decorations, Ltd	10148	2003-09-11
276	Anna's Decorations, Ltd	10169	2003-11-04
276	Anna's Decorations, Ltd	10370	2005-01-20
276	Anna's Decorations, Ltd	10391	2005-03-09
278	Rovelli Gifts	10106	2003-02-17
278	Rovelli Gifts	10173	2003-11-05
278	Rovelli Gifts	10328	2004-11-12
282	Souveniers And Things Co.	10139	2003-07-16
282	Souveniers And Things Co.	10270	2004-07-19
282	Souveniers And Things Co.	10361	2004-12-17
282	Souveniers And Things Co.	10420	2005-05-29
286	Marta's Replicas Co.	10285	2004-08-27
286	Marta's Replicas Co.	10305	2004-10-13
293	BG&E Collectables	NULL	NULL
298	Vida Sport, Ltd	10225	2004-02-22
298	Vida Sport, Ltd	10287	2004-08-30
299	Norway Gifts By Mail, Co.	10284	2004-08-21
299	Norway Gifts By Mail, Co.	10301	2003-10-05
303	Schuyler Imports	NULL	NULL
307	Der Hund Imports	NULL	NULL
311	Oulu Toy Supplies, Inc.	10151	2003-09-21
311	Oulu Toy Supplies, Inc.	10239	2004-04-12
311	Oulu Toy Supplies, Inc.	10373	2005-01-31
314	Petit Auto	10221	2004-02-18
314	Petit Auto	10273	2004-07-21
314	Petit Auto	10423	2005-05-30
319	Mini Classics	10195	2003-11-25
319	Mini Classics	10308	2004-10-15
320	Mini Creations Ltd.	10143	2003-08-10
320	Mini Creations Ltd.	10185	2003-11-14
320	Mini Creations Ltd.	10365	2005-01-07
321	Corporate Gift Ideas Co.	10159	2003-10-10
321	Corporate Gift Ideas Co.	10162	2003-10-18
321	Corporate Gift Ideas Co.	10381	2005-02-17
321	Corporate Gift Ideas Co.	10384	2005-02-23
323	Down Under Souveniers, Inc	10132	2003-06-25
323	Down Under Souveniers, Inc	10254	2004-06-03
323	Down Under Souveniers, Inc	10354	2004-12-04
323	Down Under Souveniers, Inc	10393	2005-03-11
323	Down Under Souveniers, Inc	10404	2005-04-08
324	Stylish Desk Decors, Co.	10129	2003-06-12
324	Stylish Desk Decors, Co.	10175	2003-11-06
324	Stylish Desk Decors, Co.	10351	2004-12-03
328	Tekni Collectables Inc.	10233	2004-03-29
328	Tekni Collectables Inc.	10251	2004-05-18
328	Tekni Collectables Inc.	10401	2005-04-03
333	Australian Gift Network, Co	10152	2003-09-25
333	Australian Gift Network, Co	10174	2003-11-06
333	Australian Gift Network, Co	10374	2005-02-02
334	Suominen Souveniers	10141	2003-08-01
334	Suominen Souveniers	10247	2004-05-05
334	Suominen Souveniers	10363	2005-01-06
335	Cramer Spezialitäten, Ltd	NULL	NULL
339	Classic Gift Ideas, Inc	10183	2003-11-13
339	Classic Gift Ideas, Inc	10307	2004-10-14
344	CAF Imports	10177	2003-11-07
344	CAF Imports	10231	2004-03-19
347	Men 'R' US Retailers, Ltd.	10160	2003-10-11
347	Men 'R' US Retailers, Ltd.	10209	2004-01-09
348	Asian Treasures, Inc.	NULL	NULL
350	Marseille Mini Autos	10122	2003-05-08
350	Marseille Mini Autos	10344	2004-11-25
350	Marseille Mini Autos	10364	2005-01-06
353	Reims Collectables	10121	2003-05-07
353	Reims Collectables	10137	2003-07-10
353	Reims Collectables	10343	2004-11-24
353	Reims Collectables	10359	2004-12-15
353	Reims Collectables	10398	2005-03-30
356	SAR Distributors, Co	NULL	NULL
357	GiftsForHim.com	10202	2003-12-02
357	GiftsForHim.com	10260	2004-06-16
357	GiftsForHim.com	10410	2005-04-29
361	Kommission Auto	NULL	NULL
362	Gifts4AllAges.com	10264	2004-06-30
362	Gifts4AllAges.com	10295	2004-09-10
362	Gifts4AllAges.com	10414	2005-05-06
363	Online Diecast Creations Co.	10100	2003-01-06
363	Online Diecast Creations Co.	10192	2003-11-20
363	Online Diecast Creations Co.	10322	2004-11-04
369	Lisboa Souveniers, Inc	NULL	NULL
376	Precious Collectables	NULL	NULL
379	Collectables For Less Inc.	10147	2003-09-05
379	Collectables For Less Inc.	10274	2004-07-21
379	Collectables For Less Inc.	10369	2005-01-20
381	Royale Belge	10116	2003-04-11
381	Royale Belge	10144	2003-08-13
381	Royale Belge	10338	2004-11-22
381	Royale Belge	10366	2005-01-10
382	Salzburg Collectables	10119	2003-04-28
382	Salzburg Collectables	10269	2004-07-16
382	Salzburg Collectables	10341	2004-11-24
382	Salzburg Collectables	10419	2005-05-17
385	Cruz & Sons Co.	10108	2003-03-03
385	Cruz & Sons Co.	10198	2003-11-27
385	Cruz & Sons Co.	10330	2004-11-16
386	L'ordine Souveniers	10176	2003-11-06
386	L'ordine Souveniers	10266	2004-07-06
386	L'ordine Souveniers	10416	2005-05-10
398	Tokyo Collectables, Ltd	10258	2004-06-15
398	Tokyo Collectables, Ltd	10339	2004-11-23
398	Tokyo Collectables, Ltd	10372	2005-01-26
398	Tokyo Collectables, Ltd	10408	2005-04-22
406	Auto Canal+ Petit	10211	2004-01-15
406	Auto Canal+ Petit	10252	2004-05-26
406	Auto Canal+ Petit	10402	2005-04-07
409	Stuttgart Collectable Exchange	NULL	NULL
412	Extreme Desk Decorations, Ltd	10234	2004-03-30
412	Extreme Desk Decorations, Ltd	10268	2004-07-12
412	Extreme Desk Decorations, Ltd	10418	2005-05-16
415	Bavarian Collectables Imports, Co.	10296	2004-09-15
424	Classic Legends Inc.	10115	2003-04-04
424	Classic Legends Inc.	10163	2003-10-20
424	Classic Legends Inc.	10337	2004-11-21
443	Feuer Online Stores, Inc	NULL	NULL
447	Gift Ideas Corp.	10131	2003-06-16
447	Gift Ideas Corp.	10146	2003-09-03
447	Gift Ideas Corp.	10353	2004-12-04
448	Scandinavian Gift Ideas	10167	2003-10-23
448	Scandinavian Gift Ideas	10291	2004-09-08
448	Scandinavian Gift Ideas	10389	2005-03-03
450	The Sharp Gifts Warehouse	10250	2004-05-11
450	The Sharp Gifts Warehouse	10257	2004-06-14
450	The Sharp Gifts Warehouse	10400	2005-04-01
450	The Sharp Gifts Warehouse	10407	2005-04-22
452	Mini Auto Werke	10164	2003-10-21
452	Mini Auto Werke	10170	2003-11-04
452	Mini Auto Werke	10392	2005-03-10
455	Super Scale Inc.	10196	2003-11-26
455	Super Scale Inc.	10245	2004-05-04
456	Microscale Inc.	10242	2004-04-20
456	Microscale Inc.	10319	2004-11-03
458	Corrida Auto Replicas, Ltd	10126	2003-05-28
458	Corrida Auto Replicas, Ltd	10214	2004-01-26
458	Corrida Auto Replicas, Ltd	10348	2004-11-01
459	Warburg Exchange	NULL	NULL
462	FunGiftIdeas.com	10166	2003-10-21
462	FunGiftIdeas.com	10321	2004-11-04
462	FunGiftIdeas.com	10388	2005-03-03
465	Anton Designs, Ltd.	NULL	NULL
471	Australian Collectables, Ltd	10193	2003-11-21
471	Australian Collectables, Ltd	10265	2004-07-02
471	Australian Collectables, Ltd	10415	2005-05-09
473	Frau da Collezione	10157	2003-10-09
473	Frau da Collezione	10218	2004-02-09
475	West Coast Collectables Co.	10199	2003-12-01
475	West Coast Collectables Co.	10215	2004-01-29
477	Mit Vergnügen & Co.	NULL	NULL
480	Kremlin Collectables, Co.	NULL	NULL
481	Raanan Stores, Inc	NULL	NULL
484	Iberia Gift Imports, Corp.	10184	2003-11-14
484	Iberia Gift Imports, Corp.	10303	2004-10-06
486	Motor Mint Distributors Inc.	10109	2003-03-10
486	Motor Mint Distributors Inc.	10236	2004-04-03
486	Motor Mint Distributors Inc.	10331	2004-11-17
487	Signal Collectibles Ltd.	10149	2003-09-12
487	Signal Collectibles Ltd.	10219	2004-02-10
489	Double Decker Gift Stores, Ltd	10186	2003-11-14
489	Double Decker Gift Stores, Ltd	10213	2004-01-22
495	Diecast Collectables	10207	2003-12-09
495	Diecast Collectables	10243	2004-04-26
496	Kelly's Gift Shop	10138	2003-07-07
496	Kelly's Gift Shop	10179	2003-11-11
496	Kelly's Gift Shop	10360	2004-12-16
496	Kelly's Gift Shop	10399	2005-04-01
--- End Result (Success) ---

==============================

-- Query 3: RIGHT JOIN - List all orders and any associated customer information
--- Result ---
orderNumber	orderDate	customerName	country
NULL	NULL	Havel & Zbyszek Co	Poland
NULL	NULL	American Souvenirs Inc	USA
NULL	NULL	Porto Imports Co.	Portugal
NULL	NULL	Asian Shopping Network, Co	Singapore
NULL	NULL	Natürlich Autos	Germany
NULL	NULL	ANG Resellers	Spain
NULL	NULL	Messner Shopping Network	Germany
NULL	NULL	Franken Gifts, Co	Germany
NULL	NULL	BG&E Collectables	Switzerland
NULL	NULL	Schuyler Imports	Netherlands
NULL	NULL	Der Hund Imports	Germany
NULL	NULL	Cramer Spezialitäten, Ltd	Germany
NULL	NULL	Asian Treasures, Inc.	Ireland
NULL	NULL	SAR Distributors, Co	South Africa
NULL	NULL	Kommission Auto	Germany
NULL	NULL	Lisboa Souveniers, Inc	Portugal
NULL	NULL	Precious Collectables	Switzerland
NULL	NULL	Stuttgart Collectable Exchange	Germany
NULL	NULL	Feuer Online Stores, Inc	Germany
NULL	NULL	Warburg Exchange	Germany
NULL	NULL	Anton Designs, Ltd.	Spain
NULL	NULL	Mit Vergnügen & Co.	Germany
NULL	NULL	Kremlin Collectables, Co.	Russia
NULL	NULL	Raanan Stores, Inc	Israel
10100	2003-01-06	Online Diecast Creations Co.	USA
10101	2003-01-09	Blauer See Auto, Co.	Germany
10102	2003-01-10	Vitachrome Inc.	USA
10103	2003-01-29	Baane Mini Imports	Norway
10104	2003-01-31	Euro+ Shopping Channel	Spain
10105	2003-02-11	Danish Wholesale Imports	Denmark
10106	2003-02-17	Rovelli Gifts	Italy
10107	2003-02-24	Land of Toys Inc.	USA
10108	2003-03-03	Cruz & Sons Co.	Philippines
10109	2003-03-10	Motor Mint Distributors Inc.	USA
10110	2003-03-18	AV Stores, Co.	UK
10111	2003-03-25	Mini Wheels Co.	USA
10112	2003-03-24	Volvo Model Replicas, Co	Sweden
10113	2003-03-26	Mini Gifts Distributors Ltd.	USA
10114	2003-04-01	La Corne D'abondance, Co.	France
10115	2003-04-04	Classic Legends Inc.	USA
10116	2003-04-11	Royale Belge	Belgium
10117	2003-04-16	Dragon Souveniers, Ltd.	Singapore
10118	2003-04-21	Enaco Distributors	Spain
10119	2003-04-28	Salzburg Collectables	Austria
10120	2003-04-29	Australian Collectors, Co.	Australia
10121	2003-05-07	Reims Collectables	France
10122	2003-05-08	Marseille Mini Autos	France
10123	2003-05-20	Atelier graphique	France
10124	2003-05-21	Signal Gift Stores	USA
10125	2003-05-21	Australian Collectors, Co.	Australia
10126	2003-05-28	Corrida Auto Replicas, Ltd	Spain
10127	2003-06-03	Muscle Machine Inc	USA
10128	2003-06-06	Euro+ Shopping Channel	Spain
10129	2003-06-12	Stylish Desk Decors, Co.	UK
10130	2003-06-16	Auto-Moto Classics Inc.	USA
10131	2003-06-16	Gift Ideas Corp.	USA
10132	2003-06-25	Down Under Souveniers, Inc	New Zealand
10133	2003-06-27	Euro+ Shopping Channel	Spain
10134	2003-07-01	Lyon Souveniers	France
10135	2003-07-02	Mini Gifts Distributors Ltd.	USA
10136	2003-07-04	Alpha Cognac	France
10137	2003-07-10	Reims Collectables	France
10138	2003-07-07	Kelly's Gift Shop	New Zealand
10139	2003-07-16	Souveniers And Things Co.	Australia
10140	2003-07-24	Technics Stores Inc.	USA
10141	2003-08-01	Suominen Souveniers	Finland
10142	2003-08-08	Mini Gifts Distributors Ltd.	USA
10143	2003-08-10	Mini Creations Ltd.	USA
10144	2003-08-13	Royale Belge	Belgium
10145	2003-08-25	Toys4GrownUps.com	USA
10146	2003-09-03	Gift Ideas Corp.	USA
10147	2003-09-05	Collectables For Less Inc.	USA
10148	2003-09-11	Anna's Decorations, Ltd	Australia
10149	2003-09-12	Signal Collectibles Ltd.	USA
10150	2003-09-19	Dragon Souveniers, Ltd.	Singapore
10151	2003-09-21	Oulu Toy Supplies, Inc.	Finland
10152	2003-09-25	Australian Gift Network, Co	Australia
10153	2003-09-28	Euro+ Shopping Channel	Spain
10154	2003-10-02	Boards & Toys Co.	USA
10155	2003-10-06	Toys of Finland, Co.	Finland
10156	2003-10-08	Euro+ Shopping Channel	Spain
10157	2003-10-09	Frau da Collezione	Italy
10158	2003-10-10	Baane Mini Imports	Norway
10159	2003-10-10	Corporate Gift Ideas Co.	USA
10160	2003-10-11	Men 'R' US Retailers, Ltd.	USA
10161	2003-10-17	Heintze Collectables	Denmark
10162	2003-10-18	Corporate Gift Ideas Co.	USA
10163	2003-10-20	Classic Legends Inc.	USA
10164	2003-10-21	Mini Auto Werke	Austria
10165	2003-10-22	Dragon Souveniers, Ltd.	Singapore
10166	2003-10-21	FunGiftIdeas.com	USA
10167	2003-10-23	Scandinavian Gift Ideas	Sweden
10168	2003-10-28	Technics Stores Inc.	USA
10169	2003-11-04	Anna's Decorations, Ltd	Australia
10170	2003-11-04	Mini Auto Werke	Austria
10171	2003-11-05	Québec Home Shopping Network	Canada
10172	2003-11-05	Gift Depot Inc.	USA
10173	2003-11-05	Rovelli Gifts	Italy
10174	2003-11-06	Australian Gift Network, Co	Australia
10175	2003-11-06	Stylish Desk Decors, Co.	UK
10176	2003-11-06	L'ordine Souveniers	Italy
10177	2003-11-07	CAF Imports	Spain
10178	2003-11-08	Alpha Cognac	France
10179	2003-11-11	Kelly's Gift Shop	New Zealand
10180	2003-11-11	Daedalus Designs Imports	France
10181	2003-11-12	Herkku Gifts	Norway  
10182	2003-11-12	Mini Gifts Distributors Ltd.	USA
10183	2003-11-13	Classic Gift Ideas, Inc	USA
10184	2003-11-14	Iberia Gift Imports, Corp.	Spain
10185	2003-11-14	Mini Creations Ltd.	USA
10186	2003-11-14	Double Decker Gift Stores, Ltd	UK
10187	2003-11-15	King Kong Collectables, Co.	Hong Kong
10188	2003-11-18	Herkku Gifts	Norway  
10189	2003-11-18	Toys4GrownUps.com	USA
10190	2003-11-19	Euro+ Shopping Channel	Spain
10191	2003-11-20	Toms Spezialitäten, Ltd	Germany
10192	2003-11-20	Online Diecast Creations Co.	USA
10193	2003-11-21	Australian Collectables, Ltd	Australia
10194	2003-11-25	Saveley & Henriot, Co.	France
10195	2003-11-25	Mini Classics	USA
10196	2003-11-26	Super Scale Inc.	USA
10197	2003-11-26	Enaco Distributors	Spain
10198	2003-11-27	Cruz & Sons Co.	Philippines
10199	2003-12-01	West Coast Collectables Co.	USA
10200	2003-12-01	King Kong Collectables, Co.	Hong Kong
10201	2003-12-01	Mini Wheels Co.	USA
10202	2003-12-02	GiftsForHim.com	New Zealand
10203	2003-12-02	Euro+ Shopping Channel	Spain
10204	2003-12-02	Muscle Machine Inc	USA
10205	2003-12-03	Euro+ Shopping Channel	Spain
10206	2003-12-05	Canadian Gift Exchange Network	Canada
10207	2003-12-09	Diecast Collectables	USA
10208	2004-01-02	Saveley & Henriot, Co.	France
10209	2004-01-09	Men 'R' US Retailers, Ltd.	USA
10210	2004-01-12	Osaka Souveniers Co.	Japan
10211	2004-01-15	Auto Canal+ Petit	France
10212	2004-01-16	Euro+ Shopping Channel	Spain
10213	2004-01-22	Double Decker Gift Stores, Ltd	UK
10214	2004-01-26	Corrida Auto Replicas, Ltd	Spain
10215	2004-01-29	West Coast Collectables Co.	USA
10216	2004-02-02	Auto Associés & Cie.	France
10217	2004-02-04	Handji Gifts& Co	Singapore
10218	2004-02-09	Frau da Collezione	Italy
10219	2004-02-10	Signal Collectibles Ltd.	USA
10220	2004-02-12	Clover Collections, Co.	Ireland
10221	2004-02-18	Petit Auto	Belgium
10222	2004-02-19	Collectable Mini Designs Co.	USA
10223	2004-02-20	Australian Collectors, Co.	Australia
10224	2004-02-21	Daedalus Designs Imports	France
10225	2004-02-22	Vida Sport, Ltd	Switzerland
10226	2004-02-26	Collectable Mini Designs Co.	USA
10227	2004-03-02	Saveley & Henriot, Co.	France
10228	2004-03-10	Cambridge Collectables Co.	USA
10229	2004-03-11	Mini Gifts Distributors Ltd.	USA
10230	2004-03-15	Blauer See Auto, Co.	Germany
10231	2004-03-19	CAF Imports	Spain
10232	2004-03-20	giftsbymail.co.uk	UK
10233	2004-03-29	Tekni Collectables Inc.	USA
10234	2004-03-30	Extreme Desk Decorations, Ltd	New Zealand
10235	2004-04-02	Royal Canadian Collectables, Ltd.	Canada
10236	2004-04-03	Motor Mint Distributors Inc.	USA
10237	2004-04-05	Vitachrome Inc.	USA
10238	2004-04-09	Danish Wholesale Imports	Denmark
10239	2004-04-12	Oulu Toy Supplies, Inc.	Finland
10240	2004-04-13	Osaka Souveniers Co.	Japan
10241	2004-04-13	Mini Caravy	France
10242	2004-04-20	Microscale Inc.	USA
10243	2004-04-26	Diecast Collectables	USA
10244	2004-04-29	Euro+ Shopping Channel	Spain
10245	2004-05-04	Super Scale Inc.	USA
10246	2004-05-05	Euro+ Shopping Channel	Spain
10247	2004-05-05	Suominen Souveniers	Finland
10248	2004-05-07	Land of Toys Inc.	USA
10249	2004-05-08	Cambridge Collectables Co.	USA
10250	2004-05-11	The Sharp Gifts Warehouse	USA
10251	2004-05-18	Tekni Collectables Inc.	USA
10252	2004-05-26	Auto Canal+ Petit	France
10253	2004-06-01	UK Collectables, Ltd.	UK
10254	2004-06-03	Down Under Souveniers, Inc	New Zealand
10255	2004-06-04	Mini Caravy	France
10256	2004-06-08	Danish Wholesale Imports	Denmark
10257	2004-06-14	The Sharp Gifts Warehouse	USA
10258	2004-06-15	Tokyo Collectables, Ltd	Japan
10259	2004-06-15	Handji Gifts& Co	Singapore
10260	2004-06-16	GiftsForHim.com	New Zealand
10261	2004-06-17	Québec Home Shopping Network	Canada
10262	2004-06-24	Euro+ Shopping Channel	Spain
10263	2004-06-28	Gift Depot Inc.	USA
10264	2004-06-30	Gifts4AllAges.com	USA
10265	2004-07-02	Australian Collectables, Ltd	Australia
10266	2004-07-06	L'ordine Souveniers	Italy
10267	2004-07-07	Muscle Machine Inc	USA
10268	2004-07-12	Extreme Desk Decorations, Ltd	New Zealand
10269	2004-07-16	Salzburg Collectables	Austria
10270	2004-07-19	Souveniers And Things Co.	Australia
10271	2004-07-20	Mini Gifts Distributors Ltd.	USA
10272	2004-07-20	Diecast Classics Inc.	USA
10273	2004-07-21	Petit Auto	Belgium
10274	2004-07-21	Collectables For Less Inc.	USA
10275	2004-07-23	La Rochelle Gifts	France
10276	2004-08-02	Online Mini Collectables	USA
10277	2004-08-04	Dragon Souveniers, Ltd.	Singapore
10278	2004-08-06	Signal Gift Stores	USA
10279	2004-08-09	Euro+ Shopping Channel	Spain
10280	2004-08-17	Amica Models & Co.	Italy
10281	2004-08-19	Diecast Classics Inc.	USA
10282	2004-08-20	Mini Gifts Distributors Ltd.	USA
10283	2004-08-20	Royal Canadian Collectables, Ltd.	Canada
10284	2004-08-21	Norway Gifts By Mail, Co.	Norway  
10285	2004-08-27	Marta's Replicas Co.	USA
10286	2004-08-28	La Corne D'abondance, Co.	France
10287	2004-08-30	Vida Sport, Ltd	Switzerland
10288	2004-09-01	Handji Gifts& Co	Singapore
10289	2004-09-03	Herkku Gifts	Norway  
10290	2004-09-07	Auto-Moto Classics Inc.	USA
10291	2004-09-08	Scandinavian Gift Ideas	Sweden
10292	2004-09-08	Land of Toys Inc.	USA
10293	2004-09-09	Amica Models & Co.	Italy
10294	2004-09-10	Online Mini Collectables	USA
10295	2004-09-10	Gifts4AllAges.com	USA
10296	2004-09-15	Bavarian Collectables Imports, Co.	Germany
10297	2004-09-16	Clover Collections, Co.	Ireland
10298	2004-09-27	Atelier graphique	France
10299	2004-09-30	Toys of Finland, Co.	Finland
10300	2003-10-04	Blauer See Auto, Co.	Germany
10301	2003-10-05	Norway Gifts By Mail, Co.	Norway  
10302	2003-10-06	UK Collectables, Ltd.	UK
10303	2004-10-06	Iberia Gift Imports, Corp.	Spain
10304	2004-10-11	Auto Associés & Cie.	France
10305	2004-10-13	Marta's Replicas Co.	USA
10306	2004-10-14	AV Stores, Co.	UK
10307	2004-10-14	Classic Gift Ideas, Inc	USA
10308	2004-10-15	Mini Classics	USA
10309	2004-10-15	Baane Mini Imports	Norway
10310	2004-10-16	Toms Spezialitäten, Ltd	Germany
10311	2004-10-16	Euro+ Shopping Channel	Spain
10312	2004-10-21	Mini Gifts Distributors Ltd.	USA
10313	2004-10-22	Canadian Gift Exchange Network	Canada
10314	2004-10-22	Heintze Collectables	Denmark
10315	2004-10-29	La Rochelle Gifts	France
10316	2004-11-01	giftsbymail.co.uk	UK
10317	2004-11-02	Technics Stores Inc.	USA
10318	2004-11-02	Diecast Classics Inc.	USA
10319	2004-11-03	Microscale Inc.	USA
10320	2004-11-03	Volvo Model Replicas, Co	Sweden
10321	2004-11-04	FunGiftIdeas.com	USA
10322	2004-11-04	Online Diecast Creations Co.	USA
10323	2004-11-05	Blauer See Auto, Co.	Germany
10324	2004-11-05	Vitachrome Inc.	USA
10325	2004-11-05	Baane Mini Imports	Norway
10326	2004-11-09	Volvo Model Replicas, Co	Sweden
10327	2004-11-10	Danish Wholesale Imports	Denmark
10328	2004-11-12	Rovelli Gifts	Italy
10329	2004-11-15	Land of Toys Inc.	USA
10330	2004-11-16	Cruz & Sons Co.	Philippines
10331	2004-11-17	Motor Mint Distributors Inc.	USA
10332	2004-11-17	AV Stores, Co.	UK
10333	2004-11-18	Mini Wheels Co.	USA
10334	2004-11-19	Volvo Model Replicas, Co	Sweden
10335	2004-11-19	Mini Gifts Distributors Ltd.	USA
10336	2004-11-20	La Corne D'abondance, Co.	France
10337	2004-11-21	Classic Legends Inc.	USA
10338	2004-11-22	Royale Belge	Belgium
10339	2004-11-23	Tokyo Collectables, Ltd	Japan
10340	2004-11-24	Enaco Distributors	Spain
10341	2004-11-24	Salzburg Collectables	Austria
10342	2004-11-24	Australian Collectors, Co.	Australia
10343	2004-11-24	Reims Collectables	France
10344	2004-11-25	Marseille Mini Autos	France
10345	2004-11-25	Atelier graphique	France
10346	2004-11-29	Signal Gift Stores	USA
10347	2004-11-29	Australian Collectors, Co.	Australia
10348	2004-11-01	Corrida Auto Replicas, Ltd	Spain
10349	2004-12-01	Muscle Machine Inc	USA
10350	2004-12-02	Euro+ Shopping Channel	Spain
10351	2004-12-03	Stylish Desk Decors, Co.	UK
10352	2004-12-03	Auto-Moto Classics Inc.	USA
10353	2004-12-04	Gift Ideas Corp.	USA
10354	2004-12-04	Down Under Souveniers, Inc	New Zealand
10355	2004-12-07	Euro+ Shopping Channel	Spain
10356	2004-12-09	Lyon Souveniers	France
10357	2004-12-10	Mini Gifts Distributors Ltd.	USA
10358	2004-12-10	Euro+ Shopping Channel	Spain
10359	2004-12-15	Reims Collectables	France
10360	2004-12-16	Kelly's Gift Shop	New Zealand
10361	2004-12-17	Souveniers And Things Co.	Australia
10362	2005-01-05	Technics Stores Inc.	USA
10363	2005-01-06	Suominen Souveniers	Finland
10364	2005-01-06	Marseille Mini Autos	France
10365	2005-01-07	Mini Creations Ltd.	USA
10366	2005-01-10	Royale Belge	Belgium
10367	2005-01-12	Toys4GrownUps.com	USA
10368	2005-01-19	Mini Gifts Distributors Ltd.	USA
10369	2005-01-20	Collectables For Less Inc.	USA
10370	2005-01-20	Anna's Decorations, Ltd	Australia
10371	2005-01-23	Mini Gifts Distributors Ltd.	USA
10372	2005-01-26	Tokyo Collectables, Ltd	Japan
10373	2005-01-31	Oulu Toy Supplies, Inc.	Finland
10374	2005-02-02	Australian Gift Network, Co	Australia
10375	2005-02-03	La Rochelle Gifts	France
10376	2005-02-08	Boards & Toys Co.	USA
10377	2005-02-09	Toys of Finland, Co.	Finland
10378	2005-02-10	Euro+ Shopping Channel	Spain
10379	2005-02-10	Euro+ Shopping Channel	Spain
10380	2005-02-16	Euro+ Shopping Channel	Spain
10381	2005-02-17	Corporate Gift Ideas Co.	USA
10382	2005-02-17	Mini Gifts Distributors Ltd.	USA
10383	2005-02-22	Euro+ Shopping Channel	Spain
10384	2005-02-23	Corporate Gift Ideas Co.	USA
10385	2005-02-28	Mini Gifts Distributors Ltd.	USA
10386	2005-03-01	Euro+ Shopping Channel	Spain
10387	2005-03-02	Dragon Souveniers, Ltd.	Singapore
10388	2005-03-03	FunGiftIdeas.com	USA
10389	2005-03-03	Scandinavian Gift Ideas	Sweden
10390	2005-03-04	Mini Gifts Distributors Ltd.	USA
10391	2005-03-09	Anna's Decorations, Ltd	Australia
10392	2005-03-10	Mini Auto Werke	Austria
10393	2005-03-11	Down Under Souveniers, Inc	New Zealand
10394	2005-03-15	Euro+ Shopping Channel	Spain
10395	2005-03-17	Lyon Souveniers	France
10396	2005-03-23	Mini Gifts Distributors Ltd.	USA
10397	2005-03-28	Alpha Cognac	France
10398	2005-03-30	Reims Collectables	France
10399	2005-04-01	Kelly's Gift Shop	New Zealand
10400	2005-04-01	The Sharp Gifts Warehouse	USA
10401	2005-04-03	Tekni Collectables Inc.	USA
10402	2005-04-07	Auto Canal+ Petit	France
10403	2005-04-08	UK Collectables, Ltd.	UK
10404	2005-04-08	Down Under Souveniers, Inc	New Zealand
10405	2005-04-14	Mini Caravy	France
10406	2005-04-15	Danish Wholesale Imports	Denmark
10407	2005-04-22	The Sharp Gifts Warehouse	USA
10408	2005-04-22	Tokyo Collectables, Ltd	Japan
10409	2005-04-23	Handji Gifts& Co	Singapore
10410	2005-04-29	GiftsForHim.com	New Zealand
10411	2005-05-01	Québec Home Shopping Network	Canada
10412	2005-05-03	Euro+ Shopping Channel	Spain
10413	2005-05-05	Gift Depot Inc.	USA
10414	2005-05-06	Gifts4AllAges.com	USA
10415	2005-05-09	Australian Collectables, Ltd	Australia
10416	2005-05-10	L'ordine Souveniers	Italy
10417	2005-05-13	Euro+ Shopping Channel	Spain
10418	2005-05-16	Extreme Desk Decorations, Ltd	New Zealand
10419	2005-05-17	Salzburg Collectables	Austria
10420	2005-05-29	Souveniers And Things Co.	Australia
10421	2005-05-29	Mini Gifts Distributors Ltd.	USA
10422	2005-05-30	Diecast Classics Inc.	USA
10423	2005-05-30	Petit Auto	Belgium
10424	2005-05-31	Euro+ Shopping Channel	Spain
10425	2005-05-31	La Rochelle Gifts	France
--- End Result (Success) ---

==============================

-- Query 4: INNER JOIN with WHERE filter - Employees in USA offices
--- Result ---
firstName	lastName	city	country
Diane	Murphy	San Francisco	USA
Mary	Patterson	San Francisco	USA
Jeff	Firrelli	San Francisco	USA
Anthony	Bow	San Francisco	USA
Leslie	Jennings	San Francisco	USA
Leslie	Thompson	San Francisco	USA
Julie	Firrelli	Boston	USA
Steve	Patterson	Boston	USA
Foon Yue	Tseng	NYC	USA
George	Vanauf	NYC	USA
--- End Result (Success) ---

==============================

-- Query 5: LEFT JOIN with NULL check - Customers who have never placed an order
--- Result ---
customerNumber	customerName
125	Havel & Zbyszek Co
168	American Souvenirs Inc
169	Porto Imports Co.
206	Asian Shopping Network, Co
223	Natürlich Autos
237	ANG Resellers
247	Messner Shopping Network
273	Franken Gifts, Co
293	BG&E Collectables
303	Schuyler Imports
307	Der Hund Imports
335	Cramer Spezialitäten, Ltd
348	Asian Treasures, Inc.
356	SAR Distributors, Co
361	Kommission Auto
369	Lisboa Souveniers, Inc
376	Precious Collectables
409	Stuttgart Collectable Exchange
443	Feuer Online Stores, Inc
459	Warburg Exchange
465	Anton Designs, Ltd.
477	Mit Vergnügen & Co.
480	Kremlin Collectables, Co.
481	Raanan Stores, Inc
--- End Result (Success) ---

==============================

-- Query 6: RIGHT JOIN - Orders not linked to any customer (demonstration case)
--- Result ---
orderNumber	orderDate	customerNumber
NULL	NULL	125
NULL	NULL	169
NULL	NULL	206
NULL	NULL	223
NULL	NULL	237
NULL	NULL	247
NULL	NULL	273
NULL	NULL	293
NULL	NULL	303
NULL	NULL	307
NULL	NULL	335
NULL	NULL	348
NULL	NULL	356
NULL	NULL	361
NULL	NULL	369
NULL	NULL	409
NULL	NULL	443
NULL	NULL	459
NULL	NULL	465
NULL	NULL	477
NULL	NULL	480
NULL	NULL	481
NULL	NULL	168
NULL	NULL	376
--- End Result (Success) ---

==============================

