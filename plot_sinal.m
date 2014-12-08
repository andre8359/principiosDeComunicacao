function plot_sinal(x,titulo,eixo_x,eixo_y,fs)
	%Função que plota o sinal e a magnitude da fft do sinal. Caso não seja fornecida
	% a frequência de amostragem, será plotado apenas o sinal.
	if(nargin<5) 
		fs=0;
	end
	if(fs>0)
		frequencias = linspace(-0.5,0.5, 1e6);
		X=fft(x,1e6);
		figure;
		subplot(2,1,1);
		t = 0:1/fs:((length(x)-1)/fs);
		plot(t,x);
		title(titulo);
		xlabel(eixo_x);
		ylabel(eixo_y);
		temp = axis;
		%axis([0 temp(2)/fs*10000 temp(3) temp(4)]);
		grid on;
		subplot(2,1,2);
		plot(frequencias*fs/1000, fftshift(abs(X)));
		title('Espectro do Sinal');
		xlabel('Frequencias [kHz]');
		ylabel('Magnitude da DTFT');
		grid on;
	else
		figure;
		plot(x);
		title(titulo);
		xlabel(eixo_x);
		ylabel(eixo_y);
		grid on;
	end