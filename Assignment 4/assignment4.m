% Assignment 4
<<<<<<< HEAD
%% Ex 1.2 
% Downlading the files, plotting cross corralations
set(groot,'defaultLineLineWidth',2);
set(groot,'defaultAxesFontSize',12);
[r1,fin1,lags1] = plotTwoSoundFilesAndCorrelation('in_length_100.wav','out_length_100.wav',100,101,102,0);
[r2,fin2,lags2] = plotTwoSoundFilesAndCorrelation('in_length_1000.wav','out_length_1000.wav',1000,1001,1002,0);
[r3,fin3,lags3] = plotTwoSoundFilesAndCorrelation('in_length_10000.wav','out_length_10000.wav',10000,10001,10002,0);
[r4,fin4,lags4] = plotTwoSoundFilesAndCorrelation('in_length_100000.wav','out_length_100000.wav',100000,100001,100002,0);
[r5,fin5,lags5] = plotTwoSoundFilesAndCorrelation('in_length_500000.wav','out_length_500000.wav',500000,500001,500002,0);
=======
%% Ex 1


[r1,fin1, tin1] = plotTwoSoundFilesAndCorrelation('in_length_100.wav','out_length_100.wav',100,101,102,0);
[r2,fin2, tin2] = plotTwoSoundFilesAndCorrelation('in_length_1000.wav','out_length_1000.wav',1000,1001,1002,0);
[r3,fin3, tin3] = plotTwoSoundFilesAndCorrelation('in_length_10000.wav','out_length_10000.wav',10000,10001,10002,0);
[r4,fin4, tin4] = plotTwoSoundFilesAndCorrelation('in_length_100000.wav','out_length_100000.wav',100000,100001,100002,0);
[r5,fin5, tin5] = plotTwoSoundFilesAndCorrelation('in_length_500000.wav','out_length_500000.wav',500000,500001,500002,0);


%close 1
figure(1)
hold on
plot(tin1,r1);
plot(tin2,r2);
plot(tin3,r3);
plot(tin4,r4);
plot(tin5,r5);
hold off

>>>>>>> 323236cd90f3d5e188ace116b66523c7a5036bd9
r11 = r1;
r22 = downsample(r2,floor(1000/100));
r33 = downsample(r3,floor(10000/100));
r44 = downsample(r4,floor(100000/100));
r55 = downsample(r5,floor(500000/100));
<<<<<<< HEAD
=======

>>>>>>> 323236cd90f3d5e188ace116b66523c7a5036bd9
e1 = sum(r11.^2);
e2 = sum(r22.^2);
e3 = sum(r33.^2);
e4 = sum(r44.^2);
e5 = sum(r55.^2);
r111 = r11./(max(r11));
r222 = r22./(max(r22));
r333 = r33./(max(r33));
r444 = r44./(max(r44));
r555 = r55./(max(r55));

figure(106)
plot(lags1./(max(lags1)),r1);
hold on
plot(lags2./(max(lags2)),r2);
plot(lags3./(max(lags3)),r3);
plot(lags4./(max(lags4)),r4);
plot(lags5./(max(lags5)),r5);
%xlim([-500 500]);
legend('100','1000','10000','100000','500000');
xlabel('Normalized lags');
ylabel('Normalized amplitude');
title('Cross correlation/Impulse response');
hold off

%% Plotting the spektra on top of each other
[Y1, freq1] = make_spectrum(r1,fin1); %spectrum
Y1_db = 20*log10(abs(Y1));
[Y2, freq2] = make_spectrum(r2,fin2); %spectrum
Y2_db = 20*log10(abs(Y2));
[Y3, freq3] = make_spectrum(r3,fin3); %spectrum
Y3_db = 20*log10(abs(Y3));
[Y4, freq4] = make_spectrum(r4,fin4); %spectrum
Y4_db = 20*log10(abs(Y4));
[Y5, freq5] = make_spectrum(r5,fin5); %spectrum
Y5_db = 20*log10(abs(Y5));

