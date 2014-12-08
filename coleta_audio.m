function coleta_audio(nome)
	fs = 8000;
	dur = 5;
	recObj = audiorecorder(fs, 16, 1);
	disp('Inicio da gravacao')
	recordblocking(recObj, dur);
	disp('Fim da gravacao');
	meu_audio = getaudiodata(recObj);	
	N = max(abs(meu_audio)); %Normaliza o sinal
	
	meu_audio= meu_audio/N; 
	max(abs(meu_audio)); %Normaliza o sinal	
	meu_audio = meu_audio- mean(meu_audio); % tira nível DC
	meu_audio(find(meu_audio < -1)) = -1;
	meu_audio(find(meu_audio > +1)) = +1;
	
	audiowrite('toca.wav',meu_audio,fs);
	meu_audio = resample(meu_audio,4e5,fs);
	audiowrite(nome,meu_audio,4e5); % escreve arquivo 

	%plot(meu_audio);