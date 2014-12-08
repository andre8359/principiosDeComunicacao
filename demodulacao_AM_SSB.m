function [sinal_demodulado]= demodulacao_AM_SSB(sinal,fs,f_portadora,Ac)

	%Função que gera os graficos e retorna o sinal demodulado em AM SSB  com a 
	%%frequência da portadora e amostragem  especificadas. Caso não seja informado 
	%% o valor da amplitude da portadora, temos como padrão o valor 1. 
	%O sinal de saída tem como padrão o formate de um vetor linha.

	if(nargin<4)
		Ac=1;
	end
	
	sinal = sinal(:)'; %garante o sinal como uma linha
	%plot_sinal(sinal,'Sinal Modulado','Tempo [s]','Amplitude normalizada',4e5);
	t = 0:1/fs:((length(sinal)-1)/fs);
	sinal = sinal.*cos(2*pi*f_portadora*t);
	passa_baixas=filtro_passa_baixas_fc4k;
	sinal = conv(sinal,passa_baixas);
	plot_sinal(sinal,'Sinal Demodulado SSB','Tempo [s]','Amplitude normalizada',4e5);
	sinal_demodulado = sinal;
