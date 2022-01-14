clear all; close all; clc;

x =-1:.01:3;
y = (x > 0);

filetowrite = fopen('DegrauUnitario.pcm', 'w');

yshort = cast(y, 'int8');

fwrite(filetowrite, yshort, 'short');
fclose('all');

plot(x,y);

grid on;
%stem(x,y);
title('Degrau Unitario');
xlabel('Amostras');
ylabel('Amplitude');

