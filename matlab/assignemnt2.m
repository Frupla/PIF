%% Pelles rod ;)

omegac = 12.5; %Cutoff freq
omegas = 35;
nq = omegas/2; % nyquist freq

[b,a] = butter(2,omegac/nq);
freqz(b,a)
%%

Wp = 10/nq;  %Passband
Ws = 15/nq;  %Stopband

[n,Wn] = buttord(Wp,Ws,2,20);







[B,A] = butter(n,Wn);

%plot mag anf phase
figure(1)   
freqz(B,A)
%make z-plane 
figure(2)
zplane(B,A)

%% Plot without normalization
[z,p,k] = butter(n,Wn);
sos = zp2sos(z,p,k);

freqz(sos,512,35)
title(sprintf('n = %d Butterworth Lowpass Filter',n))
xlabel(subplot(2,1,1),'Omega')
xlabel(subplot(2,1,2),'Omega')


%%

foo(1,1)
foo(1)

