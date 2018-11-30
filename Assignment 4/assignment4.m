% Assignment 4
%% Ex 1

plotTwoSoundFilesAndCorrelation('in_length_100.wav','out_length_100.wav',100,101);
plotTwoSoundFilesAndCorrelation('in_length_1000.wav','out_length_1000.wav',1000,1001);
plotTwoSoundFilesAndCorrelation('in_length_10000.wav','out_length_10000.wav',10000,10001);
plotTwoSoundFilesAndCorrelation('in_length_100000.wav','out_length_100000.wav',1000000,1000001);
plotTwoSoundFilesAndCorrelation('in_length_500000.wav','out_length_500000.wav',5000000,5000001);

%% Ex 1.2

[H1, F1] = plotInOut('100',1);
[H2, F2] = plotInOut('1000',2);
[H3, F3] = plotInOut('10000',3);
[H4, F4] = plotInOut('100000',4);
[H5, F5] = plotInOut('500000',5);

close 6
figure(6)
hold on
plot(F5,mag2db(abs(H5)))
plot(F4,mag2db(abs(H4)))
plot(F3,mag2db(abs(H3)))
plot(F2,mag2db(abs(H2)))
plot(F1,mag2db(abs(H1)))
hold off

%% Ex 2
[s,f] = audioread('animal_call.wav');
% figure(200)
% plot(s);

[Y, freq] = make_spectrum(s,f); %spectrum
Y_db = 20*log10(abs(Y));

% figure(201) %Plotting the frequency responses of the two filters on top of each other
% subplot(2,1,1)
% plot(freq,Y_db,'Color','red')
% %xlim([-25000,25000]);
% title('Frequency responce')
% ylabel('Magnitude[dB]');
% xlabel('Frequency[Hz]')
% %legend('Unfiltered sweep','Filtered sweep')
% grid();
% subplot(2,1,2)
% %Yn(abs(Y)<max(abs(Y))/10000)=0; % Reducing amount of noice
% plot(freq,angle(Y),'Color','red');
% %xlim([-500,500]);
% %ylim([-6*pi 2*pi]);
% ylabel('Phase[rad]');
% xlabel('Frequency[Hz]');
% %legend('Unfiltered sweep','Filtered sweep')
% set(findall(gcf,'-property','FontSize'),'FontSize',12);
% %yticks(-6*pi:pi:pi);
% %yticklabels({'-6\pi','-5\pi','-4\pi','-3\pi','-2\pi','\pi','0','\pi','2\pi'});
% grid();
% hold off
% 
my_spectrogram('animal_call.wav',1,99,0,203);
%%
figure(5)

[A, fs] = spectre('animal_call.wav', 'hann', 99,1,100);
imagesc(abs(A(:,1:round(99/2))));
%I guess we could try filtering it with something?
