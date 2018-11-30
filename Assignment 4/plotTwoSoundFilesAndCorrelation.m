function [r,fin] = plotTwoSoundFilesAndCorrelation(namein, nameout, figurenumber1, figurenumber2,figurenumber3,makeABillionPlots)
[in fin] = audioread(namein);
[out fout] = audioread(nameout);
tin = (0:length(in)-1)/fin;
tout = (0:length(out)-1)/fout;





[r,lags] = xcorr(in,out);

[Y, freq] = make_spectrum(r,fin);
if(makeABillionPlots)
    figure(figurenumber1)
    subplot(2,1,1)
    plot(tin,in);
    title(namein)
    xlabel('Time (s)')
    subplot(2,1,2)
    plot(tout,out);
    title(nameout)
    xlabel('Time (s)')

    figure(figurenumber2)
    plot(lags,r)
    title('Correlation');


    figure(figurenumber3) %Plotting the frequency responses of the two filters on top of each other
    subplot(2,1,1)
    Y_db = 20*log10(abs(Y));
    plot(freq,Y_db,'Color','red')
    ylabel('Magnitude[dB]');
    xlabel('Frequency[Hz]')
    grid();
    subplot(2,1,2)
    %Yn(abs(Y)<max(abs(Y))/10000)=0; % Reducing amount of noice
    plot(freq,angle(Y),'Color','red');
    ylabel('Phase[rad]');
    xlabel('Frequency[Hz]');
    set(findall(gcf,'-property','FontSize'),'FontSize',12);
    %yticks(-6*pi:pi:pi);
    %yticklabels({'-6\pi','-5\pi','-4\pi','-3\pi','-2\pi','\pi','0','\pi','2\pi'});
    grid();
    hold off
else
end

%H = fft(out)/fft(in);
%h = ifft(H);
%figure(figurenumber3);
%plot(h)
end