%{
This program plots the Fourier
transform of signals.
%}

% get number of samples being entered
samples = input('How many samples? ');

% create arrays 
frequency = ones([1, samples]);
Mo = ones([1, samples]);
T2 = ones([1, samples]);

% get user values
for c = 1:samples
   fprintf('Sample number %d \n', c)
   frequency(c) = input('Frequency: ');
   Mo(c) = input('Mo: ');
   T2(c) = input('T2: ');
    
end
                 
t = 0:1:1000;

omega = 2 .* pi .* frequency;

% add x values
x1 = Mo(1) .* cos(omega(1) *  t/1000).* exp(-t/T2(1));

for c = 2:samples
   x1 = x1 + (Mo(c).*cos(omega(c)*t/1000).* exp(-t/T2(c)));
end

% add y values
y1 = Mo(1) .* sin(omega(1) *  t/1000).* exp(-t/T2(1));

for c = 2:samples
    y1 = y1 + (Mo(c).*sin(omega(c)*t/1000).* exp(-t/T2(c)));
end

% add magnetization values
m1 = Mo(1) .* exp((1i*omega(1)*t/1000) + (-t/T2(1))); 
 
for c = 2:samples
    m1 = m1 + (Mo(c) .* exp((1i*omega(c)*t/1000) + (-t/T2(c))));
    
end

figure()

% plot x components
subplot(311)
plot(t, x1)
title('X Components');
grid on

% plot y components 
subplot(312)
plot(t, y1)
title('Y Components');
grid on

% plot the fourier transformation
subplot(313)
f = fft(m1);
plot(abs(f))
title('Fourier Plot');
xlabel('Frequency');
ylabel('Amplitude');
grid on

% allow for user to see values
hdt = datacursormode;
set(hdt,'DisplayStyle','window');