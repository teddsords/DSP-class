% Resposta de frequência da média móvel
clc; close all; clear all;

% Variaveis
Fs = 8000;

 
% Usando freqz para obter a resposta em frequencia
num =  [1, 0];
den = [1, -2.1, 1.08];
[H, Freq] = freqz(num,den,Fs);
plot(Freq*Fs/(2*pi), 20*log10(abs(H)));
figure(2);
plot(Freq, 20*log10(abs(H)));
title('Magnitude da resposta em frequencia')
grid on;


 