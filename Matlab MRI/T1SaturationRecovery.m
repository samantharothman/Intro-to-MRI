%{

This program plots the
x magnetization of saturation recovery.

%}

% get TR value
prompt1 = 'What TR?';
TR = input(prompt1);

%constants
Mo = 1;
T2 = 50;
t = 0:1:100;

figure()

%equations with each T1 value
M1 = Mo .* (1-exp(-TR/10)) .* exp(-t/T2);
M2 = Mo .* (1-exp(-TR/100)) .* exp(-t/T2);
M3 = Mo .* (1-exp(-TR/1000)) .* exp(-t/T2);
M4 = Mo .* (1-exp(-TR/2000)) .* exp(-t/T2);

%plot each equation on graph
plot(t, M1 );
hold on 
plot(t, M2);
plot( t, M3);
plot(t, M4);
hold off

%label graph
grid on
ylabel('Magnetization');
xlabel('Time (msecs)');
title('x Magnetization');
legend('T1=10','T1=100', 'T1=1000', 'T1=2000')



          