% Assigment 3

%% filter=fiveInOne(0.1,0.2,0.3,0.4,0.5);
%I FIR filtre er implus respons = B værdier
filter=fiveInOne(20,15,10,5,0);
figure(221)
plot(filter)
fig = gcf;

figure(222)
zplane(filter,1)
fig = gcf;
axes = get(fig,'children');
set(axes,'FontSize',12);
%Not sure what to make of this

figure(223)
freqz(filter) %frequncy response
fig = gcf;
axes = get(fig,'children');
set(axes,'FontSize',12);
mag = get(axes(1),'children');
phase = get(axes(2),'children');
set(mag,'linewidth',1);
set(phase,'linewidth',1);
title('Normalized frequncy response, 99th order five band equalizer');


%%
fil = zero_pad(ones(1,200),filter)
figure(224)
freqz(fil) %ferquncy responce of the zero padded one - it's the same, duh
fig = gcf;
axes = get(fig,'children');
set(axes,'FontSize',12);
mag = get(axes(1),'children');
phase = get(axes(2),'children');
set(mag,'linewidth',1);
set(phase,'linewidth',1);
title('Normalized frequncy response, 99th order five band equalizer,zero padded');
%obv. it has no effect, why would it?

[s,f] = importSound('Sweep.wav');

ts=0:1/f:((length(s)/f)-1/f); 
%time_vector = 0:1/fs:T_s-1/fs;
figure(225)
con=conv(s,filter);
tc=0:1/f:((length(con)/f)-1/f); 
plot(tc,con)
hold on
plot(ts,s)
title('Sweep.wav')
legend({'filtered frequency sweep','Frequency sweep'});
xlabel('amplitude');
ylabel('time[s]');
set(findall(gcf,'-property','FontSize'),'FontSize',12);
hold off
%% Left: plotting and explaining the spectrum - here sweep

[Y, freq] = make_spectrum(con,f);

Y_db = 20*log10(abs(Y));
figure(226)
Y_mag = abs(Y);
plot(freq,Y_mag)

figure(227)
subplot(2,1,1)
plot(freq,Y_db)
%xlim([-25000,25000]);
title('Frequency responce of filtered frequency sweep')
ylabel('Magnitude[dB]');
xlabel('Frequency[Hz]')
grid();
subplot(2,1,2)
Yn = Y;
%Yn(abs(Y)<max(abs(Y))/10000)=0; % Reducing amount of noice
plot(freq,angle(Yn));
%xlim([-500,500]);
%ylim([-6*pi 2*pi]);
ylabel('Phase[rad]');
xlabel('Frequency[Hz]')
set(findall(gcf,'-property','FontSize'),'FontSize',12);
%yticks(-6*pi:pi:pi);
%yticklabels({'-6\pi','-5\pi','-4\pi','-3\pi','-2\pi','\pi','0','\pi','2\pi'});
grid();

%% specturm of white noise

x = rand(1,100000);  % 100 white noise samples,
                  %   uniform between 0 and 1.
xn = 2*(x-0.5);   % Make it uniform between -1 and +1

f=40000; %some random sampling frequency 
ts=0:1/f:((length(xn)/f)-1/f); 
%time_vector = 0:1/fs:T_s-1/fs;
figure(301)
con=conv(xn,filter);
tc=0:1/f:((length(con)/f)-1/f); 
plot(tc,con)
hold on
plot(ts,xn)
title('Randomly generated white noise with f_{s}=40000Hz')
legend({'filtered white noise','White noise'});
xlabel('amplitude');
ylabel('time[s]');
set(findall(gcf,'-property','FontSize'),'FontSize',12);
hold off

[Y, freq] = make_spectrum(con,f);
figure(302) %not in dB
Y_mag = abs(Y);
subplot(2,1,1)
plot(freq,Y_mag)
%xlim([-25000,25000]);
title('Frequency responce of filtered white noise')
ylabel('Magnitude');
xlabel('Frequency[Hz]')
grid();
subplot(2,1,2)
Yn = Y;
Yn(abs(Y)<max(abs(Y))/10000)=0; % Reducing amount of noice
plot(freq,angle(Yn));
%xlim([-500,500]);
%ylim([-6*pi 2*pi]);
ylabel('Phase[rad]');
xlabel('Frequency[Hz]')
set(findall(gcf,'-property','FontSize'),'FontSize',12);
%yticks(-6*pi:pi:pi);
%yticklabels({'-6\pi','-5\pi','-4\pi','-3\pi','-2\pi','\pi','0','\pi','2\pi'});
grid();

