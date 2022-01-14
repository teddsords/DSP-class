%% this part is the implementation of the function hsfilter
% to a given input sound,we need to apply the function twice, for the left
% and right ears with opposite values of argument theta. Here I create 3
% pairs of sounds assumed come from different azimuth angle.

clc; clear all; close all;
[input, Fs] = audioread('Oi.wav');% import the mono sound source
csvwrite('input.csv', input);
Fs
[soL20] = hsfilter(20, Fs, input);%create the Right signal comes from 20 degree azimuth angle
[soR20] = hsfilter(-20, Fs, input);% Left from 20 degree
[soL45] = hsfilter(45, Fs, input);% Right from 45 degree
[soR45] = hsfilter(-45, Fs, input);% Left from 45 degree
[soL80] = hsfilter(80, Fs, input);% Right from 80 degree
[soR80] = hsfilter(-80, Fs, input);% Left from 45 degree

so20 = [soL20, soR20]; %create a stereo sound using the elements obtained above
so45 = [soL45, soR45];
so80 = [soL80, soR80];

sound(so20, Fs); %listen to this 3 sounds
sound(so45, Fs);
sound(so80, Fs);


audiowrite('Oi20.wav', so20, Fs); % save the output results as wave files
audiowrite('Oi45.wav', so45, Fs);
audiowrite('Oi80.wav', so80, Fs);
