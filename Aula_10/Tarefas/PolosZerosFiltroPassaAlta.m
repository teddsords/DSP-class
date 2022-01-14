%Exemplo para plotar a localização dos pólos e zeros
% no plano Z 

% D(Z) =      wc + wcz-1
%       ----------------------
%          (F' +wc) + (wc-F')z-1

clear all; close all; clc;
Fc = input('Valor da frequencia de corte.\n');
Fs = input('Frequencia de amostragem.\n');
Wc = 2 * pi * Fc;
Fli = 2 * Fs;
Num = [Wc,Wc];
Den = [(Fli+Wc), (Wc-Fli)];

% Set up vector for zeros
z = roots(Num)

% Set up vector for poles
p = roots(Den)

figure(1);
zplane(z,p);
title('Pole/Zero Plot Example');