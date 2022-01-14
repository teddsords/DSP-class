% Exemplo do calculo da convolução

clear all;close all; clc;

x = [1 1 1 1 1 1];      % Definindo a entrada x como degrau unitario

h =  [0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125];     % Definindo outro operando como 0.125 cada um

y = conv(x,h)           % Utilizando a funcao da convolucao do Matlab

tama = length(x) + length(h) -1;        % Definindo o tamanho que é igual à soma de ambas larguras 

n = (0 : 1 : tama - 1);
figure
subplot(2,2,1);
stem(x);            % Plotando o sinal X
title('X')

subplot(2,2,2);
stem(h);            % Plotando o sinal H
title('H')

subplot(2,1,2);
stem(n,y)           % Plotando a resposta da convulação entre X e H.
title('Convol x e h');