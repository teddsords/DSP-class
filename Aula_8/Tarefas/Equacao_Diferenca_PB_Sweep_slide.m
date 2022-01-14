clc
clear all
close all
  
fid_write = fopen('Sweep10_3600EQDifPB.pcm', 'w');      % Abrindo o arquivo na forma de escrita com esse nome, arquivo novo
fileopen = fopen('Sweep10_3600.pcm', 'r');            % Abrindo o arquivo para ler com esse nome, arquivo ja existente
x = fread(fileopen, 'short');                         % Atribuindo os valores do arquivo para x

ynm1 = 0;
xnm1 = 0;

%calculando os parametros Wc = 2*pi*Fc
Fc = 100;
Fs = 8000;
Wc = 2 * pi * Fc;

Fli = 2 * Fs;
a =  Wc / (Fli + Wc);
b =  (Wc - Fli) / (Fli + Wc);

tamaloop = length(x);
vet_saida = zeros(tamaloop,1);

for j = 1: tamaloop
    input = x(j,1);
    

    
    y = a * input + a * xnm1 - b * ynm1;
    
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





