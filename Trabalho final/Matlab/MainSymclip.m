% Main Symclip

filename = 'Seno.wav';

% read the sample waveform
[x,Fs] = audioread(filename);

y = symclip(x);

figure(1);
grid on;
plot(x);
hold on;
plot(y);


% write output
audiowrite('Seno_SYMCLIP.wav', y, Fs);
