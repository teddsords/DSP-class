% Resposta de frequência da média móvel
clc; close all; clear all;

% Variaveis
Fs = 8000;

 
% Usando freqz para obter a resposta em frequencia
num =   3 .* [1, -1.2];
den = [1, -1.4, 0.45];
[H, Freq] = freqz(num,den,Fs);
plot(Freq, 20*log10(abs(H)));
title('Magnitude da resposta em frequencia')
grid on;


 