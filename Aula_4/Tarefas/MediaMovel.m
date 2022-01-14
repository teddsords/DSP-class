clc
clear all
close all
  

x = [1, 0.5, 0.25, 0.125]
  
a=input('Enter the no.:');                          % Pedindo o numero de coeficiente
t2=ones(1,a);                                       % Criando um vetor de uns com a largura do coeficiente
num=(1/a)*t2;                                       % Criando o numerador apos ter multiplicado pelo coeficiente
den=[1];                                            % Criando denominador, que tem coeficiente 1
% Foi possivel fazer desse jeito apos fazer a transformada Z

y=filter(num,den,x);                                % Utilizando a funcao filter nativa, foi utilizada uma funcao de transferencia

stem(y);                          % Plotando o sinal filtrado