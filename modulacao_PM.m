function sinal_modulado = modulacao_PM(sinal,fs,f_portadora,beta_pm,Ac,bt)

	%Função que gera os graficos e retorna o sinal modulado em FM com a 
	%%frequência da portadora,de amostragem e o valor de mi especificados. Caso não seja informado 
	%% o valor de mi, temos como padrão o valor 0.9 e mesmo para o valor da amplitude da portador (com o
	%valor padrão de 1). O sinal de saída tem como padrão o formate de um vetor linha.
	
	if(nargin<4)
		beta_pm=10;
	end	
	if(nargin<5)
		Ac=1;
	end
	if(bt<4)
		bt=4e3;
	end
	
	kp = 2*pi*bt*beta_pm/max(abs(diff(sinal)));
	plot_sinal(sinal,'Sinal original','Tempo [s]','Amplitude normalizada',4e5);
	
	sinal =sinal(:)'; %garante o sinal como uma linha
	t = 0:1/fs:((length(sinal)-1)/fs);
	portadora = cos(2*pi*f_portadora*t + kp*sinal);
	plot_sinal(portadora,'Sinal Modulado DSB','Tempo [s]','Amplitude normalizada',4e5);
	sinal_modulado = sinal;