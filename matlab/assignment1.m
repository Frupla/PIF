%% 1.1
n = 2^11;
fs = 2*n;
[T, S] = generateSignal(1, 500, 0, fs, 0.5); 
% We choose fs = 2000Hz, as it is well above fn = 1000hz

[Y, F] = make_spectrum(S,fs);

y = fftshift(Y);

figure(1)
plot(F,abs(y));
figure(2)
plot(F,imag(y));
