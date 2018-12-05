function [matrix, fs] = spectre(filename, window_type, window_length, overlap, points,n)
% Generates a spectrogram based on a sound file.
% [matrix,fs] = spectre(filename, window_type, window_length, overlap, points, n)

[signal, fs] = import_sound(filename);

matrix = zeros(ceil(length(signal)/window_length*overlap),points);

switch(window_type)
    case 'hann'
        window = hann(window_length)';
    case 'rect'
        [window, t_axis] = generate_square(window_length,1,window_length);
    otherwise
       warning('NO YOU, WHY? WHY WOULD YOU DO THAT!? JUST NO. NO!')
end


for i = 1:floor((length(signal)/window_length)/overlap)
   temp = signal(1:window_length);
   temp = temp.*window';
   matrix(i,:) = fft(temp, points); 
   signal = circshift(signal,floor(window_length*overlap));
end

figure(n)
surf(mag2db(abs(matrix(:,1:round(points/2)))), 'EdgeColor','none');
axis xy; axis tight; colormap(parula); view(0,90);
%imagesc(mag2db(abs(matrix(:,1:round(points/2)))));
colorbar();
xlabel('Frequency');
ylabel('Sample number');

    

end
