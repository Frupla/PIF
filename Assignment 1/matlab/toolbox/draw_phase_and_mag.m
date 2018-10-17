function [figure_handle] = draw_phase_and_mag(n,signal,fs)


figure_handle = n;
%make the figure
figure(n);
%set size
set(n,'paperunits','centimeters','Paperposition',[0 0 10 4]);
%set fontsize
set(gca,'Fontsize',10);


%The actual plot
subplot(2,1,1)
[Y, F] = make_spectrum(signal, fs);
h1=plot(F,abs(Y));
xlim([-length(Y)/100,length(Y)/100]);
title('Magnitude');
set(h1,'linewidth',1);
xlabel('frequency [Hz]');
ylabel('amplitude');
grid();

subplot(2,1,2)
Yn = Y;
Yn(abs(Y)<max(abs(Y))/10000)=0; % Reducing amount of noice
h2=plot(F,angle(Yn));
xlim([-length(Y)/100,length(Y)/100]);
title('phase');
set(h2,'linewidth',1);
xlabel('frequency [Hz]');
ylabel('phase angle [\pi]');
grid();



