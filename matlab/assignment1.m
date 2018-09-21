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

%% 1.2
% part 1
N = 4;
f0 = 25;
phi = pi/3;
fs = 5000;
T_s = 0.1;
[t, s0] = generate_sinusoid(1, f0, k*phi, fs, T_s);
s = s0;
% cos(2*pi * 2^k * f0 * t + k * pi/3) f0 = 25
for k = 0:N
    [t, s0] = generate_sinusoid(1, f0*2^k, k*phi, fs, T_s);
    s = s0 + s;
end

t = ones(1,length(t))*0.8 + t;

figure(1)
plot(t,s);

% part 2

[Y, F] = make_spectrum(s, fs);
figure(1)
plot(F,Y);
xlim([-length(Y), length(Y)]);

