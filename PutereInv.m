function [valp vecp] = PutereInv(d, s, h, y, maxIter, tol)

	% vecp se intializeaza cu aproximarea initiala a vectorului propriu;
	vecp = y;
	
	% Se aplica metoda puterii inverse:
	for k = 1:maxIter
	
		% In variabila aux se stocheaza diagonala principala a matricii
		% A - h * In;
		aux = d - h;
		
		% Pentru a evita inversarea unei matrici (z = inv(A - h * In) * vecp) 
		% se va reduce problema la rezolvarea unui SEL in care A este o matrice 
		% tridiagonala simetrica ( (A - h * In) * z = vecp);
		% Sistemul se rezolva cu algoritmul lui Thomas (se apeleaza functia 
		% Thomas, cu parametrii: vectorii celor 3 diagonale si vectorul vecp);
		z = Thomas(s, aux, s, vecp);
		vecp = z / norm(z);
		
		% Trebuie calculat produsul vecp' * A * vecp. Avand doar 3 vectori ce 
		% reprezinta diagonalele matricii A, s-a realizat o functie ce 
		% returneaza produsul matricii A * vecp;
		aux2 = Inmultire(s, d, s, vecp);
		valp = aux2 * vecp';
		
		% Iterarea catului Rayleigh;
		h = valp;
		
		% Conditia de oprire din enuntul cerintei;
		if norm(aux2 - valp * vecp) < tol
			break;
		endif
		
	endfor
	
endfunction