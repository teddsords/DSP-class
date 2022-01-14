% Exemplo sistema discreto
% equaçao diferença: y[n] = 0.282x[n] + .282x[n-1] + 0.4361y[n-1]
% walter
clear all; close all; clc;


tama =  11;
% Definindo a entrada
x = ones(tama,1);       % definindo degrau unitario

tama_loop = length(x);
vet_saida = zeros(tama_loop,1);

% Definindo as condições iniciais 
ynm1 = 0;
xnm1 = 0;            % serao utilizados para realizar a entrada atrasada.

vet_saida(1,1) = 0;  %definindo a saida para os valores neg de x
vet_saida(2,1) = 0;  %ja que sempre  sera 0. 

for j = 3: tama_loop
    input = x(j,1);
    

    
    y = 0.282 * input + 0.282 * xnm1 + 0.4631 * ynm1 ;
    
    % Desloca o vetor de delay
    ynm1 = y;
    xnm1 = input;
    
    vet_saida(j,1) = y;
end    


% plotando o Entrada e saida
subplot(2,1,1)
stem(x)
title('Entrada x[n]');xlabel('n');
grid on;

subplot(2,1,2)
xGraph = [-2 -1 0 1 2 3 4 5 6 7 8];
stem(xGraph,vet_saida)
title('Saída y[n]');xlabel('n');
grid on;

 vet_saida