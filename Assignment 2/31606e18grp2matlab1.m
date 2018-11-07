%% Ex1
% group 2 
% Assigment 2

%% Ex 1 - filter design.
% We follow the steps from class:
% 1.  Pre-warp you frequencie - note bilinear does it automatically
% 2.  Design your filter in the s-domain
% 3.  Map your s-plane into something than can be handled better -(infinty) 
%     is a problem (using the bilinear transform) (Note, I think there's a 
%     maple command for this).
% 4.  Chose the suitable sampling period T

% 1. This should be a butterwirth filter

O_sampling = 2*35; % the suitable sampling frequency is 2x the nyquist frequency of Omega_max=35 rad/s
Gp = 2;  % passband maximum attenuation
Gs = 11; % Stopband minimum attenuation
Op = 10; % omega max passband frequency [rad/sec]
Os = 15; % omega min stopband frequency [rad/sec]

wp = Op/O_sampling;%normalize 
ws = Os/O_sampling;%normalize
    
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


% Plot without normalization
[z,p,k] = butter(n,Wn);
sos = zp2sos(z,p,k);

figure(3)
freqz(sos,510,2*35)
title(sprintf('n = %d Butterworth Lowpass Filter',n))
xlabel(subplot(2,1,1),'Omega')
xlabel(subplot(2,1,2),'Omega')

% 1.2

tf(B,A)*tf(A,B); %The transfer function filter with no phase shift
B1 = [0.00226 0.002964 -0.00428 -0.004723 0.004688 0.003193 -0.002608 -0.0007802 0.000595]; 
%B1 is the vector corresponding to both the top and bottom of the tranfer
%function

figure(10) % The freqz plot of the transfer function - as expected of an 
%all pass filter it's two straight lines
freqz(B1,B1)
title('H(z)*H(z)^{-1}')
fig = gcf;
axes = get(fig,'children');
set(axes,'FontSize',12);
mag = get(axes(1),'children');
phase = get(axes(2),'children');
set(mag,'linewidth',1);
set(phase,'linewidth',1);
ylim(axes,[-1 1])

figure(11)
zplane(B1,B1)
title('Zeros and Poles of H_{noPhaseShift}(z)');
fig = gcf;
axes = get(fig,'children');
set(axes,'FontSize',20);

figure(12)
bode(tf(B,A)*tf(B,A)) 
%The transfer function resulting from tf(B,A)*tf(B,A) has the following B
%and A vectors:
B2=[5.106e-06 4.085e-05 0.000143 0.000286 0.0003574 0.000286 0.000143 4.085e-05  5.106e-06 ]
A2=[1 -5.377 12.95 -18.17 16.23 -9.415 3.462 -0.7365 0.06933]

figure(14) %The freqz plot of the above function
freqz(B2,A2)
title('H(z)*H(z)')
fig = gcf;
axes = get(fig,'children');
set(axes,'FontSize',15);
mag = get(axes(1),'children');
phase = get(axes(2),'children');
set(mag,'linewidth',1.5);
set(phase,'linewidth',1.5);