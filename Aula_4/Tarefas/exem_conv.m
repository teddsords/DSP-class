% Exemplo do calculo da convolução

clear all;close all; clc;

x = [1 0.5 0.25 0.125];

h =  [0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125];

y = conv(x,h)

tama = length(x) + length(h) -1;

n = (0:1:tama-1);
figure
subplot(2,2,1);
stem(x);
title('X')

subplot(2,2,2);
stem(h);
title('H')

subplot(2,1,2);
stem(n,y)
title('Convol x e h');