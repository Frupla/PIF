function [Y, freq] = make_spectrum(signal, fs)
    


Y = fftshift(fft(signal));

Y = Y/length(Y);

delta_f = fs/length(signal);
freq  = -fs/2:delta_f:fs/2-delta_f;


end