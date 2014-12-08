clear all; close  all; clc;

fs =4e5;
f_portadora = 2e4;


t = 0 :1/fs:5;
sinal = cos(2*pi*2000*t);%wavread('music.wav');
sinal=sinal(:).';

sinal_modulado=modulacao_PM(sinal,fs,f_portadora,10,1,800);
%[sinal_demodulado ] = demodulacao_AM_SSB(sinal_modulado,fs,f_portadora);

%L = min([length(sinal) length(sinal_demodulado)]);
%sinal_demodulado = sinal_demodulado-mean(sinal_demodulado);
%sinal_demodulado = sinal_demodulado/max(sinal_demodulado);
%sinal_demodulado(find(sinal_demodulado < -1)) = -1;
%sinal_demodulado(find(sinal_demodulado > +1)) = +1;

%sinal_demodulado = sinal_demodulado(1+delay:L);
%sinal = sinal/max(abs(sinal));
%sinal=sinal(1:L-delay);

%musica = downsample(sinal_demodulado,fs/8e3);
%audiowrite('saida.wav',musica,8000);