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
k = 0;
[t, s0] = generate_sinusoid(1, f0, k*phi, fs, T_s);
s = s0;
% cos(2*pi * 2^k * f0 * t + k * pi/3) f0 = 25
for k = 1:N
    [t, s0] = generate_sinusoid(1, f0*2^k, k*phi-1/pi, fs, T_s);
    s = s0 + s;
end

t = ones(1,length(t))*0.8 + t;

figure(1)
plot(t,s);

% part 2

[Y, F] = make_spectrum(s, fs);
figure(1)
subplot(2,1,1)
plot(F,20*log10(abs(Y)));
xlim([-length(Y), length(Y)]);
title('Magnitude [dB]');
grid();


subplot(2,1,2)
plot(F,phase(Y));
xlim([-length(Y), length(Y)]);
ylim([0 4*pi]);
title('Phase');
yticks(0:pi:4*pi);
yticklabels({'0','\pi','2\pi','3\pi','4\pi'});
grid();

figure(2)
subplot(2,1,1)
plot(F,real(Y));
xlim([-length(Y), length(Y)]);
title('Real part');
grid();

subplot(2,1,2)
plot(F,imag(Y));
xlim([-length(Y), length(Y)]);
title('Imaginary part');
grid();

%% part 3
figure(3)
semilogx(F,20*log10(abs(Y)));
xlim([0 length(F)/2]);
grid()
%%
audiowrite('test.wav',Y,fs,'BitsPerSample',16);
[l, f] = importSound('test.wav');
%%
figure(4)
hold on
plot(t,s);
plot(0.85:,l);
hold off


