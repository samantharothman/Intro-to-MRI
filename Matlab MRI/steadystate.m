%{
This program plots the magnetization
after steady state saturation.
%}

% get TR value
prompt1 = 'What TR?';
TR = input(prompt1);

%constants
Mo = 1;
T2 = 50;
T = 0:1:200;


%equations with each T1 value
M1 = Mo.*(1-exp(-TR/100)).*(exp(-T/T2));
M2 = Mo.*(1-exp(-TR/1000)).*(exp(-T/T2));
M3 = Mo.*(1-exp(-TR/2000)).*(exp(-T/T2));
M4 = Mo.*(1-exp(-TR/10000)).*(exp(-T/T2));

figure()
 
%plot each equation on graph
plot(T, M1);
hold on
plot(T, M2);
plot(T, M3);
plot(T, M4);
hold off

%label graph
grid on 
ylabel('Magnetization');
xlabel('Time (msecs)');
title('Steady State Saturation');
legend('T1=100','T1=1000', 'T1=2000', 'T1=10000')