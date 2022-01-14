
%Exemplo para plotar a localização dos pólos e zeros
% no plano Z 

% D(Z) =     Z + 0.8
%       ----------------
%       (Z^2 + Z + 0.41)

clear all; close all; clc;

Num = [1,0.9];
Den = [1,1,0.41];

% Set up vector for zeros
z = roots(Num)

% Set up vector for poles
p = roots(Den)

figure(1);
zplane(z,p);
title('Pole/Zero Plot Example');