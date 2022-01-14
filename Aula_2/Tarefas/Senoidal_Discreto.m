%%Programa para plotar fun��o discreta senoidal
%Teddy Ordo�ez

clear all; close all; clc;

fo = 100;
Fs = 8000;
Ts = 1/Fs;

n = -100:100;
y = sin(2*pi*n*fo/Fs);

stem(n,y);
grid on;
title('Sequencia Exponencial');
xlabel('Amostras');
ylabel('Amplitude');