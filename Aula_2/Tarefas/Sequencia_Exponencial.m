%%Programa para plotar fun��o discreta de sequencia exponencial
%Teddy Ordo�ez

clear all; close all; clc;
x=0:10;
base = 0.5;
y = base.^x;

grid on;
stem(x,y);
title('Sequencia Exponencial');
xlabel('Amostras');
ylabel('Amplitude');