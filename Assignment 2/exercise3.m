%% 3.1

%% FIR

alpha = 0.6;
t = 200*10^(-3);
fs = 1/(5*10^(-3));
delay_samples = t*fs;

FIR = [1; zeros(delay_samples,1);alpha];

% IIR
A = [1; zeros(delay_samples,1);alpha];
B = 1;

[s,f] = import_sound('Sax12.wav');

s1 = filter(A,B,s);
s2 = filter(B,A,s);

%%
sound(s,f);
%%
sound(s1,f)
pause(1/f*(length(s2)+length(s1)));
sound(s2,f)
%%
t1 = 0:1/f:length(s1)/f-1/f;
t2 = 0:1/f:length(s2)/f-1/f;
figure(1)
subplot(2,1,1);
plot(t1,s1);
title('FIR');
xlim([0 length(s1)/f])
xlabel('time [s]');
ylabel('magnitude');

subplot(2,1,2);
plot(t2,s2);
xlim([0 length(s1)/f])
title('IIR');
xlabel('time [s]');
ylabel('magnitude');

%%

figure(1)
freqz(poly(A),poly(B));

figure(2)
freqz(poly(B),poly(A));
