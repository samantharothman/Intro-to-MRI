%{

This program plots the results
of a T2 pulse acquire on the real axis and imaginary axis,
along with the magnitude.

%}

% get frequency value
prompt1 = 'What frequency?';
frequency = input(prompt1);

% solve for omega
omega = 2 .* pi .* frequency;

% get T2 value
prompt2 = 'What T2?';
T2 = input(prompt2);

Mo = 1;

t = 0:1:100;

figure()


% plot real axis
subplot(311)
y =Mo .* exp(-t/T2) .* cos(omega *  t/1000);
plot(t,y)
title('Real Axis');
xlabel('Time (msecs)');
ylabel('Magnetization');
grid on

% plot imaginary axis
subplot(312)
z = Mo .* exp(-t/T2) .* sin(omega *  t/1000);
plot(t, z)
grid on


% plot magnitude
subplot(313)
Mt = sqrt(y.^2 + z.^2);
plot(t, Mt)
title('Magnitude');
xlabel('Time (msecs)');
ylabel('Magnitude');
grid on