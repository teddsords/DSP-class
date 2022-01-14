% Exemplo do calculo da convolu��o

clear all;close all; clc;

x = [1 0 0 0 0 0];      % Criando o impulso unitario

h =  [0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125];     % Criando outra entrada para a convolu��o

y = conv(x,h)           % Fazendo a convula��o entre x e H

tama = length(x) + length(h) - 1;        % Definindo o tamanho para plotar

n = (0 : 1 :tama - 1);  % Criando um vetor que anda de um em um at� tamanho - 1
figure
subplot(2,2,1);
stem(x);                % Plotando o sinal de entrada X
title('X')

subplot(2,2,2);
stem(h);                % Plotando o sinal de entrada H
title('H')

subplot(2,1,2);
stem(n,y)               % Plotando o sinal de sa�da H e definindo que o eixo X tem os valores de n.
title('Convol x e h');