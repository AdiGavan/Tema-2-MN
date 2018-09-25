Nume: Gavan Adrian-George

Grupa: 314CA

Tema 2: Vectori si valori proprii

Informatii generale:
====================

- Problema calculului valorilor proprii ale unei matrici simetrice oarecare poate 
fi redusa la calculul valorilor proprii ale unei matrici tridiagonale simetrice 
care area aceleasi valori proprii (o astfel de matrice se poate obtine utilizand 
transformarea Householder).
- O matrice tridiagonala simetrica se pastreaza eficient in memorie folosind 2 
vectori: un vector reprezentand diagonala principala si celalalt vector 
reprezentand supradiagonala sau subdiagonala.
- Se dau 2 teoreme extrem de folositoare pentru implementarea temei: teorema lui 
Gershgorin si proprietatea sirurilor Sturm.

Cerinta 1:
==========

Prezentarea implementarii:
==========================

Functia creata: function P = ValoriPolinoame(d, s, val_lambda);

Algoritm:
- Se calculeaza numarul de polinoame pentru relatia de recurenta.
- Se initializeaza P0 si P1.
- Se aplica relatia de recurenta din "Descriere Generala".

Cerinta 2:
==========

Prezentarea implementarii:
==========================

Functia creata: function numvp = NrValProprii(d, s, val_lambda);
Functii folosite: ValoriPolinoame(d, s, val_lambda);

Algoritm:
- Se va folosi proprietatea sirului Sturm;
- Se calculeaza valorile polinoamelor folosind functia de la cerinta 1.
- Se afla intre ce valori din sirul Sturm avem fluctuatii de semn.
- Se afla semnul elementului curent si semnul elementului de dupa.
- Daca elementul curent este 0, pastreaza semnul opus elementului precedent.
- Daca elementul viitor este 0, primeste semnul opus elementului curent.
- Daca semnele difera, exista fluctuatie de semn, cea ce inseamna ca exista 
valoare proprie (se incrementeaza numarul de valori proprii).

Cerinta 3:
==========

Prezentarea implementarii:
==========================

Functie creata: function [limita_inf, limita_sup] = LimiteValProprii(d, s);

Algoritm:
- Se va folosi teorema lui Gershgorin.
- Se atribuie limitei superioare si limitei inferioare valorile (calculate cu 
ajutorul teoremei) din prima iteratie.
- Se calculeaza restul valorilor.
- Se calculeaza t(i) conform formulei (in problema se numeste "suma").
- Se calculeaza minimul si maximul.
- Daca minimul < limita inferioara, atunci limita primeste valoarea minimului.
- Daca maximul > limita superioara, atunci limita primeste valoarea maximului.

Cerinta 4:
==========

Prezentarea implementarii:
==========================

Functie creata: function r = IntervaleValProprii(d, s, m);
Functii folosite: LimiteValProprii(d, s), NrValProprii(d, s, mij);
Algoritm:
- Se calculeaza limita superioara si limita inferioara folosindu-se functia 
LimiteValProprii(d, s) de la cerinta 3.
- Conform indicatiilor cerintei, se initializeaza r(1) cu limita inferioara si 
r(m+2) cu limita superioara.
- Se aplica algoritmul din indicatiile cerintei.
- Se calculeaza mijlocul intervalului.
- Se calculeaza lungimea intervalului.
- Se calculeaza numarul de valori proprii mai mici decat mijlocul intervalului 
folosind functia NrValProprii(d, s, mij) de la cerinta 2.
- Se actualizeaza valoarea mijlocului.
- Se repeta algoritmul pana cand numarul de valori proprii este egal cu k.
- Se obtine astfel r(k+1).

Cerinta 5:
==========

Prezentarea implementarii:
==========================

Functia creata: function vp = CalculezValProprii(d, s, m, tol);
Functii folosite: IntervaleValProprii(d, s, m), ValoriPolinoame(d, s, a);

Algoritm:
- Se calculeaza intervalele in care se gasesc valori proprii cu functia 
IntervaleValProprii de la cerinta 4.
- Se aplica metoda bisectiei pe fiecare interval in care se gaseste o valoare 
proprie.
- Initializam cele 2 capete pentru metoda bisectiei cu capetele intervalelor.
- Atribuim variabilei "mediaveche" o valoare foarte mare ca sa putem calcula 
precizia de la primul pas (diferenta va fi asa de mare incat algoritmul nu 
se va opri).
- Se calculeaza media.
- Se calculeaza f(a) si f(m) cu functia ValoriPolinoame, pentru ca functia 
reprezinta defapt P(n), asa ca se va lua ultimul element din vectorul returnat 
de ValoriPolinoame.
- Programul va intra pe unul din cele 3 cazuri.
- Daca f(a) * f(media) == 0, atunci media reprezinta valoarea proprie.
- Daca f(a) * f(media) < 0, atunci se va micsora intervalul, aribuind lui b 
valoarea "media".
- Daca f(a) * f(media) > 0, atunci se va micsora intervalul, aribuind lui a 
valoarea "media".
- Se calculeaza toleranta si pastram media veche pentru a putea calcula eroarea.
- Se executa algoritmul pana cand se indeplineste conditia de iesire (eroarea 
este mai mica sau egala cu toleranta).
- Vectorul valorilor proprii primeste valoarea "media".

Cerinta 6:
==========

Prezentarea implementarii:
==========================

Functia creata: function [valp vecp] = PutereInv(d, s, h, y, maxIter, tol);
Functii folosite: Thomas(s,aux,s,vecp), Inmultire(s ,d, s, vecp);

Algoritm:
- Se initializeaza vectorul valorilo proprii cu aproximarea initiala.
- Se aplica metoda puterii inverse.
-Neavand matricea A compusa, stocam diagonala principala a matricii rare 
A - h*In.
- Pentru a evita inversarea unei matrici (z = inv(A - h * In) * vecp) se va 
reduce problema la rezolvarea unui SEL in care A este o matrice tridiagonala 
simetrica ((A - h * In) * z = vecp).
- Sistemul se rezolva cu algoritmul lui Thomas.
- Se apeleaza functia Thomas, cu parametrii: vectorii celor 3 diagonale si 
vectorul vecp.
- Functia Thomas din Laboratorul 4 rezolva un sistem de forma Ax=b, in care A 
este o matrice tridiagonala.
- Trebuie calculat produsul vecp' * A * vecp. Cum nu este permis sa se compuna 
matricea A, s-a creat o functie care realizeaza inmultirea lui A cu vecp, 
functia avand ca parametrii de intrare diagonalele matricii tridiagonale 
simetrice A si vectorul vecp (Inmultire(s ,d, s, vecp)).
- Avand functia, valp (valoare proprie) va primi valoarea vecp' * A * vecp, care 
va fi calculata pe bucati, folosind functia "Inmultire" (pentru ca nu avem 
matricea A).
- Valoarea de deplasare primeste valp (iterarea catului Rayleigh).
- Se verifica daca se indeplineste conditia de oprire din enuntul problemei.

Conditii impuse de tema:
========================

- Functiile principale trebuie implementate conform antetelor din enunt.
- Nu este permisa folosirea de functii predefinite pentru aflarea valorilor 
proprii sau a vectorilor proprii (ex.: eig()).
- Nu se va compune matricea A. 