figure(10000) %Plotting the frequency responses of the filters on top of each other
subplot(2,1,1)
plot(freq1,Y1_db,'color',[0, 0.4470, 0.7410]);
hold on
plot(freq2,Y2_db,'color',[0.8500, 0.3250, 0.0980]);
plot(freq3,Y3_db,'color',[0.9290, 0.6940, 0.1250]);
plot(freq4,Y4_db,'color',[0.4940, 0.1840, 0.5560]);
plot(freq5,Y5_db,'color',[0.4660, 0.6740, 0.1880]);
hold off
xlim([0 5000]);
ylim([-250,0]);
title('Magnitude Frequency response')
ylabel('Magnitude[dB]');
xlabel('Frequency[Hz]')
legend('100','1000','10000','100000','500000');
<<<<<<< HEAD
grid();
subplot(2,1,2)
plot(freq5,angle(Y5),'color',[0.4660, 0.6740, 0.1880]);
hold on
plot(freq4,angle(Y4),'color',[0.4940, 0.1840, 0.5560]);
plot(freq3,angle(Y3),'color',[0.9290, 0.6940, 0.1250]);
plot(freq2,angle(Y2),'color',[0.8500, 0.3250, 0.0980]);
plot(freq1,angle(Y1),'color',[0, 0.4470, 0.7410]);
hold off
xlim([0 5000]);
%ylim([-250,0]);
%title('Magnitude Frequency response')
ylabel('Phase[rad]');
xlabel('Frequency[Hz]')
legend('500000','100000','10000','1000','100');
grid();
=======
title('Downsampled to length of 199, normalized');

e1 = 1;%sum(r11.^2)/length(r11);
e2 = 1;%sum(r22.^2)/length(r22);
e3 = 1;%sum(r33.^2)/length(r33);
e4 = 1;%sum(r44.^2)/length(r44);
e5 = 1;%sum(r55.^2)/length(r55);
r111 = r11./max(abs(r11));
r222 = r22./max(abs(r22));
r333 = r33./max(abs(r33));
r444 = r44./max(abs(r44));
r555 = r55./max(abs(r55));


>>>>>>> 323236cd90f3d5e188ace116b66523c7a5036bd9


<<<<<<< HEAD

%% Doing magnitude comparisons of the various mock filters
figure(108)
f = 1/(2e3);
t = 0:f:4; %a 2 second chirp with sampling freq f
y = chirp(t,0,1,250);
y_fil = conv(r5,y);
t_fil = (0:length(y_fil)-1)/(1*10^3);
plot(y);
hold on;
plot(y_fil);
legend('chirp','filtered chirp')
hold off;

[Y, freq] = make_spectrum(y,f); %spectrum
Y_db = 20*log10(abs(Y));
[Y_fil, freq_fil] = make_spectrum(y_fil,f); %spectrum
Y_fildb = 20*log10(abs(Y_fil));

[b1,a1] = butter(2,[0.199 0.201],'bandpass');
[h1,w1] = freqz(b1,a1);
y_butt = filter(b,a,y);
%t_butt = 1:length(y);
figure(10001)
impz(b,a);
%figure(111)
%plot(t,y,'--',t,y_butt,'-')
%legend('Original Data','Filtered Data')

[Y_butt, freq_butt] = make_spectrum(y_butt,f); %spectrum
Y_buttdb = 20*log10(abs(Y_butt));

H = horzcat(ones(1,19)*db2mag(-175),ones(1,3)*db2mag(-80),ones(1,78)*db2mag(-175));
%H = horzcat(zeros(1,200),ones(1,1)*db2mag(-100),zeros(1,799));

H = horzcat(H,fliplr(H));
h = fftshift(ifft((H),'symmetric')); %gives the impulse response
figure(113)
[h2,w2] = freqz(h,1,length(h),'whole');
freqz(h,1,length(h),'whole');

%figure(114);
%impz(h);

y_fir = filter(h,1,y);
%t_fir = 1:length(y);

%figure(115)
%plot(t_fir,y,'--',t_fir,y_fir,'-')
%legend('Original Data','Filtered Data')

[Y_fir, freq_fir] = make_spectrum(y_fir,f); %spectrum
Y_firdb = 20*log10(abs(Y_fir));

[b3,a3] = ellip(3,70,150,[0.196 0.204],'bandpass');
y_ell = filter(b3,a3,y);
[h3,w3] = freqz(b3,a3);

[Y_ell, freq_ell] = make_spectrum(y_ell,f); %spectrum
Y_elldb = 20*log10(abs(Y_ell));

[Y, freq] = make_spectrum(r5,fin5); %spectrum
Y_db = 20*log10(abs(Y));

figure(135) %Plotting the frequency responses of the filters on top of each other
plot(freq,Y_db);
hold on
plot(w1*(5000/pi),db(h1));
plot(w2*(5000/pi),db(abs(h2)));
plot(w3*(5000/pi),db(h3));
xlim([0 5000]);
ylim([-250 0]);
xlabel('Frequency[Hz]');
ylabel('Magnitude[dB]');
legend('Mystery system','199 order FIR filer','2nd order Butterworth bandpass','3rd order Elliptical bandpass')
%legend('Mystery','2nd order Butterworth bandpass','3rd order Elliptical bandpass')
title('Comparative magnitude of frequensy response')
hold off
%plot()

