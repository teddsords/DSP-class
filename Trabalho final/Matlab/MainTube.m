% Main tube

filename = 'Seno.wav';

% read the sample waveform
[x,Fs] = audioread(filename);

gain = 1;
Q = -0.2;
dist = 8;
mix = 1;

y = tube(x, gain, Q, dist, mix, 0.9, 0.7);

figure(1);
plot(x);
hold  on;
plot(y);

% write output
audiowrite('Seno_OVERDRIVE.wav', y, Fs);
