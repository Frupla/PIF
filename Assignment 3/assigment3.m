% Assigment 3

%Ex 2
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
% omega_{sup} = 0.6655 * \omega_{N} = 0.665* omega_{s}/2
% f_sup = omega_{sup}*2*pi
% 
%if T = 1s, fs = 1Hz and
f_sup = 0.6665*2*pi*1; %4.1877 Hz

% ASK ABOUT THIS!!!!

