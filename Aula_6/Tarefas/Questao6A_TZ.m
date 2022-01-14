
%Exemplo para plotar a localização dos pólos e zeros
% no plano Z 

% D(Z) =        Z + 0.6
%       ----------------------
%       (Z^2 + 0.6Z + 0.2)(Z-1)

clear all; close all; clc;

Num = [1,0.6];
Den = [1,-0.4, -0.4, -0.2];

% Set up vector for zeros
z = roots(Num)

% Set up vector for poles
p = roots(Den)

figure(1);
zplane(z,p);
title('Pole/Zero Plot Example');