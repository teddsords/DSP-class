%Exemplo para plotar a localização dos pólos e zeros
% no plano Z 

% D(Z) =      6280Z + 6280 
%       ----------------------
%          22280Z + -9720

clear all; close all; clc;

Num = [6280,6280];
Den = [22280,-9720];

% Set up vector for zeros
z = roots(Num)

% Set up vector for poles
p = roots(Den)

figure(1);
zplane(z,p);
title('Pole/Zero Plot Example');