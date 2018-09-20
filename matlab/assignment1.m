%% 1.1
n = 2^11;
fs = 2*n;
[T, S] = generateSignal(1, 500, 0, fs, 0.5); 

[y, F] = make_spectrum(S,fs);

y_dB = 20*log10(abs(y));

figure(1)
plot(F,y_dB);
xlim([-length(y), length(y)]);
figure(2)
plot(F,real(y));
xlim([-length(y), length(y)]);
figure(3)
plot(F,imag(y));
xlim([-length(y), length(y)]);
figure(4)
plot(F,angle(y));
xlim([-length(y), length(y)]);
