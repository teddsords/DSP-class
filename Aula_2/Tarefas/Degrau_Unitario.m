%Programa para plotar função discreta impulso unitário
%Teddy Ordoñez

clear all; close all; clc;

x =-3:1:7;
y = (x > 0);

grid on;
stem(x,y);
title('Degrau Unitario');
xlabel('Amostras');
ylabel('Amplitude');

