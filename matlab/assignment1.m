%% 1.1
n = 2^11;
fs = 2*n;
[T, S] = generateSignal(1, 500, 0, fs, 0.5); 
% We choose fs = 2000Hz, as it is well above fn = 1000hz

[y, F] = make_spectrum(S,fs);


figure(1)
plot(F,abs(y));
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
