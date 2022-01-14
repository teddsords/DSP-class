% Passar um seno com a frequencia de corte
% 20*log10(Amplitude saida / Amplitude de entrada)

clc
clear all
close all
  
fid_write = fopen('SaidaPAcomSeno.pcm', 'w');      % Abrindo o arquivo na forma de escrita com esse nome, arquivo novo
fileopen = fopen('SinoFrequencia400.pcm', 'r');            % Abrindo o arquivo para ler com esse nome, arquivo ja existente
x = fread(fileopen, 'short');                         % Atribuindo os valores do arquivo para x

ynm1 = 0;
xnm1 = 0;

% Parametros de entrada
Fc = 400;
Fs = 8000;
Wc = 2 * pi * Fc;

% Calculando o F'
Fli = 2 * Fs;

% Calculando as constantes da equacao diferenca para ele ser versatil
a = Fli / (Fli + Wc);
b = (Wc - Fli) / (Fli + Wc);


tama_loop = length(x);
vet_saida = zeros(tama_loop,1);

for j = 1: tama_loop
    input = x(j,1);
    

    
    y = a * input - a * xnm1 - b * ynm1;
    
    % Desloca o vetor de delay
    ynm1 = y;
    xnm1 = input;
    
    
    vet_saida(j,1) = y;
end 

fwrite(fid_write,vet_saida,'short');                        % Escrevendo no arquivo de saida
fclose('all');
plot(x,'b');
hold on;
plot(vet_saida,'r','linewidth',2);                          % Plotando equacao diferenca
grid on;