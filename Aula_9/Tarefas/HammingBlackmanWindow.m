% Plotando Hamming and Blackman Window

clear all; close all; clc;
M = input('Qual o tamanho para a janela?\n');
Mf = 0:0.001:M;
Fs = 8000;

w = 0.54 - 0.46*cos((2 * pi * Mf)/ M);
B = 0.42 - 0.5*cos((2 * pi * Mf)/M) + 0.08*cos((4 * pi * Mf)/M);

figure(1);
plot(Mf, w);
title('Janela Hamming & Blackman');
hold on;
plot(Mf,B);
legend('Hamming', 'Blackman');

[H, Freq] = freqz(w, Fs);
figure(2);
plot(Freq*Fs/(2*pi), 20*log10(abs(H)));
grid on;
hold on;

[HB, FreqB] = freqz(B, Fs);
plot(FreqB*Fs/(2*pi), 20*log10(abs(HB)));

title('Resposta em frequencia Hamming e Blackman');
