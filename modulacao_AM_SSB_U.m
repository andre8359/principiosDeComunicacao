function sinal_modulado = modulacao_AM_SSB_U(sinal,fs,f_portadora,Ac)

	%Função que gera os graficos e retorna o sinal modulado em AM SSB U com a 
	%%frequência da portadora e amostragem  especificadas. Caso não seja informado 
	%% o valor da amplitude da portadora, temos como padrão o valor 1. 
	%O sinal de saída tem como padrão o formate de um vetor linha.

	if(nargin<4)
		Ac=1;
	end
	
	sinal = sinal(:)'; %garante o sinal como uma linha
	plot_sinal(sinal,'Sinal original','Tempo [s]','Amplitude normalizada',4e5);
	t = 0:1/fs:((length(sinal)-1)/fs);
	trans_hilbert = hilbert(sinal);
    sinal_modulado = 0.5*[real(trans_hilbert).*cos(2*pi*f_portadora*t) - imag(trans_hilbert).*sin(2*pi*f_portadora*t)];
	plot_sinal(sinal_modulado,'Sinal Modulado SSB U','Tempo [s]','Amplitude normalizada',4e5);
	