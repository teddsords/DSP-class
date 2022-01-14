% Exemplo do calculo da convolução

clear all;close all; clc;

x = [1 0 0 0 0 0];      % Criando o impulso unitario

h =  [0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125];     % Criando outra entrada para a convolução

y = conv(x,h)           % Fazendo a convulação entre x e H

tama = length(x) + length(h) - 1;        % Definindo o tamanho para plotar

n = (0 : 1 :tama - 1);  % Criando um vetor que anda de um em um até tamanho - 1
figure
subplot(2,2,1);
stem(x);                % Plotando o sinal de entrada X
title('X')

subplot(2,2,2);
stem(h);                % Plotando o sinal de entrada H
title('H')

subplot(2,1,2);
stem(n,y)               % Plotando o sinal de saída H e definindo que o eixo X tem os valores de n.
title('Convol x e h');