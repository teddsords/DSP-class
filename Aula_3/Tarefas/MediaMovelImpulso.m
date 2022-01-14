clc; close all; clear all;


filewrite = fopen('ImpulsoUnitarioFiltered.pcm', 'w');      % Abrindo o arquivo a ser escrito apos passar pela MM
fileread = fopen('ImpulsoUnitario.pcm', 'r');               % Abrindo o arquivo de impulso unitario pcm
x = fread(fileread, 'short');

a=input('Enter the no.:');                          % Pedindo o numero de coeficiente
t2=ones(1,a);                                       % Criando um vetor de uns com a largura do coeficiente
num=(1/a)*t2;                                       % Criando o numerador apos ter multiplicado pelo coeficiente
den=[1];

y = filter(num, den, x);

fwrite(filewrite, y,'short');                        % Escrevendo no arquivo de saida
fclose('all');                                      % Fechando todos os arquivos
plot(x,'b');                                        % Plotando o sinal original
hold on;                                            % Holding
plot(y,'r','linewidth',2);                          % Plotando o sinal filtrado
legend('Noisy signal','Filtered signal');           % Criando legenda