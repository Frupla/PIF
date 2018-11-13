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

%% 1.2
Fs = 30000;
Ts = 1/Fs;

H = [ones(100,1);zeros(401,1);ones(100,1)];
f = -(length(H)*Fs*10^(-7))/2:Fs*10^(-7):(length(H)*Fs*10^(-7)-Fs*10^(-7))/2;



h = fftshift(ifft(H,'symmetric'));
t = 0:Ts:(length(h)*Ts-Ts);


figure(1)
plot(t,h);
title('Impulse response');

figure(2)
plot(f,fftshift(H))
title('Frequency response');


%% Here I make the impulse response gradually shorter

h50 = zero_pad_alt(h(1:floor(0.50*length(h))),h);

h25 = zero_pad_alt(h(1:floor(0.25*length(h))),h);

h10 = zero_pad_alt(h(1:floor(0.10*length(h))),h);

figure(1)
subplot(2,1,1);
hold on
plot(f,fftshift(abs(fft(h))))
plot(f,fftshift(abs(fft(h50))))
plot(f,fftshift(abs(fft(h25))))
plot(f,fftshift(abs(fft(h10))))
xlim([0 f(end)])
legend('full','half','quarter','tenth');
hold off

subplot(2,1,2); % I'm not sure what to do about the phase here :/
hold on
plot(f,fftshift(angle(fft(h))))
plot(f50,fftshift(angle(fft(h50))))
plot(f25,fftshift(angle(fft(h25))))
plot(f10,fftshift(angle(fft(h10))))
xlim([0 f(end)])
hold off
%%
figure(2) % The lines need to be more thicc
subplot(4,1,1)
plot(t,h)
subplot(4,1,2)
plot(t(1:300),h50(1:300))
subplot(4,1,3)
plot(t(1:150),h25(1:150))
subplot(4,1,4)
plot(t(1:60),h10(1:60))


