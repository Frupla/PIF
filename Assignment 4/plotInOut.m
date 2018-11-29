function [H F] = plotInOut(filename, figureNumber)
% Takes number in one of the input output files, plots it in figure number
% figureNumber

[in, fin] = import_sound(strcat('in_length_',filename,'.wav'));
[out, fout] = import_sound(strcat('out_length_',filename,'.wav'));

[In, Fin] = make_spectrum(in,fin);
[Out, Fout] = make_spectrum(out,fout);

H = Out./In;
F = Fin;

figure(figureNumber)
subplot(2,1,1)
plot(Fin,In);
subplot(2,1,2)
plot(Fout,mag2db(abs(Out)));


end