clear all
close all
clc
fs = 100e6;
Ts = 1 / fs;

fc = 5e6;

t = 0:Ts:2e-6;

x = cos(2 * pi * fc * t);
x = [x zeros(1, 100)];
x_sqr = x.^2;

lpf = ones(1, 16);
lpf = lpf / length(lpf);

env = filter(lpf, 1, x_sqr);

plot(x)
title('Original Signal')
figure
plot(env)
title('Envelope Detector')