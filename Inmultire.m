function [result] = Inmultire (a, b, c, y)
	
	% Se calculeaza lungimea diagonalei;
	n = length(b);
	
	% Inmultirea primei linii cu vectorul coloana;
	result(1) = b(1) * y(1) + c(1) * y(2);
	
	% Inmultirea liniilor pana la penultima linie cu vectorul coloana;
	for i=2:n - 1
		result(i) = a(i - 1)*y(i - 1) + b(i) * y(i) + c(i) * y(i + 1);
	endfor
	
	% Inmultirea ultimei linii;
	result(n) = a(n - 1) * y(n - 1) + b(n) * y(n);
	
endfunction