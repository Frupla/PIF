%% Week 6

%% Ex 1 - filter design.
% We follow the steps from class:
% 1.  Pre-warp you frequencie - note bilinear does it automatically
% 2.  Design your filter in the s-domain
% 3.  Map your s-plane into something than can be handled better -(infinty) 
%     is a problem (using the bilinear transform) (Note, I think there's a 
%     maple command for this).
% 4.  Chose the suitable sampling period T

% 1. This should be a butterwirth filter

fs = 2*35; % the suitable sampling frequency is 2x the nyquist frequence
Gp = 2;
Gs = 11;
wp = 10/fs;%normalize 
ws = 15/fs;%normalize

[n,Wn]=buttord(wp,ws,Gp,Gs); %pre-warping and biletaral transform is 
                             %included in the funciton
[B,A] = butter(n,Wn);

%plot mag and phase
figure(1)   
freqz(B,A)
title('4th Order Lowpass Butterwoth Filter');
fig = gcf;
axes = get(fig,'children');
set(axes,'FontSize',12);
mag = get(axes(1),'children');
phase = get(axes(2),'children');
set(mag,'linewidth',1);
set(phase,'linewidth',1);

%make z-plane 
figure(2)
zplane(B,A)
fig = gcf;
axes = get(fig,'children');
set(axes,'FontSize',12);


%% Plot without normalization
[z,p,k] = butter(n,Wn);
sos = zp2sos(z,p,k);

figure(3)
freqz(sos,510,2*35)
title(sprintf('n = %d Butterworth Lowpass Filter',n))
xlabel(subplot(2,1,1),'Omega')
xlabel(subplot(2,1,2),'Omega')

%% 1.2

tf(B,A)*tf(A,B)
B1 = [0.00226 0.002964 -0.00428 -0.004723 0.004688 0.003193 -0.002608 -0.0007802 0.000595];

figure(10)
freqz(B1,B1)

figure(11)
zplane(B1,B1)

figure(12)
bode(tf(B,A)*tf(B,A))
%% 
figure(13)
bode(tf(B,A)*tf(B,A)^(-1))

figure(14)
bode(tf(B,A))
figure(15)
bode(tf(B,A)*tf(B,A))