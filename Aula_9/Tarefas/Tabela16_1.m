% Programa da tabela 16-1

clear all; close all; clc;
fEntrada = input('Digite o valor  para FC.\n');
BW = input('Digite o valor para a Banda de Passagem.\n');
Fs = input('Digite o valor para Frequencia Amostragem.\n');

fc = fEntrada / Fs;                                                         % Frequencia de corte normalizada
BWn = BW / Fs;                                                              % Banda de passagem normalizado
M = 4 / BWn                                                                 % Tamanho da janela

y = zeros(M+1,1);                                                           % Criando a saida


j = 1:M+1;                                                                  % Criando o passo
y = (sin((2*pi*fc.*(j-M/2)))./(j-M/2)) .* (0.54 - 0.46*cos(2*pi*j/M));      % Usando a equacao 16-4
y ( j == M/2) = 2*pi*fc;                                                    % Tratando o caso especial


soma = 0;                                                                   % Criando a variavel soma

for j = 1:M+1                                                               % For para somar todos os coeficientes
    soma = soma + y(j);
end

for j = 1:M+1                                                               % For para dividir todos os coeficientes e deixar normalizado
    y(j) = y(j)/soma;
end

[H, Freq] = freqz(y);
figure(1);
plot(Freq*Fs/(2*pi), 20*log10(abs(H)));
title('Resposta em Frequencia');
grid on;

csvwrite('CoeficientesTabela16_1.csv', y);