function [sinal_demodulado delay]= demodulacao_AM_DSB(sinal,fs,f_portadora,mi,Ac)

	%Função que gera os graficos e retorna o sinal demodulado com a 
	%frequência da portadora,de amostragem e o valor de mi especificados. Caso não seja informado 
	%o valor de mi, temos como padrão o valor 0.9 e mesmo para o valor da amplitude da portador (com o
	%valor padrão de 1). O sinal de saída tem como padrão o formate de um vetor linha.

	if(nargin<4)
		mi=.9;
	end
	
	if(nargin<5)
		Ac=1;
	end

	sinal = sinal(:)'; %garante o sinal como uma linha
	t = 0:1/fs:((length(sinal)-1)/fs);
	portadora = cos(2*pi*f_portadora*t);

	plot_sinal(sinal,'Sinal Modulado','Tempo [s]','Amplitude normalizada',4e5);
	sinal = sinal.*portadora;
	passa_faixas=filtro_passa_baixas_fc4k;
	sinal = conv(sinal,passa_baixas);
	length(sinal)
	plot_sinal(sinal,'Sinal demodulado','Tempo [s]','Amplitude normalizada',4e5);
	delay=length(passa_baixas)-1;%Delay gerado pelo filtro , para futuramente igualar os sinais no tempo para futuras comparações
	sinal_demodulado = sinal(1+delay:end);