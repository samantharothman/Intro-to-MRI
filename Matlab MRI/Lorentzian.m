% constants 
frequency = -200:1:200;  % in Hz
omega = 2 .* pi .* frequency;  % convert to rad/sec
t = 0:1:500;  % in msecs
Mo = 1;

% get T2 value in msecs
T2 = input('What T2 value? ');

% lorentzian equation
lor = Mo .* ((T2)./(1+(omega .* T2/1000).^2));

% exponential decay equation
expo = Mo .* exp(-t/T2);

figure()

subplot(3, 1, 1)
% plot lorentzian equation as a function of frequency
plot(frequency, lor)

%label
title('Lorentzian Function')
xlabel('Frequency')
ylabel('Magnitude')
grid on 


subplot(3, 1, 2)
% plot exponential equation as a function of time
plot(t, expo);

% label
title('Exponential Function')
xlabel('Time')
ylabel('Magnitude')
grid on 

subplot(3,1,3)
% plot fourier transformation of lorentzian
m = ifft(lor);
m = abs((m));
plot(m)
title('Fourier Transformation of Lorentzian')
xlim([0,200])
xlabel('Time')
ylabel('Magnitude')
grid on
