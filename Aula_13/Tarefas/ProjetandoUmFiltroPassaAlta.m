% Programa da tabela 16-1

clear all; close all; clc;
fEntrada = input('Digite o valor  para FC.\n');
Fs = input('Digite o valor para Frequencia Amostragem.\n');
BW = input('Digite o valor para a Banda de Passagem.\n');

% fileopen = fopen('SenoFrequencia2000.pcm', 'r');            % Abrindo o arquivo para ler com esse nome, arquivo ja existente
% x = fread(fileopen, 'short');                              % Atribuindo os valores do arquivo para x
% 
% fileopen2 = fopen('Sweep10_3600.pcm', 'r');
% x2 = fread(fileopen2, 'short');

fc = fEntrada / Fs;                                                         % Frequencia de corte normalizada
BWn = BW / Fs;                                                              % Banda de passagem normalizado
M = 4 / BWn                                                                 % Tamanho da janela

y = zeros(M+1,1);                                                           % Criando a saida para o PA

j = 1:M+1;                                                                  % Criando o passo
y = (sin((2*pi*fc.*(j-M/2)))./(j-M/2)) .* (0.54 - 0.46*cos(2*pi*j/M));      % Usando a equacao 16-4 para criar o PB
y ( j == M/2) = 2*pi*fc;                                                    % Tratando o caso especial
% a equacao 16-4 utiliza a janela Blackman

soma = 0;                                                                   % Criando a variavel soma

for j = 1:M+1                                                               % For para somar todos os coeficientes
    soma = soma + y(j);
end

for j = 1:M+1                                                               % For para dividir todos os coeficientes e deixar normalizado
    y(j) = y(j)/soma;
end

for j = 1:M+1
    y(j) = -y(j);
    
    
    y(j) = y(j) * 32768;                                                    % Multiplicacao feita para deixar como short
end
y(M/2) = y(M/2) + 1;

                                                                            % Fazendo a convolucao da entrada com os coeficientes
% resultado_conv = conv(x,y);
% figure(1);
% plot(x, 'r');                                                               % Plotandoa  entrada em vermelho
% hold on;                                                                    % Hold no grafico
% plot(resultado_conv, 'b');                                                  % Plotando a entrada apos passar pelo filtro
% legend('Entrada', 'Saida');
% title('Seno Frequencia 2000');
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
% [H, Freq] = freqz(y);
% figure(3);
% plot(Freq*Fs/(2*pi), 20*log10(abs(H)));
% title('Resposta em Frequencia');
% grid on;

csvwrite('CoeficientesFiltroPassaAlta2000DSPEnvironment.csv', y);