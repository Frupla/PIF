<<<<<<< HEAD
function [s, t] = generate_ramp(T0, f, Tn)
t = 0:1/f:T0-1/f;
tn = 0:1/f:Tn-1/f;
s = t; 
=======
function [s, t] = generate_ramp(T0, fs, Tn)
% Input T0, fs, Tn
% This function generates a signal which is Tn seconds long
% the signal contains a ramp which lasts until T0
% the signal has a sampling frequency of fs
t = 0:1/fs:T0-1/fs;
tn = 0:1/fs:Tn-1/fs;
s = t;
>>>>>>> 8ce9d3701ea409c2570d79ef80d031bae5f1e52a
s = zero_pad(s,tn);
if(length(tn) > length(t))
    t = tn;
end