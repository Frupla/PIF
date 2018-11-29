

namein = 'in_length_10000.wav';
nameout = 'out_length_10000.wav';


[in, fin] = import_sound(namein);
[out, fout] = import_sound(nameout);
tin = (0:length(in)-1)/fin;
tout = (0:length(out)-1)/fout;

X = fftshift(fft(in));
Y = fftshift(fft(out));

H = Y./X;

plot(abs(make_spectrum(in,fin)))
hold on
plot(abs(make_spectrum(out,fout)))




