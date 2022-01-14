% plotando a função SINC

clear all; close all; clc;
x = -5:0.0001:5;                % Definindo o valor de x
fc = 0.5;                       % Definindo a freq corte
a = 2 * pi * fc;                % Multiplicando por 2pi
y = (sin(a * x))./ (pi*x);      % Criando a saida
y(x == 0) = 1;                  % Condicao especial para divisao por 0

plot(x,y);                      % Plotando sinal anterior
title('Sinc Function');         % Titulo

x2 = linspace (-5,5);           % Criando outra variavel x
y2 = sinc(x2);                  % Utilizando func nativa do MATLAB
figure(2);                      % Criando segunda figura 
plot(x2,y2);                    % Plotando funcao nativa
title('Sinc Function Nativa');