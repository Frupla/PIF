% Assigment 3
set(groot,'defaultLineLineWidth',2);
%% filter=fiveInOne(0.1,0.2,0.3,0.4,0.5);
%In FIR filters the implus respons = B values
filter=fiveInOne(20,15,10,5,0); %Inseting the five values
figure(221)
plot(filter) %ploting the IR
fig = gcf;

figure(222) %Taking a look at the poles and zeros - 99th order FIR filter as expected
zplane(filter,1)
fig = gcf;
axes = get(fig,'children');
set(axes,'FontSize',12);

figure(223)
freqz(filter) %frequncy response of the filter
fig = gcf;
axes = get(fig,'children');
set(axes,'FontSize',12);
mag = get(axes(1),'children');
phase = get(axes(2),'children');
%set(mag,'linewidth',1);
%set(phase,'linewidth',1);
title('Normalized frequency response, 99th order five band equalizer');


%% Zero padding
figure(224) %Rigth side zero padding the filter and plotting the phase changes
[phi0,w0]=phasez(filter);
plot(w0,phi0);
hold on
[phi1,w1]=phasez([zeros(1,200) filter]);
plot(w1,phi1);
[phi2,w2]=phasez([zeros(1,600) filter]);
plot(w2,phi2);
[phi3,w3]=phasez([zeros(1,800) filter]);
plot(w3,phi3);
xlim([0 pi]);
legend('0 zeros','200 zeros','600 zeros','800 zeros','Location','West')
hold off
ylabel('phase[degrees]')
xlabel('frequency[Hz]')
title('Normalized frequency phase response, differently zero padded');

figure(2245) %left side zero padding - no effect
freqz([filter zeros(1,200)])
fig = gcf;
axes = get(fig,'children');
set(axes,'FontSize',12);
mag = get(axes(1),'children');
phase = get(axes(2),'children');
set(mag,'linewidth',1);
set(phase,'linewidth',1);
title('Normalized frequency phase response, zero padded');
%obv. it has no effect, why would it?
hold off

%% Importing and filtering Sweep
[s,f] = importSound('Sweep.wav');

ts=0:1/f:((length(s)/f)-1/f); %time vector
con=conv(s,filter); %filtering with the signal
tc=0:1/f:((length(con)/f)-1/f); %time vector for the convoluted signal

figure(225) %filtered and unfiltered sweep
plot(tc,con)
hold on
plot(ts,s)
title('Sweep.wav')
legend({'filtered frequency sweep','Frequency sweep'});
xlabel('amplitude');
ylabel('time[s]');
set(findall(gcf,'-property','FontSize'),'FontSize',12);
hold off


[Ys, freqs] = make_spectrum(s,f); %spectrum of signal
Ys_db = 20*log10(abs(Ys));
[Y, freq] = make_spectrum(con,f); %spectrum of filtered signal
Y_db = 20*log10(abs(Y));

figure(227) %Plotting the frequency responses of the two filters on top of each other
subplot(2,1,1)
plot(freq,Y_db,'Color','red')
hold on
plot(freqs,Ys_db,'Color','blue')
%xlim([-25000,25000]);
title('Frequency responce of unfiltered and filtered frequency sweep')
ylabel('Magnitude[dB]');
xlabel('Frequency[Hz]')
legend('Unfiltered sweep','Filtered sweep')
grid();
subplot(2,1,2)
%Yn(abs(Y)<max(abs(Y))/10000)=0; % Reducing amount of noice
plot(freq,angle(Y),'Color','red');
hold on
plot(freqs,angle(Ys),'Color','blue');
%xlim([-500,500]);
%ylim([-6*pi 2*pi]);
ylabel('Phase[rad]');
xlabel('Frequency[Hz]');
legend('Unfiltered sweep','Filtered sweep')
set(findall(gcf,'-property','FontSize'),'FontSize',12);
%yticks(-6*pi:pi:pi);
%yticklabels({'-6\pi','-5\pi','-4\pi','-3\pi','-2\pi','\pi','0','\pi','2\pi'});
grid();
hold off

%% specturm of white noise

x = rand(1,100000);  % 100000 white noise samples,
                     %   uniform between 0 and 1.
xn = 2*(x-0.5);      % make it uniform between -1 and +1

f=40000; %some random sampling frequency 
ts=0:1/f:((length(xn)/f)-1/f); % time vector for the white noise
con=conv(xn,filter); %filtering the time vector
tc=0:1/f:((length(con)/f)-1/f); %time vector for the filtered white noise

figure(301) %Plot of filtered and unfiltered white noise
plot(tc,con)
hold on
plot(ts,xn)
title('Randomly generated white noise with f_{s}=40000Hz')
legend({'filtered white noise','White noise'});
xlabel('amplitude');
ylabel('time[s]');
set(findall(gcf,'-property','FontSize'),'FontSize',12);
hold off

