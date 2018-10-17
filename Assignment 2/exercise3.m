%% 3.1

%% FIR

alpha = 0.6;
t = 30*10^(-3);
fs = 1/(5*10^(-3));
delay_samples = t*fs;

FIR = [1; zeros(delay_samples,1);alpha];


%%
[s,f] = import_sound('Sax12.wav');
%%
sound(s,f);
%%
S = conv(s,FIR);
%%
sound(S,f);

%% IIR

IIR = [1; zeros(delay_samples,1);alpha];

