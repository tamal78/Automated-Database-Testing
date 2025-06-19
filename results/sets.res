Using database: classicmodels

-- Query 1: UNION - List unique city names from customers and offices
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
Tokyo
Sydney
--- End Result (Success) ---

==============================

-- Query 2: UNION ALL - List all city names (including duplicates) from customers and offices
--- Result ---
city
Nantes
Las Vegas
Melbourne
Nantes
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
NYC
Allentown
Burlingame
Singapore
Bergen
New Haven
Lisboa
Lille
Paris
Cambridge
Bridgewater
Kita-ku
NYC
Helsinki
Manchester
Dublin
Brickhaven
Liverpool
Vancouver
Brickhaven
Pasadena
Singapore
Strasbourg
Central Hong Kong
Barcelona
Glendale
Cunewalde
Århus
Montréal
Madrid
San Diego
Cowes
Toulouse
Frankfurt
Torino
Paris
Versailles
Köln
Tsawassen
München
North Sydney
Bergamo
Chatswood
Cambridge
Fribourg
Genève
Oslo
Amsterdam
Berlin
Oulu
Bruxelles
White Plains
New Bedford
San Francisco
Auckland  
London
Newark
South Brisbane
Espoo
Brandenburg
Philadelphia
Madrid
Los Angeles
Cork
Marseille
Reims
Hatfield
Auckland
Münster
Boston
Nashua
Lisboa
Bern
Brickhaven
Charleroi
Salzburg
Makati City
Reggio Emilia
Minato-ku
Paris
Stuttgart
Wellington
Munich
NYC
Leipzig
Glendale
Bräcke
San Jose
Graz
New Haven
NYC
Madrid
Aachen
New Bedford
Madrid
Glen Waverly
Milan
Burbank
Mannheim
Saint Petersburg
Herzlia
Sevilla
Philadelphia
Brisbane
London
Boston
Auckland  
San Francisco
Boston
NYC
Paris
Tokyo
Sydney
London
--- End Result (Success) ---

==============================

-- Query 3: UNION - Combine contact names from customers and employee names (as a single column)
--- Result ---
name
Carine 
Jean
Peter
Janine 
Jonas 
Susan
Zbyszek 
Roland
Julie
Kwai
Diego 
Christina 
Jytte 
Mary 
Eric
Jeff
Kelvin
Juri
Wendy
Veysel
Keith
Isabel 
Martine 
Marie
Jerry
Mory
Michael
Matti
Rachel
Dean
Leslie
Elizabeth
Yoshi 
Miguel
Brydey
Frédérique 
Mike
Eduardo 
Mary
Horst 
Palle
Jean 
Alejandra 
Valarie
Helen 
Annette 
Renate 
Paolo 
Daniel
Daniel 
Henriette 
Elizabeth 
Peter 
Anna
Giovanni 
Adrian
Marta
Ed
Mihael
Jan
Bradley
Mel
Pirkko
Catherine 
Steve
Wing
Ann 
William
Ben
Kalle
Philip 
Francisca
Jesus
Brian
Patricia 
Laurence 
Paul 
Armand
Wales
Karin
Dorothy
Lino 
Braun
Allen
Pascale 
Georg 
Arnold
Maurizio 
Akiko
Dominique
Rita 
Sarah
Maria
Alexander 
Dan
Martha
Sue
Roland 
Yu
Martín 
Sven 
Violeta
Carmen
Sean
Franco
Hanna 
Raanan
José Pedro 
Rosa
Thomas 
Tony
Diane
Gerard
Anthony
Foon Yue
George
Loui
Pamela
Larry
Barry
Andy
Tom
Mami
Yoshimi
Martin
--- End Result (Success) ---

==============================

