%% 1.1
fs = 2^12; % fft works in sets of 2^n, so fs should be set to be a multiple of 2 

%generate sinusoids.
[T1, S1] = generate_signal(1, 500, 0, fs, 0.5);  % one with 500 Hz
[T2, S2] = generate_signal(1, 499, 0, fs, 0.5);  % one with 499 Hz

[y1, F1] = make_spectrum(S1,fs); % make spectrums of both functions
[y2, F2] = make_spectrum(S2,fs); % The signals are fourier transformed and shifted


y1_dB = 20*log10(abs(y1)); % change scale to log10
y2_dB = 20*log10(abs(y2)); % the signals are turned into the decibel format
                           % and plottet 
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
legend('500hz','499hz');

%% 1.2
% part 1
N = 4; % initialisation of variables
f0 = 25;
phi = pi/3;
fs = 5000; 
T_s = 0.1;
k = 0;
% cos(2*pi * 2^k * f0 * t + k * pi/3):
[t, s0] = generate_sinusoid(1, f0, k*phi, fs, T_s);
s = s0;
for k = 1:N
    [t, s0] = generate_sinusoid(1, f0*2^k, k*phi-1/pi, fs, T_s);
    s = s0 + s;
end

t = ones(1,length(t))*0.8 + t; % time vector is changed into [0.8, 0.9]

figure(3)
plot(t,s); % Plotting the sinsusoid
% Using mad matlab skillz to make a title with a sum sign in it:
str = '$$ s(n)=\sum^{4}_{k=0} cos\left(2\pi\cdot2^{k}f_{0}\cdot t + k \cdot \frac{\pi}{3}\right) $$';
title(str,'Interpreter','latex') 


% part 2

[Y, F] = make_spectrum(s, fs); % Making a spectrum for the signal from before

figure(4) % Magnitude and phase
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

figure(5) % Real and imaginary part
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
semilogx(F,20*log10(abs(Y))); % plotting the x axis logarithmically
plot(F(3+length(F)/2),2*log10(abs(Y(3))),'O');
hold off
title('First peak');
xlim([0 length(F)/2]);
grid()
%% Part 4
audiowrite('test.wav',s,fs,'BitsPerSample',16); % saving the sound file
%%
[l, f] = import_sound('test.wav'); % loading the sound file
%%
figure(7) % plotting the sound file with the original
hold on
plot(t,s);
plot(t,l);
title('A signal before and after being saved and loaded');
hold off

% Oh boy, that sure is some cutoff

%%
f = 200;
fs = 500;
[t,s] = generate_sinusoid(1,f,0,fs,0.2);
y = conv(ones(5,1),s(:));

figure(8)
subplot(2,1,1)
plot(t,s)
%title('sinusoid with f = 10Hz');

subplot(2,1,2)
plot(0:length(y)-1,y)
title('convoluted sinusoid');