[Yn, freqn] = make_spectrum(xn,f); %Spectrum of white noise
con=conv(xn,filter); %filtering of white noise
[Y, freq] = make_spectrum(con,f); %Spectrum of filtered white noise
Yn_dB = 20*log10(abs(Yn));
Y_dB = 20*log10(abs(Y));
figure(304) %frequency responce of white noise filtered and not
subplot(2,2,1)
plot(freqn,Yn_dB,'Color','blue')
hold on
plot(freq,Y_dB,'Color','red')
title({'Frequency response of unfiltered', 'and filtered white noise'})
ylabel('Magnitude');
xlabel('Frequency[Hz]')
legend('Unfiltered white noise','Filtered white noise','Location','South');
set(findall(gcf,'-property','FontSize'),'FontSize',12);
grid();
hold off
subplot(2,2,3)
%Yn = Y;
%Yn(abs(Y)<max(abs(Y))/10000)=0; % Reducing amount of noise
plot(freqn,angle(Yn),'Color','blue');
hold on
plot(freq,angle(Y),'Color','red');
%xlim([-500,500]);
%ylim([-6*pi 2*pi]);
ylabel('Phase[rad]');
xlabel('Frequency[Hz]')
legend('Unfiltered white noise','Filtered white noise');
set(findall(gcf,'-property','FontSize'),'FontSize',12);
%yticks(-6*pi:pi:pi);
%yticklabels({'-6\pi','-5\pi','-4\pi','-3\pi','-2\pi','\pi','0','\pi','2\pi'});
grid();
hold off
subplot(2,2,2)
plot(freq,Y_dB,'Color','red')
hold on
plot(freqn,Yn_dB,'Color','blue')
title({'Frequency response of unfiltered','and filtered white noise'})
ylabel('Magnitude');
xlabel('Frequency[Hz]')
legend('Filtered white noise','Unfiltered white noise','Location','South');
set(findall(gcf,'-property','FontSize'),'FontSize',12);
grid();
hold off
subplot(2,2,4)
%Yn = Y;
%Yn(abs(Y)<max(abs(Y))/10000)=0; % Reducing amount of noise
plot(freq,angle(Y),'Color','red');
hold on
plot(freqn,angle(Yn),'Color','blue');
%xlim([-500,500]);
%ylim([-6*pi 2*pi]);
ylabel('Phase[rad]');
xlabel('Frequency[Hz]')
legend('Filtered white noise','Unfiltered white noise');
set(findall(gcf,'-property','FontSize'),'FontSize',12);
%yticks(-6*pi:pi:pi);
%yticklabels({'-6\pi','-5\pi','-4\pi','-3\pi','-2\pi','\pi','0','\pi','2\pi'});
grid();
hold off

figure(305) %frequency responce of white noise filtered and not - withour phase
subplot(2,1,1)
plot(freqn,Yn_dB,'Color','blue')
hold on
plot(freq,Y_dB,'Color','red')
%xlim([-25000,25000]);
title('Frequency response of unfiltered and filtered white noise')
ylabel('Magnitude');
xlabel('Frequency[Hz]')
legend('Unfiltered white noise','Filtered white noise','Location','South');
%rect = [0.75, 0.75, .75, .75];
set(findall(gcf,'-property','FontSize'),'FontSize',12);
%set(h, 'Position', rect)
grid();
hold off
subplot(2,1,2)
plot(freq,Y_dB,'Color','red')
hold on
plot(freqn,Yn_dB,'Color','blue')
%xlim([-25000,25000]);
%title({'Frequency response of unfiltered','and filtered white noise'})
ylabel('Magnitude');
xlabel('Frequency[Hz]')
legend('Filtered white noise','Unfiltered white noise','Location','South');
set(findall(gcf,'-property','FontSize'),'FontSize',12);
grid();
hold off

%% Ex 2
H = [1 1 1]*(1/3);
figure(201)
freqz(H,1);

% y(n) = (x(n) + x(n-1) + x(n-2))* (1/3)  = {1/3 1/3 1/3}
% Y(z) = (1/3)*X(z)*z^{0} + (1/3)*X(z)*z^{-1} + (1/3)*X(z)*z^{-2}
% => Y/X = (1/3)*(1 + 1/z +1/z^2)=(1/3)*((z^2+z+1)/(z^2))
% in matlab terms:
B=[1 1 1];
A=[3 0 0];

figure(202)
freqz(B,A)

figure(203)
zplane(B,A)

roots(B)
roots(A)


r1= -0.5000 + 0.8660i;
r2= -0.5000 - 0.8660i;
rho1=abs(r1);
theta1=angle(r1);
rho2=abs(r2);
theta2=angle(r2);
x1=rho1*exp(j*theta1); %exp(j*2.09 rad)
x2=rho2*exp(j*theta2); %exp(-j*2.09 rad)
%The unit cirle, in the z-plane, maps on to the frequency responce.
%With a normalized response, the top half of the unit cirle maps
%on to along the normalized axis.
%Since there are pi radians on half a circle, and the gain dips
% at poles, the frequency responce dips at 2.0944/pi = 0.6665 rad/sample

%the phase is linear (since the filter is symmtric), and wraps around at
% also 0.6665 rad/sample.

% the suppressed frequency will be:
% f_{sup} = 0.6655 * f_{N} = 0.665* f_{s}/2
% or f_{sup} = 2.0944 * f_{N} * 1/pi 
% 
%if T = 1s, fs = 1Hz and f_N = 0.5HZ
f_sup = 0.6665*0.5; %0.333333 Hz

%H = exp(1i*omega)*(1+cos(2*omega));


<<<<<<< HEAD
function [filter] = fiveInOne (gain1,gain2,gain3,gain4,gain5)
%Input: 5 different gains in dB
%Output: the IR of a l-1 =99 order filter, split into 5 equal bands
%        each attenuated with the one of the 5 gains 
%Example of use:
%filter=fiveInOne(20,15,10,5,0);
l = 100; %corresponding to order+1
H = horzcat(ones(1,(l/10))*db2mag(gain1),ones(1,(l/10))*db2mag(gain2),ones(1,(l/10))*db2mag(gain3),ones(1,(l/10))*db2mag(gain4),ones(1,(l/10))*db2mag(gain5));
H = horzcat(H,fliplr(H));
%figure(); %uncomment these five lines to see a plot of the samples
%stem(H,'linewidth',1);
%title('FIR filter in frequncy domain');
%ylabel('Amplitude');
%xlabel('Sample number');
h = ifft((H),'symmetric');
h = fftshift(h); %gives the impulse response
filter = h; 
end
=======
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

>>>>>>> e331e1c40ea4a51187f449699ddc7389cef96525
