%% 1.1
n = 2^11; % Number of samples should be a number of 2 in n'th for fft in make_spectrum
fs = 2*n; % sampling frequency will be twice the number of n as it runs in only half a second

%generate sinusoids.
[T1, S1] = generateSignal(1, 500, 0, fs, 0.5);  % one with 500 Hz
[T2, S2] = generateSignal(1, 499, 0, fs, 0.5);  % one with 499 Hz

[y1, F1] = make_spectrum(S1,fs); % make spectrums of both functions
[y2, F2] = make_spectrum(S2,fs);

y1_dB = 20*log10(abs(y1)); % change scale to log10
y2_dB = 20*log10(abs(y2));

figure(1)
hold off 
hold on
plot(T1,S1);
plot(T2,S2);
hold off
xlim([0.49, 0.5]);
title('Magnitude [dB]');
legend('500Hz','499Hz')

figure(2)
hold on
plot(F1,y1_dB);
plot(F2,y2_dB);
hold off
xlim([-length(y1), length(y1)]);
title('Magnitude [dB]');
legend('500Hz','499Hz')

figure(3)
subplot(2,1,1)
hold on
plot(F1,real(y1));
plot(F2,real(y2));
hold off
xlim([-length(y1), length(y1)]);
title('Real part');
subplot(2,1,2)
hold on
plot(F1,imag(y1));
plot(F2,imag(y2));
hold off
xlim([-length(y1), length(y1)]);
title('Imaginary part');


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

figure(3)
plot(t,s);

% part 2

[Y, F] = make_spectrum(s, fs);
figure(4)
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

figure(5)
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
figure(6)
hold on
semilogx(F,20*log10(abs(Y)));
plot(F(3+length(F)/2),2*log10(abs(Y(3))),'O');
hold off
xlim([0 length(F)/2]);
grid()
%%
audiowrite('test.wav',s,fs,'BitsPerSample',16);
%%
[l, f] = import_sound('test.wav');
%%
figure(7)
hold on
plot(t,s);
plot(t,l);
hold off



