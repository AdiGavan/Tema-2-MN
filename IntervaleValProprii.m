function r = IntervaleValProprii(d, s, m)
	n = length(d);
	
	% Daca m > n, m va primi valoarea lui n;
	if m > n
		m = n;
	endif
	
	% Se calculeaza limita inferioara si cea superioara
	[limita_inf limita_sup] = LimiteValProprii(d, s);
	
	% Se initializeaza r(1) si r(m+2) conform indicatiilor problemei;
	r(1) = limita_inf;
	r(m + 2) = limita_sup;
	
	% Se aplica algoritmul din enuntul cerintei;
	for k = m:-1:1
		
		% Se calculeaza mijlocul intervalului;
		mij = (r(k + 2) + r(1)) / 2;
		
		% Se calculeaza lungimea intervalului;
		h = (r(k + 2) - r(1)) / 2;
		do
		
			% Se calculeaza numarul de valori proprii mai mici decat valoarea 
			% mij folosind functia NrValProprii de la cerinta 2;
			numvp = NrValProprii(d, s, mij);
			
			% Se actualizeaza valoarea mijloclui;
			h = h / 2;
			if numvp < k
				mij = mij + h;
			elseif numvp > k
				mij = mij - h;
			endif
		
		% Se repeta pasii pana cand numvp = k (conform algoritmului dat);
		until numvp == k
		
		% Se obtine valoarea pentru r(k+1);
		r(k + 1) = mij;
		
	endfor
	
	% r(m+2) a fost o variabila auxiliara si nu trebuie stocata in vector;
	r = r(1:m + 1);
endfunction
			
	