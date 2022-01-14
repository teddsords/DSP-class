%Programa para plotar função discreta impulso unitário
%Teddy Ordoñez

clear all; close all; clc;


x =-5:1:5;
y = (x == 0);
%t = (-1:0.001:1);
% impulse = t==0;
% impulseNumeric = double(impulse);
% 
% filewrite = fopen('ImpulsoUnitario.pcm', 'w');
% fwrite(filewrite, impulseNumeric, 'double');
% fclose('all');
plot(x,y);
grid on;
stem(x,y);
title('Impulso Unitario');
xlabel('Amostras');
ylabel('Amplitude');

