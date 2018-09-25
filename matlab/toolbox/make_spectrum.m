function [Y, freq] = make_spectrum(signal, fs)
    

Y = fftshift(fft(signal)); % fft is a fast algortihm and needs fftshift to 
                           % sort from minimum negative freq to positive
                           % frequency
Y = Y/length(Y); % the values of Y needs to be normalized with the amount 
                 % samples (1/N) to finalize the transformation

                 
delta_f = fs/length(signal);  % The increment in frequency
freq  = -fs/2:delta_f:fs/2-delta_f; % The nyquist frequceny is fs/2, 
                                    % therefore this is the highest/lowest
                                    % possible values

end