-- Query 4: UNION ALL - Same as above but with duplicates preserved
--- Result ---
name
Carine 
Jean
Peter
Janine 
Jonas 
Susan
Zbyszek 
Roland
Julie
Kwai
Diego 
Christina 
Jytte 
Mary 
Eric
Jeff
Kelvin
Juri
Wendy
Veysel
Keith
Isabel 
Martine 
Marie
Jerry
Julie
Mory
Michael
Matti
Rachel
Dean
Leslie
Elizabeth
Yoshi 
Miguel
Julie
Brydey
Frédérique 
Mike
Eduardo 
Mary
Horst 
Palle
Jean 
Alejandra 
Valarie
Helen 
Annette 
Renate 
Paolo 
Daniel
Daniel 
Henriette 
Elizabeth 
Peter 
Anna
Giovanni 
Adrian
Marta
Ed
Mihael
Jan
Bradley
Mel
Pirkko
Catherine 
Steve
Wing
Julie
Mike
Ann 
William
Ben
Kalle
Philip 
Francisca
Jesus
Brian
Patricia 
Laurence 
Paul 
Armand
Wales
Karin
Juri
Dorothy
Lino 
Braun
Allen
Pascale 
Georg 
Arnold
Maurizio 
Akiko
Dominique
Rita 
Sarah
Michael
Maria
Alexander 
Dan
Martha
Sue
Roland 
Leslie
Yu
Martín 
Sven 
Violeta
Carmen
Sean
Franco
Steve
Hanna 
Alexander 
Raanan
José Pedro 
Rosa
Sue
Thomas 
Valarie
Tony
Diane
Mary
Jeff
William
Gerard
Anthony
Leslie
Leslie
Julie
Steve
Foon Yue
George
Loui
Gerard
Pamela
Larry
Barry
Andy
Peter
Tom
Mami
Yoshimi
Martin
--- End Result (Success) ---

==============================

-- Query 5: Simulate INTERSECT using INNER JOIN - Names common to customers and employees
--- Result ---
name
Peter
Julie
Jeff
Leslie
Mary
Steve
William
--- End Result (Success) ---

==============================

-- Query 6: Simulate EXCEPT using LEFT JOIN - Customer first names that are not employee first names
--- Result ---
name
Carine 
Jean
Janine 
Jonas 
Susan
Zbyszek 
Roland
Kwai
Diego 
Christina 
Jytte 
Mary 
Eric
Kelvin
Juri
Wendy
Veysel
Keith
Isabel 
Martine 
Marie
Jerry
Mory
Michael
Matti
Rachel
Dean
Elizabeth
Yoshi 
Miguel
Brydey
Frédérique 
Mike
Eduardo 
Horst 
Palle
Jean 
Alejandra 
Valarie
Helen 
Annette 
Renate 
Paolo 
Daniel
Daniel 
Henriette 
Elizabeth 
Peter 
Anna
Giovanni 
Adrian
Marta
Ed
Mihael
Jan
Bradley
Mel
Pirkko
Catherine 
Wing
Ann 
Ben
Kalle
Philip 
Francisca
Jesus
Brian
Patricia 
Laurence 
Paul 
Armand
Wales
Karin
Dorothy
Lino 
Braun
Allen
Pascale 
Georg 
Arnold
Maurizio 
Akiko
Dominique
Rita 
Sarah
Maria
Alexander 
Dan
Martha
Sue
Roland 
Yu
Martín 
Sven 
Violeta
Carmen
Sean
Franco
Hanna 
Raanan
José Pedro 
Rosa
Thomas 
Tony
--- End Result (Success) ---

==============================

-- Query 7: UNION with ORDER BY (must be applied to full result, not individual SELECTs)
--- Result ---
name
Adrian
Akiko
Alejandra 
Alexander 
Allen
Andy
Ann 
Anna
Annette 
Anthony
Armand
Arnold
Barry
Ben
Bradley
Braun
Brian
Brydey
Carine 
Carmen
Catherine 
Christina 
Dan
Daniel
Daniel 
Dean
Diane
Diego 
Dominique
Dorothy
Ed
Eduardo 
Elizabeth
Elizabeth 
Eric
Foon Yue
Francisca
Franco
Frédérique 
Georg 
George
Gerard
Giovanni 
Hanna 
Helen 
Henriette 
Horst 
Isabel 
Jan
Janine 
Jean
Jean 
Jeff
Jerry
Jesus
Jonas 
José Pedro 
Julie
Juri
Jytte 
Kalle
Karin
Keith
Kelvin
Kwai
Larry
Laurence 
Leslie
Lino 
Loui
Mami
Maria
Marie
Marta
Martha
Martin
Martín 
Martine 
Mary
Mary 
Matti
Maurizio 
Mel
Michael
Miguel
Mihael
Mike
Mory
Palle
Pamela
Paolo 
Pascale 
Patricia 
Paul 
Peter
Peter 
Philip 
Pirkko
Raanan
Rachel
Renate 
Rita 
Roland
Roland 
Rosa
Sarah
Sean
Steve
Sue
Susan
Sven 
Thomas 
Tom
Tony
Valarie
Veysel
Violeta
Wales
Wendy
William
Wing
Yoshi 
Yoshimi
Yu
Zbyszek 
--- End Result (Success) ---

==============================