figure(136) %Plotting the frequency responses of the filters on top of each other
%subplot(2,1,1)
plot(freq,Y_db);
hold on
plot(freq_fil,Y_fildb);
plot(freq_fir,Y_firdb)
plot(freq_ell,Y_elldb);
plot(freq_butt,Y_buttdb);
hold off
xlim([0 f/2]);
ylim([-250,0]);
title('Magnitude frequency response of filtered and unfiltered chirp')
ylabel('Magnitude[dB]');
xlabel('Frequency[Hz]')
legend({'Unfiltered chirp','Chirp filtered with mystery function','Chirp filtered with ideal 199 order FIR filter','Chirp filtered with 5th order Elliptical filter','Chirp filtered with 2nd order Butterworth filter'},'Position',[0.6 0.7 0.05 0.1])
%legend({'Unfiltered chirp','Chirp filtered with mystery function','Chirp filtered with 5th order Elliptical filter','Chirp filtered with 2nd order Butterworth filter'},'Position',[0.5 0.6 0.05 0.1])
grid();

%% Producing the transfer function from output/input
=======
[h1,fs1] = plotTwoSoundFilesAndCorrelation('in_length_100.wav','out_length_100.wav',100,101,102,0);
[h2,fs2] = plotTwoSoundFilesAndCorrelation('in_length_1000.wav','out_length_1000.wav',1000,1001,1002,0);
[h3,fs3] = plotTwoSoundFilesAndCorrelation('in_length_10000.wav','out_length_10000.wav',10000,10001,10002,0);
[h4,fs4] = plotTwoSoundFilesAndCorrelation('in_length_100000.wav','out_length_100000.wav',100000,100001,100002,0);
[h5,fs5] = plotTwoSoundFilesAndCorrelation('in_length_500000.wav','out_length_500000.wav',500000,500001,500002,0);

% figure(10)
% subplot(5,1,1);
% title('zero padded in frequency domain');
% stem(h5);
% legend('500000');
% subplot(5,1,2);
% stem(h4);
% legend('100000');
% subplot(5,1,3);
% stem(h3);
% legend('10000');
% subplot(5,1,4);
% stem(h2);
% legend('1000');
% subplot(5,1,5);
% stem(h1);
% legend('100');

H1 = fft(h1);
H2 = fft(h2);
H3 = fft(h3);
H4 = fft(h4);
H5 = fft(h5);

H1 = zero_pad_alt(H1,H5);
H2 = zero_pad_alt(H2,H5);
H3 = zero_pad_alt(H3,H5);
H4 = zero_pad_alt(H4,H5);

h1 = ifft(H1,'symmetric');
h2 = ifft(H2,'symmetric');
h3 = ifft(H3,'symmetric');
h4 = ifft(H4,'symmetric');
h5 = ifft(H5,'symmetric');

h1 = h1./max(abs(h1));
h2 = h2./max(abs(h2));
h3 = h3./max(abs(h3));
h4 = h4./max(abs(h4));
h5 = h5./max(abs(h5));

%close 1
figure(1)
subplot(5,1,1);
title('zero padded in frequency domain');
stem(h5);
legend('500000');
subplot(5,1,2);
stem(h4);
legend('100000');
subplot(5,1,3);
stem(h3);
legend('10000');
subplot(5,1,4);
stem(h2);
legend('1000');
subplot(5,1,5);
stem(h1);
legend('100');

%% Ex 1.2
>>>>>>> 323236cd90f3d5e188ace116b66523c7a5036bd9

[H1, F1] = plotInOut('100',1);
[H2, F2] = plotInOut('1000',2);
[H3, F3] = plotInOut('10000',3);
[H4, F4] = plotInOut('100000',4);
[H5, F5] = plotInOut('500000',5);

%close 6
figure(6)
hold on
plot(F5,mag2db(abs(H5)))
plot(F4,mag2db(abs(H4)))
plot(F3,mag2db(abs(H3)))
plot(F2,mag2db(abs(H2)))
plot(F1,mag2db(abs(H1)))
ylabel('Magnitude[dB]')
xlabel('Frequency[Hz]')
legend('500000 points','100000 points','10000 points','1000 points','100 points');
xlim([0 5000]);
title('Magnitude of frequency response of each filter estimate')
hold off

%% Ex 2

<<<<<<< HEAD
spectre('Animal_call.wav','hann',199,0.2,200,1);
%spectre('Animal_call.wav','hann',249,0.1,250,2);
=======
spectre('Animal_call.wav',199,0.3,200,1); % Behold! 
>>>>>>> 323236cd90f3d5e188ace116b66523c7a5036bd9
