clear all; close all; clc;
fEntradaPB = input('Digite o valor  para FC do Filtro Passa Baixa.\n');
fEntradaPA = input('Digite o valor  para FC do Filto Passa Alta.\n');
BW = input('Digite o valor para a Banda de Passagem.\n');
Fs = input('Digite o valor para Frequencia Amostragem.\n');

fileopen = fopen('SenoFrequencia1000.pcm', 'r');            % Abrindo o arquivo para ler com esse nome, arquivo ja existente
x = fread(fileopen, 'short');                              % Atribuindo os valores do arquivo para x

fileopen2 = fopen('SenoFrequencia1500.pcm', 'r');            % Abrindo o arquivo para ler com esse nome, arquivo ja existente
x2 = fread(fileopen2, 'short');                              % Atribuindo os valores do arquivo para x

fileopen3 = fopen('SenoFrequencia2000.pcm', 'r');            % Abrindo o arquivo para ler com esse nome, arquivo ja existente
x3 = fread(fileopen3, 'short');                              % Atribuindo os valores do arquivo para x

fileopen4 = fopen('Sweep10_3600.pcm', 'r');            % Abrindo o arquivo para ler com esse nome, arquivo ja existente
x4 = fread(fileopen4, 'short');                              % Atribuindo os valores do arquivo para x

fc1 = fEntradaPB / Fs;                                                      % Frequencia de corte normalizada
BWn = BW / Fs;                                                              % Banda de passagem normalizado
M = 4 / BWn                                                                 % Tamanho da janela

yPB = zeros(M+1,1);                                                         % Criando a saida


j = 1:M+1;                                                                  % Criando o passo
yPB = (sin((2*pi*fc1.*(j-M/2)))./(j-M/2)) .* (0.54 - 0.46*cos(2*pi*j/M));    % Usando a equacao 16-4
yPB ( j == M/2) = 2*pi*fc1;                                                  % Tratando o caso especial
% a equacao 16-4 utiliza a janela Blackman

soma = 0;                                                                   % Criando a variavel soma
for j = 1:M+1                                                               % For para somar todos os coeficientes
    soma = soma + yPB(j);
end

for j = 1:M+1                                                               % For para dividir todos os coeficientes e deixar normalizado
    yPB(j) = yPB(j)/soma;
end

fc2 = fEntradaPA / Fs;                                                         % Frequencia de corte normalizada

yPA = zeros(M+1,1);                                                           % Criando a saida para o PA

j = 1:M+1;                                                                  % Criando o passo
yPA = (sin((2*pi*fc2.*(j-M/2)))./(j-M/2)) .* (0.54 - 0.46*cos(2*pi*j/M));      % Usando a equacao 16-4 para criar o PB
yPA ( j == M/2) = 2*pi*fc2;                                                    % Tratando o caso especial
% a equacao 16-4 utiliza a janela Blackman

soma2 = 0;                                                                   % Criando a variavel soma

for j = 1:M+1                                                               % For para somar todos os coeficientes
    soma2 = soma2 + yPA(j);
end

for j = 1:M+1                                                               % For para dividir todos os coeficientes e deixar normalizado
    yPA(j) = yPA(j)/soma2;
end

for j = 1:M+1
    yPA(j) = -yPA(j);
end
yPA(M/2) = yPA(M/2) + 1;

ysaida = zeros(1,M+1);

for j = 1:M+1
    ysaida(j) = yPB(j) + yPA(j);
end

for j = 1:M+1
    ysaida(j) = -ysaida(j);
end
ysaida(M/2) = ysaida(M/2) + 1;

resultado_conv = conv(x,ysaida);
figure(1);
plot(x, 'r');                                                               % Plotandoa  entrada em vermelho
hold on;                                                                    % Hold no grafico
plot(resultado_conv, 'b');                                                  % Plotando a entrada apos passar pelo filtro
title('Seno Frequencia 1000');
legend('Entrada', 'Saida');

resultado_conv2 = conv(x2,ysaida);
figure(2);
plot(x2, 'r');                                                               % Plotandoa  entrada em vermelho
hold on;                                                                    % Hold no grafico
plot(resultado_conv2, 'b');                                                  % Plotando a entrada apos passar pelo filtro
title('Seno Frequencia 1500');
legend('Entrada', 'Saida');

resultado_conv3 = conv(x3,ysaida);
figure(3);
plot(x3, 'r');                                                               % Plotandoa  entrada em vermelho
hold on;                                                                    % Hold no grafico
plot(resultado_conv3, 'b');                                                  % Plotando a entrada apos passar pelo filtro
title('Seno Frequencia 2000');
legend('Entrada', 'Saida');

resultado_conv4 = conv(x4,ysaida);
figure(4);
plot(x4, 'r');                                                               % Plotandoa  entrada em vermelho
hold on;                                                                    % Hold no grafico
plot(resultado_conv4, 'b');                                                  % Plotando a entrada apos passar pelo filtro
title('Sweep 10 - 3k6');
legend('Entrada', 'Saida');

[H, Freq] = freqz(ysaida);
figure(5);
plot(Freq*Fs/(2*pi), 20*log10(abs(H)));
title('Resposta em Frequencia');
grid on;

csvwrite('CoeficientesFiltroPassaBanda1000_2000.csv', ysaida);

fclose('all');
