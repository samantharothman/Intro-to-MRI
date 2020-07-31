%{
This program plots the magnetization
after a chemical shift.
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

t = 0:1:1000;

figure()


% plot real axis
subplot(311)
x =Mo .* cos(omega *  t/1000) .* exp(-t/T2);
plot(t,x)
title('Real Axis');
xlabel('Time (msecs)');
ylabel('Magnetization');
grid on

% plot imaginary axis
subplot(312)
y = Mo .* sin(omega *  t/1000) .* exp(-t/T2);
plot(t, y)
title('Imaginary Axis');
xlabel('Time (msecs)');
ylabel('Magnetization');
grid on

% plot both equations on 3d graph
subplot(313)
plot3(x, y, t);
xlabel('Real Axis');
ylabel('Imaginary Axis');
zlabel('Time (msecs)');
grid on
rotate3d on
