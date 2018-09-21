function [time_vector, signal] = generate_sinusoid(a, f, phi, fs, T)
% Input: a, f, phi, fs, t
% This function returns two vectors t (time vector) and s (signal vector)
% It generates a sinusoid signal with the following parameters
% a * sin(2*pi*f*t + phi)
% where the time vector t goes from 0 to T - 1/fs, with increments of 1/fs
time_vector = 0:1/fs:T-1/fs;
signal = a*sin(2*pi*f*time_vector + phi);

end
