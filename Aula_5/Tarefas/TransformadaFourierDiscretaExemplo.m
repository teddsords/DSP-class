clear all; close all; clc;
a = .5;
w = [-1*pi :pi/100 : 1*pi];

Num = 1;
Den = 1 - a * exp(-1i *w);
X = Num ./ Den;

Mod_X = abs(X);
Fase_X = angle(X);

subplot (2,1,1);
plot(w, Mod_X);
title('Modulo de X');
xlabel('w');
grid on;

subplot (2,1,2);
plot(w, Fase_X);
title('Fase de X');
xlabel('w');
grid on;

