function [matrix, fs] = spectre(filename, window_type, window_length, overlap, points)
% Generates a spectrogram based on a sound file.

[signal, fs] = import_sound(filename);

matrix = zeros(ceil(length(signal)/window_length),points);

switch(window_type)
    case 'hann'
        window = hann(window_length)';
    case 'rect'
        [window, t_axis] = generate_square(window_length,1,window_length);
    otherwise
       warning('NO YOU, WHY? WHY WOULD YOU DO THAT!? JUST NO. NO!')
end


for i = 1:floor(length(signal)/window_length)
   a = floor(window_length*(i-1)*overlap)+1;
   b = floor(window_length*i*overlap) + floor((1-overlap)*window_length);
   temp = signal(a:b);
   temp = temp.*window';
   matrix(i,:) = fft(temp, points);
end

end
