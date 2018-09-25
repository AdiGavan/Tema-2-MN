function [limita_inf, limita_sup] = LimiteValProprii(d, s)

	n = length(d);
	
	% Se atribuie limitei inferioare si celei superioare primele valori 
	% calculate folosind teorema lui Gershgorin;
	limita_inf = d(1) - abs(s(1));
	limita_sup = d(1) + abs(s(1));
	
	% Se vor calcula restul valorilor pana la penultima iteratie;
	for i = 2:n - 1
		suma = abs(s(i-1)) + abs(s(i));
		min = d(i) - suma;
		max = d(i) + suma;
		
		% Daca min < limita inferioara, limita_inf primeste valoarea min;
		if min < limita_inf
			limita_inf = min;
		endif
		
		% Daca max > limita superioara, limita_sup primeste valoarea max;
		if max > limita_sup
			limita_sup = max;
		endif
	endfor
	
	% Se calculeaza ultimele valori (ale ultimei iteratii); 
	min = d(n) - abs(s(n - 1));
	max = d(n) + abs(s(n - 1));
	
	% Daca min < limita inferioara, limita_inf primeste valoarea min;
	if min < limita_inf
		limita_inf = min;
	endif
	
	% Daca max > limita superioara, limita_sup primeste valoarea max;
	if max > limita_sup
		limita_sup = max;
	endif
	
endfunction