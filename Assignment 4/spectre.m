function [matrix, fs] = spectre(filename, window_length, overlap, points,n)
% Generates a spectrogram based on a sound file.
% [matrix,fs] = spectre(filename, window_length, overlap, points, n)

[signal, fs] = import_sound(filename);
sound(signal,fs);

matrix = zeros(ceil(length(signal)/window_length*overlap),points);

window = hann(window_length)';

for i = 1:ceil(length(signal)/(window_length*overlap))
   temp = signal(1:window_length);
   temp = temp.*window';
   matrix(ceil(length(signal)/(window_length*overlap))-i+1,:) = fft(temp, points); 
   signal = circshift(signal,floor(window_length*overlap));
end

figure(n)
%surf(mag2db(abs(matrix(:,round(points/2):points))), 'EdgeColor','none');
surf(mag2db(abs(matrix(:,1:round(points/2)))), 'EdgeColor','none');
axis xy; axis tight; colormap(parula); view(0,90);
c = colorbar;
c.Label.String = 'magnitude (dB)';
xlabel('Frequency [Hz]');
ylabel('Sample number');
xticks([1 points/8 points/4 3*points/8 points/2]);
xticklabels({0, fs/8, fs/4, 3*fs/8, fs/2});

    

end
