function plotting_IR_filters(n,signal,fs,type,delay)


figure(n);


%The actual plot
subplot(2,1,1)
[Y, F] = make_spectrum(signal, fs);
h1=plot(F,abs(Y));
xlim([-length(Y)/2,length(Y)/2]);
title(strcat('Magnitude ',type));
set(h1,'linewidth',1);
xlabel(strcat('frequency [Hz], delay = ',delay));
ylabel('amplitude');
grid();

subplot(2,1,2)
Yn = Y;
Yn(abs(Y)<max(abs(Y))/10000)=0; % Reducing amount of noice
h2=plot(F,angle(Yn));
xlim([-length(Y)/2,length(Y)/2]);
title('phase');
set(h2,'linewidth',1);
xlabel('frequency [Hz]');
ylabel('phase angle [\pi]');
grid();