figure(303) %in dB
Y_db = 20*log10(abs(Y));
subplot(2,1,1)
plot(freq,Y_db)
%xlim([-25000,25000]);
title('Frequency responce of filtered white noise')
ylabel('Magnitude[dB]');
xlabel('Frequency[Hz]')
grid();
subplot(2,1,2)
Yn = Y;
Yn(abs(Y)<max(abs(Y))/10000)=0; % Reducing amount of noice
plot(freq,angle(Yn));
%xlim([-500,500]);
%ylim([-6*pi 2*pi]);
ylabel('Phase[rad]');
xlabel('Frequency[Hz]')
set(findall(gcf,'-property','FontSize'),'FontSize',12);
%yticks(-6*pi:pi:pi);
%yticklabels({'-6\pi','-5\pi','-4\pi','-3\pi','-2\pi','\pi','0','\pi','2\pi'});
grid();

[Y, freq] = make_spectrum(xn,f);
figure(304) %frequency responce od white noise
Y_db = 20*log10(abs(Y));
subplot(2,1,1)
plot(freq,Y_dB)
%xlim([-25000,25000]);
title('Frequency responce of filtered white noise')
ylabel('Magnitude');
xlabel('Frequency[Hz]')
grid();
subplot(2,1,2)
Yn = Y;
Yn(abs(Y)<max(abs(Y))/10000)=0; % Reducing amount of noice
plot(freq,angle(Yn));
%xlim([-500,500]);
%ylim([-6*pi 2*pi]);
ylabel('Phase[rad]');
xlabel('Frequency[Hz]')
set(findall(gcf,'-property','FontSize'),'FontSize',12);
%yticks(-6*pi:pi:pi);
%yticklabels({'-6\pi','-5\pi','-4\pi','-3\pi','-2\pi','\pi','0','\pi','2\pi'});
grid();


%% specturm of white noise - not normalized

xn = randn(1,100000);  % 100 white noise samples,
                  %   uniform between 0 and 1.
%xn = 2*(x-0.5);   % Make it uniform between -1 and +1

f=4000; %some random sampling frequency 
ts=0:1/f:((length(xn)/f)-1/f); 
%time_vector = 0:1/fs:T_s-1/fs;
figure(303)
con=conv(xn,filter);
tc=0:1/f:((length(con)/f)-1/f); 
plot(tc,con)
hold on
plot(ts,xn)
title('Randomly generated white noise with f_{s}=40000Hz')
legend({'White noise','filtered white noise'});
xlabel('amplitude');
ylabel('time[s]');
set(findall(gcf,'-property','FontSize'),'FontSize',12);
hold off

[Y, freq] = make_spectrum(con,f);
Y_db = 20*log10(abs(Y));
figure(304)
Y_mag = abs(Y);
subplot(2,1,1)
plot(freq,Y_mag)
%xlim([-25000,25000]);
title('Frequency responce of filtered white noise')
ylabel('Magnitude[dB]');
xlabel('Frequency[Hz]')
grid();
subplot(2,1,2)
Yn = Y;
Yn(abs(Y)<max(abs(Y))/10000)=0; % Reducing amount of noice
plot(freq,angle(Yn));
%xlim([-500,500]);
%ylim([-6*pi 2*pi]);
ylabel('Phase[rad]');
xlabel('Frequency[Hz]')
set(findall(gcf,'-property','FontSize'),'FontSize',12);
%yticks(-6*pi:pi:pi);
%yticklabels({'-6\pi','-5\pi','-4\pi','-3\pi','-2\pi','\pi','0','\pi','2\pi'});
grid();



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

% ASK ABOUT THIS!!!!
%%
H = exp(1i*omega)*(1+cos(2*omega));


