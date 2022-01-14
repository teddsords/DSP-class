% Programa para plotar Eq 16.4

clear all; close all; clc;
M = input('Digite o valor para M. (Entrar com numero par, por favor)\n');   % Pedindo o tamanho da janela
freqC = input('Digite o valor para frequencia de corte.\n');                % Pedindo o valor da frequencia de corte
Fs = 8000;                                                                  % Frequencia de amostragem

fc = freqC / Fs;                                                            % Normalizando a frequencia de corte

j = 0:0.1:M;                                                                % criando o passo
MetadeM = M / 2;                                                            % Tamanho da janela dividido por 2
num = sin(2 * pi * fc * (j - MetadeM));                                     % Criando o numerador da equacao
den = j - MetadeM;                                                          % Criando o denominador da equacao        

y = (num ./ den) .* (0.42 - 0.5 * cos((2 * pi * j)/M) + 0.08 * cos((4 * pi *j)/M));         % Juntando as duas partes da equacao
y(j == MetadeM) = 2 * pi * fc;                                                              % Tratando o caso especialda divisao por 0

plot(j,y);
title('Equação 16-4');
grid on;

[H, Freq] = freqz(y);
figure(2);
plot(Freq*Fs/(2*pi), 20*log10(abs(H)));
title('Resposta em Frequencia');
grid on;