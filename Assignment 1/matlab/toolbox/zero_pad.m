function[new_signal] = zero_pad(time_vector, signal)
if length(signal) >= length(time_vector)
    new_signal = signal(1:length(time_vector));
else
    new_signal = horzcat(signal, zeros(1,length(time_vector)-length(signal)));
end
% Function call:
%
% >> [new_signal] = zero_pad(time_vector, signal, T_s)
%
% INPUT:
% time_vector
% signal
%
% OUTPUT:
% new_signal : the output signal, corrected to lenght of time_vector
%
% This function scales the signal to the length of the timevector, either
% by cutting values or padding with zeroes

end
