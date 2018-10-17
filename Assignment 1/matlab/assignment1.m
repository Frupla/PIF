%%Please note that to use the toolbox, you must run each segment individually
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
%%
figure(3)
subplot(2,1,1)
% hold on
% plot(F1,real(y1));
plot(F2,real(y2));
% hold off
xlim([-length(y1), length(y1)]);
title('Real part');
subplot(2,1,2)
% hold on
% plot(F1,imag(y1));
plot(F2,imag(y2));
% hold off
xlim([-length(y1), length(y1)]);
title('Imaginary part');
legend('500hz','499hz');
%%
draw_re_im(10,F2,y2);

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

draw_phase_and_mag(7,s,fs)
%%
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
% Make sure to be in the subfolder sounds when you run this
%%
[l, f] = import_sound('test.wav'); % loading the sound file
% You will have to change the path in import_sound to use this function
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

%% Hand in 2, 1.3
fs = 10000;
N = 21;
t = 0:1/fs:0.1-1/fs;
%An order 21 moving average filter:
%h = 1/N.*ones(1,N);
train = zero_pad(t,ones(1,N)/N);
%3 sinosoids
[t1,s1] = generate_sinusoid(1,500,0,fs,1);
[t2,s2] = generate_sinusoid(1,2200,0,fs,1);
[t3,s3] = generate_sinusoid(1,4050,0,fs,1);

%All four signals, plotted together
figure(4)
subplot(2,2,1)
hold on
plot(t,train,'Color','g','LineWidth',1);
plot(t1,s1,'Color','m','LineWidth',1);
plot(t2,s2,'Color','r','LineWidth',1);
plot(t3,s3,'Color','b','LineWidth',1);
xlim([0,0.005]);
title('Impulse response of an order 21 moving average plottet with 3 sinosoids') 
legend('h_{21}(t)','f_1(t)','f_2(t)','f_3(t)')
hold off

%f1 convolved with the train
subplot(2,2,2)
s1c = conv(train,s1); 
plot(t,train,'Color','g','LineWidth',1);
hold on
plot(t1,s1,'Color','m','LineWidth',1);
plot(t1,s1c(1:length(t1)),'LineWidth',1);
xlim([0,0.005]);
title('f_1 convolved with impulse response')
legend('h_{21}(t)','f_1(t)','h_{21}(t) * f_1(t)');
hold off

%f2 convolved with the train
subplot(2,2,3)
s2c = conv(train,s2);
plot(t,train,'Color','g','LineWidth',1);
hold on
plot(t2,s2,'Color','r','LineWidth',1);
plot(t2,s2c(1:length(t2)),'LineWidth',1);
title('f_2 convolved with impulse response')
legend('h_{21}(t)','f_2(t)','h_{21}(t) * f_2(t)');
xlim([0,0.005]);
hold off

%f3 convolved with the train
subplot(2,2,4)
s3c = conv(train,s3);
plot(t,train,'Color','g','LineWidth',1);
hold on
plot(t3,s3,'Color','b','LineWidth',1);
plot(t3,s3c(1:length(t3)),'LineWidth',1);
title('f_1 convolved with impulse response')
legend('h_{21}(t)','f_3(t)','h_{21}(t) * f_3(t)');
xlim([0,0.005]);
hold off

%Matlab's filter function is  implemented for and order 21 moving average
%filter
A = 1;
B = 1/21*[ones(21,1)];
sf1 = filter(B,A,s1);
sf2 = filter(B,A,s2);
sf3 = filter(B,A,s3);

figure(8)
s1c = conv(train,s1);
%plot(t,train,'Color','g','LineWidth',2);
%plot(t1,s1,'Color','m','LineWidth',6);
plot(t1(1:100),s1(1:100),'Color','b','LineWidth',2);
hold on
xlim([0,0.01]);
%title('f_1 convolved with impulse response')
plot(t1,s1c(1:length(t1)),'Color','m','LineWidth',6);
hold on
plot(t1(1:100),sf1(1:100),'Color','k','LineWidth',2)
%plot(t1,s1c(1:length(t1)),'Color','m','LineWidth',6);
legend('f_1(t)','f_1(t) * h_21(t)','filter(1/21*[ones(21,1)],1,f_1)');
hold off

figure(9)
s2c = conv(train,s2);
%plot(t,train,'Color','g','LineWidth',2);
%plot(t1,s1,'Color','m','LineWidth',6);
plot(t2(1:100),s2(1:100),'Color','b','LineWidth',2);
hold on
xlim([0,0.01]);
%title('f_1 convolved with impulse response')
plot(t2,s2c(1:length(t1)),'Color','m','LineWidth',6);
plot(t2(1:100),sf2(1:100),'Color','k','LineWidth',2)
%plot(t1,s1c(1:length(t1)),'Color','m','LineWidth',6);
legend('f_2(t)','f_2(t) * h_21(t)','filter(1/21*[ones(21,1)],1,f_2)');
hold off

figure(10)
s3c = conv(train,s3);
%plot(t,train,'Color','g','LineWidth',2);
%plot(t1,s1,'Color','m','LineWidth',6);
plot(t3(1:100),s3(1:100),'Color','b','LineWidth',2);
hold on
xlim([0,0.01]);
title('Comparison between the homemade filter and the matlab filter function')
plot(t3,s3c(1:length(t3)),'Color','m','LineWidth',6);
plot(t3(1:100),sf3(1:100),'Color','k','LineWidth',2)
%plot(t1,s1c(1:length(t1)),'Color','m','LineWidth',6);
legend('f_3(t)','f_3(t) * h_21(t)','filter(1/21*[ones(21,1)],1,f_3)');
xlabel('time [s]') 
ylabel('amplitude')
hold off

%% In the following part another sinosoid is generated:
f = 200;
fs = 500;
[t,s] = generate_sinusoid(1,f,0,fs,0.2); 
y = conv(ones(5,1),s(:)); %An order 5 running sum filter is generated and convolved with the sinosoid


figure(8)
subplot(2,1,1)
plot(t,s) % the sinoid is plotted alone
%title('sinusoid with f = 10Hz');

subplot(2,1,2)
plot(0:length(y)-1,y)
title('convoluted sinusoid');


%% 
