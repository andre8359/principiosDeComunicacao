function [sinal_demodulado delay]= demodulacao_AM_DSB_SC(sinal,fs,f_portadora,Ac)

	%Função que gera os graficos e retorna o sinal demodulado com a 
	%frequência da portadora,de amostragem e o valor de mi especificados. Caso não seja informado 
	%o valor de mi, temos como padrão o valor 0.9 e mesmo para o valor da amplitude da portador (com o
	%valor padrão de 1). O sinal de saída tem como padrão o formate de um vetor linha.

	if(nargin<4)
		Ac=1;
	end
	

	sinal = sinal(:)'; %garante o sinal como uma linha
	t = 0:1/fs:((length(sinal)-1)/fs);
	portadora = cos(2*pi*f_portadora*t);

	plot_sinal(sinal,'Sinal Modulado','Tempo [s]','Amplitude normalizada',4e5);
	sinal = sinal.*portadora;
	passa_bandas=filtro_passa_bandas_4khz;
	sinal = conv(sinal,passa_bandas);
	plot_sinal(sinal,'Sinal demodulado','Tempo [s]','Amplitude normalizada',4e5);
	delay=length(passa_bandas)-1;
	sinal_demodulado = sinal(1+delay:end);