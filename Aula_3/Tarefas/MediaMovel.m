clc
clear all
close all
  
fid_write = fopen('WhiteNoiseFiltered.pcm', 'w');   % Abrindo o arquivo na forma de escrita com esse nome, arquivo novo
fileopen = fopen('WhiteNoise.pcm', 'r');            % Abrindo o arquivo para ler com esse nome, arquivo ja existente
x = fread(fileopen, 'short');                                % Atribuindo os valores do arquivo para x
  
a=input('Enter the no.:');                          % Pedindo o numero de coeficiente
t2=ones(1,a);                                       % Criando um vetor de uns com a largura do coeficiente
num=(1/a)*t2;                                       % Criando o numerador apos ter multiplicado pelo coeficiente
den=[1];                                            % Criando denominador, que tem coeficiente 1
% Foi possivel fazer desse jeito apos fazer a transformada Z

y=filter(num,den,x);                                % Utilizando a funcao filter nativa, foi utilizada uma funcao de transferencia

fwrite(fid_write,y,'short');                        % Escrevendo no arquivo de saida
fclose('all');                                      % Fechando todos os arquivos
plot(x,'b');                                        % Plotando o sinal original
hold on;
% Holding
plot(y,'r','linewidth',2);                          % Plotando o sinal filtrado
legend('Noisy signal','Filtered signal');           % Criando legenda