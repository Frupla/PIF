function [t s] = generateSignal(a,f,phi,fs,T)
t = 0:(1/fs):T - 1/fs;
s =  a*sin(2*pi*f*t + 2*pi*phi);
end