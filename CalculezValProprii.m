function vp = CalculezValProprii(d, s, m, tol)

	% Se calculeaza intervalele in care se gasesc valori proprii cu functia 
	% IntervaleValProprii de la cerinta 4;
	r = IntervaleValProprii(d, s, m);
	n = length(d);
	if m > n
		m = n;
	endif
	
	% Se aplica metoda bisectiei pe fiecare interval in care se gaseste o 
	% valoare proprie
	for k = 1:m
	
		% Se initializeaza capetele intervalelor;
		a = r(k);
		b = r(k + 1);
		
		% Se alege un numar foarte mare pentru a putea calcula p eroare inca 
		% de la primul pas (eroarea va fi asa de mare incat nu influenteaza 
		% programul);
		mediaveche = 4000000000;
		do
			
			% Se calculeaza media;
			media = (a + b) / 2;
			
			% Se calculeaza f(a) si f(media) folosind functia ValoriPolinoame 
			% de la cerinta 1;
			P1 = ValoriPolinoame(d, s, a);
			fa = P1(length(P1));
			P2 = ValoriPolinoame(d, s, media);
			fmedia = P2(length(P2));
			
			% Daca f(a) * f(media) == 0 inseamna ca media este valoarea proprie;
			if fa * fmedia == 0
				vp(k) = media;
				break;
			
			% Daca f(a) * f(media) < 0 , b primestea valoarea media, 
			% micsorandu-se intervalul initial; 
			elseif fa * fmedia < 0
				b = media;
				
			% Daca f(a) * f(media) > 0 , a primestea valoarea media, 
			% micsorandu-se intervalul initial;
			elseif fa * fmedia > 0
				a = media;
			endif
			
			% Se calculeaza eroarea;
			eroarea = abs((media - mediaveche) / media);
			
			% Se pastreaza media veche;
			mediaveche = media;
			
		% Conditia de oprire;
		until abs(eroarea) <= abs(tol)
		
		% Atribuim valoarea vectorului de valori proprii;
		vp(k) = media;
		
	endfor
	
endfunction
				