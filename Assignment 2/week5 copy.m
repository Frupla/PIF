%% Lecture stuff
% define poles and zeros:
poles = [0; 0];
zeros = [1/2+sqrt(3)*i/2; 1/2+sqrt(3)*i/2]
% plot the z-plane
figure(1)
zplane(zeros, poles)

%polynomials:
B = poly(zeros);
A = poly(poles);
% plot the frequency response:
figure(2)
freqz(B, A)

%% Hands-on ex 1
%Running sum
%In the general case the expresisson is: (z^2 + z + 1) / z^2 for 3rd order

zeros3 = roots([1 1 1]*(1/3));
poles3 = roots([1 0 0]);
zeros5 = roots([1 1 1 1 1]*(1/5));
poles5 = roots([1 0 0 0 0]);
figure(3)
zplane(zeros3,poles3)
title('3rd order running sum filter')
figure(4)
freqz(poly(zeros3),poly(poles3))
title('3rd order running sum filter')
figure(5)
zplane(zeros5,poles5)
title('3rd order running sum filter')
figure(6)
freqz(poly(zeros5),poly(poles5))
title('3rd order running sum filter')

%%
%Running average
%In the general case the expresisson is: (z^2 + z + 1) / z^2 for 3rd order

zeros3 = roots([1 1 1]);
poles3 = roots([1 0 0]*3);
zeros5 = roots([1 1 1 1 1]);
poles5 = roots([1 0 0 0 0]*5);
figure(7)
zplane(zeros3,poles3)
title('3rd order running sum filter')
figure(8)
freqz(poly(zeros3),poly(poles3))
title('3rd order running sum filter')
hold on 
freqz(poly(poles3),poly(zeros3))
hold off
figure(9)
zplane(zeros5,poles5)
title('3rd order running sum filter')
figure(10)
freqz(poly(zeros5),poly(poles5))
title('3rd order running sum filter')

%% Design a filter that blocks the normalized frequency of 0.1 by placing 4
%zeros in the z-plane. Make sure the filter returns real-values outputs when 
%fed with real-valued inputs by placing complex-conjugate pairs of poles and zeros.

zeros = [cos(0.1*pi) + j*sin(0.1*pi); cos(0.1*pi) - j*sin(0.1*pi)];
poles = [];
figure(10)
zplane(zeros, poles)
figure(11)
freqz(poly(zeros),poly(poles))

%% Add to the previous filter 4 poles lying on a circle with a radius R < 1
%(you chose R) at angles identical to the angles of the zeros. 
%How does the frequency response change when you increase R and when R
%approaches 1?

zeros = [cos(0.1*pi) + j*sin(0.1*pi); cos(0.1*pi) - j*sin(0.1*pi)];
poles = 0.999*zeros;
figure(10)
zplane(zeros, poles)
figure(11)
freqz(poly(zeros),poly(poles))

%% Ex. 1.2
%Lowpass
fp = 0.3;
mp = 0.2;
fz = 0.7;
mz = 0.3;
zeros_l = mz*[cos(fz*pi) + j*sin(fz*pi); cos(fz*pi) - j*sin(fz*pi)];
poles_l = mp*[cos(fp*pi) + j*sin(fp*pi); cos(fp*pi) - j*sin(fp*pi)];
figure(10)
zplane(zeros_l, poles_l)
figure(11)
freqz(poly(zeros_l),poly(poles_l))

%% highpass
fp = 0.1;
mp = 0.2;
fz = 0.7;
mz = 0.3;
zeros_h = mz*[cos(fz*pi) + j*sin(fz*pi); cos(fz*pi) - j*sin(fz*pi)];
poles_h = mp*[cos(fp*pi) + j*sin(fp*pi); cos(fp*pi) - j*sin(fp*pi)];
figure(12)
zplane(zeros_h, poles_h)
figure(13)
freqz(poly(zeros_h),poly(poles_h))

%% All pass
fz = 0.2;
stuff = [exp(fz*pi*j); exp(-fz*pi*j); exp(2*fz*pi*j); exp(-2*j*fz*pi); 0];
zeros_a = 1.1*stuff;
poles_a = 0.9*stuff;
figure(14)
zplane(zeros_a, poles_a)
figure(15)
freqz(poly(zeros_a),poly(poles_a))

%% 

[s,t] = generate_sinosoid


%% Ex 3

%% 3.1
%Create the filters
% define a sampling freq and make delay_samples dependant on fs
fs = 10;
delay_samples = 3; % this should be func of fs
alpha = 0.6;
a1 = 1;
b1 = [1;zeros(delay_samples,1);alpha]; 
a2 = [1;zeros(delay_samples,1);alpha];
b2 = 1;

%impulse responce of the first function
h1 = b1; 
%Transfer function of first function:
zeros1 = roots(b1);
poles1 = roots(a1);
H1 = zeros1/1
figure(1)
zplane(zeros1,poles1)
figure(2)
freqz(poly(zeros1),poly(poles1))
% ok, this isn't quite right.... return to it later.
 
