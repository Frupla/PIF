function [s, t] = generate_ramp(T0, f, Tn)
t = 0:1/f:T0-1/f;
tn = 0:1/f:Tn-1/f;
s = t;
s = zero_pad(s,tn);
if(length(tn) > length(t))
    t = tn;
end