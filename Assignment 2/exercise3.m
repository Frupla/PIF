%% 3.1

%% FIR and IIR filters

% Setting up the various values for our plots
alpha = 0.6;
T1 = 10*10^(-3);  % delay of 10 ms
T2 = 30*10^(-3);  % delay of 30 ms
T3 = 200*10^(-3); % delay of 200 ms
f = 1000; % [Hz] sampling frequency
delay_samples1 = T1*f;
delay_samples2 = T2*f;
delay_samples3 = T3*f;


A1 = [1; zeros(delay_samples1-1,1);alpha]; % Setting up the nominator and denominator
B1 = 1;

A2 = [1; zeros(delay_samples2-1,1);alpha];
B2 = 1;

A3 = [1; zeros(delay_samples3-1,1);alpha];
B3 = 1;

%[s,f] = import_sound('Sax12.wav'); % Setting the signal
s = [1;zeros(999,1)]; % We it is just set to be an imulse

FIR1 = filter(A1,B1,s); % Creating the filters as described in the hand in
IIR1 = filter(B1,A1,s);

FIR2 = filter(A2,B2,s);
IIR2 = filter(B2,A2,s);

FIR3 = filter(A3,B3,s);
IIR3 = filter(B3,A3,s);

tf1 = 0:1/f:length(FIR1)/f-1/f; % Setting up the prober x-axis
ti1 = 0:1/f:length(IIR1)/f-1/f;

tf2 = 0:1/f:length(FIR2)/f-1/f;
ti2 = 0:1/f:length(IIR2)/f-1/f;

tf3 = 0:1/f:length(FIR3)/f-1/f;
ti3 = 0:1/f:length(IIR3)/f-1/f;

figure(1) % Plotting
subplot(3,1,1);
plot(tf1,FIR1, 'linewidth', 2);
title('FIR');
xlim([0 0.03])
ylim([-1 1])
xlabel('time [s], delay = 10ms');
ylabel('magnitude');
grid();

subplot(3,1,2);
plot(tf2,FIR2, 'linewidth', 2);
xlim([0 0.05])
ylim([-1 1])
xlabel('time [s], delay = 30ms');
ylabel('magnitude');
grid();

subplot(3,1,3);
plot(tf3,FIR3, 'linewidth', 2);
xlim([0 0.3])
ylim([-1 1])
xlabel('time [s], delay = 200ms');
ylabel('magnitude');
grid();


figure(2)
subplot(3,1,1);
plot(ti1,IIR1, 'linewidth', 2);
title('IIR');
xlim([0 6*T1])
ylim([-1 1])
xlabel('time [s], delay = 10ms');
ylabel('magnitude');
grid();

subplot(3,1,2);
plot(ti2,IIR2, 'linewidth', 2);
xlim([0 6*T2])
ylim([-1 1])
xlabel('time [s], delay = 30ms');
ylabel('magnitude');
grid();

subplot(3,1,3);
plot(ti3,IIR3, 'linewidth', 2);
xlim([0 1])
ylim([-1 1])
xlabel('time [s], delay = 200ms');
ylabel('magnitude');
grid();

%%
sound(s,f);
%%
sound(IIR1,f)
pause(1/f*(length(FIR1)+length(IIR1)));
sound(FIR1,f)

%%
% Plotting the spectrums of the various filters
plotting_IR_filters(4,FIR1,f,' (FIR)',' 10ms');
plotting_IR_filters(5,IIR1,f,' (IIR)',' 10ms');
%%
plotting_IR_filters(6,FIR2,f,' (FIR)',' 30ms');
plotting_IR_filters(7,IIR2,f,' (IIR)',' 30ms');

plotting_IR_filters(8,FIR3,f,' (FIR)',' 200ms');
plotting_IR_filters(9,IIR3,f,' (IIR)',' 200ms');
