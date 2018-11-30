function [t s] = generateSignal(a,f,phi,fs,T)
% Input: a, f, phi, fs, T
% This function returns two vectors t (time vector) and s (signal vector)
% It generates a sinusoid signal with the following parameters
% a * sin(2*pi*f*t + 2*pi*phi)
% where the time vector t goes from 0 to T - 1/fs, with increments of 1/fs

t = 0:(1/fs):T - 1/fs;
s =  a*sin(2*pi*f*t + 2*pi*phi);
end