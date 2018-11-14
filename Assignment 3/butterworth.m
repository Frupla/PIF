set(groot,'defaultLineLineWidth',2)

Gp = 2;  % passband maximum attenuation
Gs = 100; % Stopband minimum attenuation

wp = [0.2 0.3];%normalize 
ws = [0.1 0.4];%normalize

[n,Wn]=buttord(wp,ws,Gp,Gs); %pre-warping and biletaral transform is 
                             %included in the funciton
[B,A] = butter(n,Wn);
figure(1)
freqz(B,A);
title((n + "th Order Butterwoth Filter"));

figure(2)
ht = impz(B,A);
set(groot,'defaultLineLineWidth',1)
subplot(2,2,1)
stem(ht,'-o')
title('Complete impulse response')
M = max(ht);
for i = length(ht):-1:0
    if abs(ht(i)) >= max(abs(ht))*0.1
        break;
    end
end

htcut = ht(1:i);
%%
subplot(2,2,2)

stem(htcut(1:round(i*1)),'-o')
title("Effectivce IR (10%)[" + i + "]")
subplot(2,2,3)
stem(htcut(1:round(i*0.6)))
title("60% Effectivce IR[" + round(i*0.6) + "]")
subplot(2,2,4)
stem(htcut(1:round(i*0.1)))
title("   10% Effectivce IR[" + round(i*0.1) + "]")
ylim([-max(abs(htcut(1:round(i*0.1))))*1.2 max(abs(htcut(1:round(i*0.1))))*1.2])








%%
set(groot,'defaultLineLineWidth',2)

freqz(htcut);

%%


%freqz(htcut(1:i*.70));

%%
freqz(htcut(1:i*.60));

%%
subplot(2,2,3)
freqz(htcut(1:i*.40));


%%
subplot(2,2,4)
freqz(htcut(1:i*.10));


%%




%%



%%


%%

















