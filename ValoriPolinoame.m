function P = ValoriPolinoame(d, s, val_lambda)
	
	% Se calculeaza numarul de polinoame pentru relatia de recurenta;
	n = length(d);
	
	% Se initializeaza P0 si P1;
	P(1) = 1;
	P(2) = d(1) - val_lambda;
	
	% Folosind relatia de recurenta din "Descriere Generala", se calculeaza 
	% restul polinoamelor;
	for i = 2:n
		P(i + 1) = (d(i) - val_lambda) * P(i) - (s(i - 1) ^ 2) * P(i - 1);
	endfor

endfunction