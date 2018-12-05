function [matrix, fs] = spectre(filename, window_length, overlap, points,n)
% Generates a spectrogram based on a sound file.
% [matrix,fs] = spectre(filename    , window_length, overlap, points, n)

[signal, fs] = import_sound(filename);

matrix = zeros(ceil(length(signal)/window_length*overlap),points);

window = hann(window_length)';

for i = 1:ceil(length(signal)/(window_length*overlap))
   temp = signal(1:window_length);
   temp = temp.*window';
   matrix(i,:) = fft(temp, points); 
   signal = circshift(signal,floor(window_length*overlap));
end

figure(n)
surf(mag2db(abs(matrix(:,1:round(points/2)))), 'EdgeColor','none');
axis xy; axis tight; colormap(parula); view(0,90);
colorbar();
xlabel('Frequency');
ylabel('Sample number');

    

end
