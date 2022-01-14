% Exercicio do slide aula_4 pag 19.
clear all; close all; clc;

w = [-1: 0.001: 1];
%X = exp(1i * w) + 1 + exp(-1i * w); 
X = 2 * cos(w) + 1;    % Pode ser utilizado tambem pois 2cos(w) é igual às exponenciais complexas
Mod_X = abs(X);
Fase_X = angle(X);

subplot (2,1,1);
plot(w, Mod_X);
title('Modulo de X');
xlabel('w');
grid on;

subplot (2,1,2);
plot(w, Fase_X);
title('Fase de X');
xlabel('w');
grid on;