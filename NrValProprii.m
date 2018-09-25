function numvp = NrValProprii(d, s, val_lambda)

	% Se calculeaza valoarile polinoamelor;
	P = ValoriPolinoame(d, s, val_lambda);
	
	% Se determina numarul polinoamelor;
	n = length(P);
	numvp = 0;
	
	% Se afla intre ce valori din sir avem fluctuatie de semn;
	for i = 1:n - 1
		
		% Se afla semnul elementului curent;
		s_curent = sign(P(i));
		if s_curent == 0
			s_curent = s_urmator;
		endif
		
		% Se afla semnul urmatorului element;
		s_urmator = sign(P(i + 1));
		if s_urmator == 0 
			s_urmator = -sign(s_curent);
		endif
		
		% Aplicam proprietatea sirului Strum;
		if s_curent != s_urmator 
			numvp++;
		endif
		
	endfor
	
endfunction
			
		