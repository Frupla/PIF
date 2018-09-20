function [f,x] = importSound(fileName)
[x,f] = audioread(['C:\Users\tilfr\Dropbox\DTU\Signaler og (Diskret)\Grupperegning\sounds' filesep fileName]);
end