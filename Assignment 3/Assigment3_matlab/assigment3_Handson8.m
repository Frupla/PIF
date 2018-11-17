h1 = [1,1,1,1,1];
h2 = [-1,-1,0,1,1];
h3 = [-1,1,1,1,1];
h4 = [-1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];

figure(1)
subplot(2,2,1)
zplane(h1)
subplot(2,2,2)
zplane(h2)
subplot(2,2,3)
zplane(h3)
subplot(2,2,4)
zplane(h4)

%%
figure(2)
freqz(h1,1)
figure(3)
freqz(h2,1)
figure(4)
freqz(h3,1)
figure(5)
freqz(h4,1)

%% Exercise 1

Wp = [0.2 0.3];
Ws = [0.1 0.4];
Rp = 2;
Rs = 100;

[n, Wn] = buttord(Wp,Ws,Rp,Rs);
[B,A] = butter(n,Wn);

figure(1)
freqz(B,A);
title("Frequency response of the filter");
figure(2)
zplane(B,A);
title("The poles and zeros of the filter");
figure(3)
impz(B,A);
title("Impulse response of the filter");

%%
[h, t] = impz(B,A);
hmax = max(h);

samples_over = find(abs(h)>hmax*0.10);

h100 = h(1:(samples_over(end)));
t100 = t(1:(samples_over(end)));

h75 = h(1:floor(0.75*(samples_over(end))));
t75 = t(1:floor(0.75*(samples_over(end))));

h60 = h(1:floor(0.60*(samples_over(end))));
t60 = t(1:floor(0.60*(samples_over(end))));

h40 = h(1:floor(0.40*(samples_over(end))));
t40 = t(1:floor(0.40*(samples_over(end))));

h10 = h(1:floor(0.10*(samples_over(end))));
t10 = t(1:floor(0.10*(samples_over(end))));

figure(1)
title("Frequency response of the effective value of the filter");
freqz(h100,t100)

figure(2)
title("Frequency response of 75% of the effective value of the filter");
freqz(h75,t75)

figure(3)
title("Frequency response of 60% of the effective value of the filter");
freqz(h60,t60)

figure(4)
title("Frequency response of 40% of the effective value of the filter");
freqz(h40,t40)

figure(5)
title("Frequency response of 10% ofthe effective value of the filter");
freqz(h10,t10)

%% 3.1.2

set(groot,'defaultAxesFontSize',10);

Fs = 30000;
Ts = 1/Fs;
n = 601;

T0 = Ts/n;
F0 = Fs/n;

H = [ones(100,1);zeros(401,1);ones(100,1)];
f = -length(H)*F0/2:F0:((length(H)-1)*F0/2);


h = fftshift(ifft(H,'symmetric'));
t = 0:T0*(10^6):(length(h)*T0*(10^6)-T0*(10^6));


figure(1)
plot(t,h);
title('Impulse response');
grid();
xlabel('Time [µs]')
ylabel('Magnitude [ ]')


%%
set(groot,'defaultLineLineWidth',2);

fir = dsp.FIRFilter(h');

freqz(fir)

%%
window50 = [zeros(150,1);ones(301,1);zeros(150,1)];
window25 = [zeros(225,1);ones(151,1);zeros(225,1)];
window10 = [zeros(270,1);ones(61,1);zeros(270,1)];


figure(1)
plot(window5)

%% Here I make the impulse response gradually shorter

h50 = window50.*h;

h25 = window25.*h; 

h10 = window10.*h;


H50 = fft(h50);
H25 = fft(h25);
H10 = fft(h10);

figure(1)
hold on
plot(f,fftshift(abs(fft(h))))
plot(f,fftshift(abs(fft(h50))))
plot(f,fftshift(abs(fft(h25))))
plot(f,fftshift(abs(fft(h10))))
xlim([0 15000])
legend('full','half','quarter','tenth');
hold off
xlabel('Frequency [Hz]');
%%
figure(2)
hold on
plot(t,h)
plot(t,h50')
plot(t,h25')
plot(t,h10')
xlim([0 t(end)])
ylim([-0.01 0.01])
xlabel('Time [µs]');
title('The various impulse responses');
hold off
legend('Full','Half','Quarter','Tenth');
