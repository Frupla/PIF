function [] = plotTwoSoundFilesAndCorrelation(namein, nameout, figurenumber1, figurenumber2)
[in fin] = audioread(namein);
[out fout] = audioread(nameout);
tin = (0:length(in)-1)/fin;
tout = (0:length(out)-1)/fout;

figure(figurenumber1)
subplot(2,1,1)
plot(tin,in);
title(namein)
xlabel('Time (s)')
subplot(2,1,2)
plot(tout,out);
title(nameout)
xlabel('Time (s)')



[r,lags] = xcorr(in,out);
figure(figurenumber2)
plot(lags,r)
title('Correlation');
end