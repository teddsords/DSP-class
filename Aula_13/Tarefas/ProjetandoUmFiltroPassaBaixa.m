% Programa da tabela 16-1

clear all; close all; clc;
fEntrada = input('Digite o valor  para FC.\n');
BW = input('Digite o valor para a Banda de Passagem.\n');
Fs = input('Digite o valor para Frequencia Amostragem.\n');

% fileopen = fopen('SenoFrequencia1000.pcm', 'r');            % Abrindo o arquivo para ler com esse nome, arquivo ja existente
% x = fread(fileopen, 'short');                              % Atribuindo os valores do arquivo para x
% 
% fileopen2 = fopen('Sweep10_3600.pcm', 'r');
% x2 = fread(fileopen2, 'short');

fc = fEntrada / Fs;                                                         % Frequencia de corte normalizada
BWn = BW / Fs;                                                              % Banda de passagem normalizado
M = 4 / BWn                                                                 % Tamanho da janela

y = zeros(M+1,1);                                                           % Criando a saida


j = 1:M+1;                                                                  % Criando o passo
y = (sin((2*pi*fc.*(j-M/2)))./(j-M/2)) .* (0.54 - 0.46*cos(2*pi*j/M));      % Usando a equacao 16-4
y ( j == M/2) = 2*pi*fc;                                                    % Tratando o caso especial
% a equacao 16-4 utiliza a janela Blackman

soma = 0;                                                                   % Criando a variavel soma

for j = 1:M+1                                                               % For para somar todos os coeficientes
    soma = soma + y(j);
end

for j = 1:M+1                                                               % For para dividir todos os coeficientes e deixar normalizado
    y(j) = y(j)/soma;
    
    y(j) = y(j) * 32768;                                                    % Multiplicacao feita para deixar como short
end

% % Plotando o resultado da convolucao da entrada pela saida
% resultado_conv = conv(x,y);
% figure(1);
% plot(x, 'r');
% hold on;
% plot(resultado_conv, 'b');
% legend('Entrada', 'Saida');
% title('Seno frequencia 1000');
% 
% resultado_conv2 = conv(x2,y);
% figure(2);
% plot(x2, 'r');
% hold on;
% plot(resultado_conv2, 'b');
% legend('Entrada', 'Saida');
% title('Sweep 10 - 3k6');
% 
% 
% % Plotando a resposta em frequencia
% [H, Freq] = freqz(y);
% figure(3);
% plot(Freq*Fs/(2*pi), 20*log10(abs(H)));
% title('Resposta em Frequencia');
% grid on;


csvwrite('CoeficientesFiltroPassaBaixa1000DSPEnvironment.csv', y);

fclose('all');