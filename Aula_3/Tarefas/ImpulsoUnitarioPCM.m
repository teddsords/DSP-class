clear all; close all; clc;

x =-1:.01:8;
y = (x == 0);

filetowrite = fopen('ImpulsoUnitario.pcm', 'w');

ydouble = double(y);

fwrite(filetowrite, ydouble, 'double');
fclose('all');

plot(x,y);

grid on;
%stem(x,y);
title('Impulso Unitario');
xlabel('Amostras');
ylabel('Amplitude');