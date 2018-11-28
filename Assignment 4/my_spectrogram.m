function [output]  = my_spectrogram(filename, windowtype,l,fftpoints,figurenumber)
%NOTE fftpoints still doesn't quite work, maybe ask someone?
%window type index
% 1. hann
% 2. hamming
% anything else: rect

[s,f] = audioread(filename);

if (windowtype == 1)
    w = hann(l);
    elseif (windowtype == 2)
    w = hamming(l); 
else
    %w =     
end
%we try to find how many loops we wish to run
ll = ceil((length(s)/(l-fftpoints)))-1; 
ss = [s', zeros(1,ll*l-length(s))]; 

%n = 0;
p = zeros(l,ll);
for n = 1:ll
    c1 = ss(1:l); %cut out of the frame
    c2 = c1'.*w; %multiply with window
    p(:,n) = (fft(c2));
    ss = circshift(ss,(l-fftpoints),2);
end
%insert plotting here
figure(figurenumber);
imagesc(abs(p).^2);
output=p;
end