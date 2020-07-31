
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
                 
t = -0:1:500;

omega = 2 .* pi .* frequency;



% add magnetization values
m1 = Mo(1) .* exp((1i*omega(1)*t/1000) + (-t/T2(1))); 
 
for c = 2:samples
    m1 = m1 + (Mo(c) .* exp((1i*omega(c)*t/1000) + (-t/T2(c))));
    
end

figure()

% plot magnetization 
subplot(211)
plot(t, m1)
title('Magnetization');
grid on


% plot Lorentzian with set T2
subplot(212)
lorfrequency = -10:1:10;
omega2 = 2*pi*lorfrequency;
lorT2 = 2/(2*pi*10);
lorMo = 1;


lor = lorMo .* ((lorT2)./(1+(omega2 .* lorT2).^2));
plot(lorfrequency, lor)9



%label
title('Lorentzian Function')
xlabel('Frequency (Hz)')
ylabel('Signal Magnitude')
grid on
