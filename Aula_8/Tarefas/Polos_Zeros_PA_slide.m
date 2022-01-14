%Exemplo para plotar a localização dos pólos e zeros
% no plano Z 

% D(Z) =      16kZ^2 + 16k 
%       ----------------------
%        22280Z^2- 12560Z - 9720

clear all; close all; clc;

Num = [16000,16000];
Den = [22280, 12560, -9720];

% Set up vector for zeros
z = roots(Num)

% Set up vector for poles
p = roots(Den)

figure(1);
zplane(z,p);
title('Pole/Zero Plot Example');