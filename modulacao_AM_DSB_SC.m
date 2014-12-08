function sinal_modulado = modulacao_AM_DSB_SC(sinal,fs,f_portadora,Ac)

	%Função que gera os graficos e retorna o sinal modulado em AM DSB S com a 
	%%frequência da portadora,de amostragem e o valor de mi especificados. Caso não seja informado 
	%% o valor de mi, temos como padrão o valor 0.9 e mesmo para o valor da amplitude da portador (com o
	%valor padrão de 1). O sinal de saída tem como padrão o formate de um vetor linha.

	if(nargin<4)
		Ac=1;
	end
	
	sinal = sinal(:)'; %garante o sinal como uma linha
	t = 0:1/fs:((length(sinal)-1)/fs);
	portadora = cos(2*pi*f_portadora*t);
	plot_sinal(sinal,'Sinal Modulado','Tempo [s]','Amplitude normalizada',4e5);
	sinal = Ac*sinal.*portadora;
	plot_sinal(sinal,'Sinal demodulado DSB-SC','Tempo [s]','Amplitude normalizada',4e5);
	sinal_modulado = sinal;