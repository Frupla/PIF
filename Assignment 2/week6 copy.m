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

fs = 2*35/(2*pi); % 4 the siutable sampling freq.
Gp = 2;
Gs = 11;
wp = 10/(2*pi*fs);%normalize 
ws = 15/(2*pi*fs);%normalize

[n,Wn]=buttord(wp,ws,Gp,Gs); %pre-warping and biletaral transform is included in the funciton, look at defintion to find out.

[B,A] = butter(n,Wn);

%plot mag and phase
figure(1)   
freqz(B,A)
%make z-plane 
figure(2)
zplane(B,A)

%% Plot without normalization
[z,p,k] = butter(n,Wn);
sos = zp2sos(z,p,k);

figure(3)
freqz(sos,510,2*35)
title(sprintf('n = %d Butterworth Lowpass Filter',n))
xlabel(subplot(2,1,1),'Omega')
xlabel(subplot(2,1,2),'Omega')

%% 1.2
figure(10)
bode(tf(B,A)*tf(A,B))
figure(11)
zplane(A,B)

figure(12)
bode(tf(B,A)*tf(B,A)*tf(B,A))