function [output] = hsfilter(theta, Fs, input)
% hsf ilter(theta, Fs, input)
% filters the input signal according to head shadowing
% theta is the angle with the frontal plane
% Fs is the sample rate
%
theta = theta + 90;
theta0 = 150 ; 
alfa_min = 0.05 ;
c = 334; % speed of sound
a = 0.08; % radius of head
wO = c/a;
alfa = 1 + alfa_min/2 + (1 - alfa_min / 2) * cos(theta / theta0 * pi);

% numerator of Transfer Function
B = [ (alfa + wO/Fs) / (1 + wO/Fs) , (-alfa + wO/Fs) / (1 + wO/Fs) ];

% denominator of Transfer Function
A = [1, -(1  - wO/Fs)/(1 + wO/Fs)];



if (abs(theta) < 90)
    gdelay = - Fs/wO * (cos(theta*pi/180) - 1);
else 
    gdelay = Fs/wO*  ((abs(theta) - 90) * pi/180 + 1);
end ;
    
% allpass filter coefficient
a = (1 - gdelay) / (1 + gdelay) ;


out_magn = filter(B, A, input);
output = filter( [a, 1], [1 , a] , out_magn);


