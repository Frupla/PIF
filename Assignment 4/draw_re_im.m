function draw_re_im(n,freq,signal)
figure(n)
fs = freq(2)-freq(1);

subplot(2,1,1);
h1 = plot(freq,real(signal));
set(h1, 'linewidth', 1);
set(h1, 'linewidth', 1);
xlim([-fs*length(signal)/2, fs*length(signal)/2]);
title('real part');

subplot(2,1,2);
plot(freq,imag(signal));
xlim([-fs*length(signal)/2, fs*length(signal)/2]);
title('imaginary part');

end