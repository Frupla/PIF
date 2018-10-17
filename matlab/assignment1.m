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
fs = 10000; 
T_s = 4;
k = 0;
% cos(2*pi * 2^k * f0 * t + k * pi/3):
s = 0;
for k = 0:N
    [t, s0] = generate_sinusoid(1, f0*2^k, k*phi+pi/2, fs, T_s); % - pi/2 to make it cos
    s = s0 + s;
end

t = ones(1,length(t))*0.8 + t; % time vector is changed into [0.8, 0.9]

figure(3)
plot(t,s); % Plotting the sinsusoid
% Using mad matlab skillz to make a title with a sum sign in it:
xlim([0.8, 0.9]);
str = '$$ s(n)=\sum^{4}_{k=0} cos\left(2\pi\cdot2^{k}f_{0}\cdot t + k \cdot \frac{\pi}{3}\right) $$';
title(str,'Interpreter','latex') 


% part 2

[Y, F] = make_spectrum(s, fs); % Making a spectrum for the signal from before

figure(4) % Magnitude and phase
subplot(2,1,1)
plot(F,abs(Y));
xlim([-500,500]);
title('Magnitude');
grid();


subplot(2,1,2)
Yn = Y;
Yn(abs(Y)<max(abs(Y))/10000)=0; % Reducing amount of noice
plot(F,angle(Yn));
xlim([-500,500]);
%ylim([-6*pi 2*pi]);
title('Phase');
%yticks(-6*pi:pi:pi);
%yticklabels({'-6\pi','-5\pi','-4\pi','-3\pi','-2\pi','\pi','0','\pi','2\pi'});
grid();

figure(5) % Real and imaginary part
subplot(2,1,1)
plot(F,real(Y));
xlim([-500, 500]);
title('Real part');
grid();

subplot(2,1,2)
plot(F,imag(Y));
xlim([-500, 500]);
title('Imaginary part');
grid();

%% part 3
figure(6)
%subfigur(2,1,1);
semilogx(F,20*log10(abs(Y))); % plotting the x axis logarithmically
title('First peak');
xlim([0 500]);
grid()
%% Part 4
audiowrite('test.wav',s,fs,'BitsPerSample',16); % saving the sound file
% save the file, you should be in the subfolder sounds
%%
[l, f] = import_sound('test.wav'); % loading the sound file
% You will have to change the path of import_sound for this to work
%%
figure(7) % plotting the sound file with the original
subplot(2,1,1);
plot(t(1:1000),s(1:1000));
xlim([0.8,0.925]);
grid();
title('A signal before being saved and loaded, from 0.8s to 0.9s');

subplot(2,1,2);
plot(t(501:1250),l(501:1250));
ylim([-5,5]);
xlim([0.8,0.925]);
grid();
title('A signal after being saved and loaded, from 0.85s to 0.925s');

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


