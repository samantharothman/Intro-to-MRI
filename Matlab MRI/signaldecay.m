
% constants
frequency= 0:1:30;   %in Hz
t = 0:1:500;  %in msecs
t = t./1000;  %convert to seconds
omega = 2 .* pi .* frequency;  %conv to rad/sec
Mo = 1;

% 1 Hz
deltaF1 = 1;
T21 = 1/(2*pi*deltaF1);

% 2 Hz
deltaF2 = 2;
T22 = 1/(2*pi*deltaF2);

% 3 Hz
deltaF3 = 3;
T23 = 1/(2*pi*deltaF3);

% 4 Hz
deltaF4 = 4;
T24 = 1/(2*pi*deltaF4);
% remove semicolons from T2 lines to see values 


% Lorentzian function for each DeltaF 
lor1 = Mo .* ((T21)./(1+(omega .* T21).^2));  % 1 Hz
lor2 = Mo .* ((T22)./(1+(omega .* T22).^2));  % 2 Hz
lor3 = Mo .* ((T23)./(1+(omega .* T23).^2));  % 3 Hz
lor4 = Mo .* ((T24)./(1+(omega .* T24).^2));  % 4 Hz


% exponential decay function for each DeltaF 
expon1 = Mo .* exp(-t/T21);  % 1 Hz
expon2 = Mo .* exp(-t/T22);  % 2 Hz
expon3 = Mo .* exp(-t/T23);  % 3 Hz
expon4 = Mo .* exp(-t/T24);  % 4 Hz

figure()

subplot(3,2,[1,2])
% plot Lorenztian as a function of frequency
plot(frequency,lor1);
hold on
plot(frequency,lor2);
plot(frequency,lor3);
plot(frequency,lor4);
hold off
grid on 
% label graph
title('Lorentzian Function')
xlabel('Frequency')
ylabel('Magnitude')
legend('DeltaF = 1Hz','DeltaF = 2Hz', 'DeltaF = 3Hz', 'DeltaF = 4Hz')


subplot(3,2,[3,4])
% plot exponential decay as a function of time
plot(t, expon1);
hold on
plot(t, expon2);
plot(t, expon3);
plot(t, expon4);
hold off
grid on 
% label graph
title('Exponential Decay')
xlabel('Time')
ylabel('Magnitude')
legend('DeltaF = 1Hz','DeltaF = 2Hz', 'DeltaF = 3Hz', 'DeltaF = 4Hz')



% plot Lorentzian and exponential at 7T
deltaF7T = (7/3)*2;
T27T = 1/(2*pi*deltaF7T);

subplot(3,2,5)
% Lorentzian equations at 7T
lor7T = Mo .* ((T27T)./(1+(omega .* T27T).^2)); 

% plot as function of frequency
plot(frequency, lor7T)

% label 
grid on 
xlabel('Frequency')
ylabel('Magnitude')
title('Lorentzian at 7T')

subplot(3,2,6)

% exponential at 7T
expon7T = Mo .* exp(-t/T27T);

% plot exponential as a function of time
plot(t, expon7T)

% label
grid on 
xlabel('Time')
ylabel('Magnitude')
title('Exponential at 7T')



