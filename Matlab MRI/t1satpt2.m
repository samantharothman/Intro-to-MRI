%{

This program plots the saturation
recovery absolute magnitude after a 90 degree
pulse.

%}

Mo = 1;

%points on x axis
t = [10, 50, 100, 200, 500, 1000, 2000];
TR = 0:1:2000;

figure()

%equations with each T1 value
M10 = Mo.*(1-exp(-TR/10)); 
M100 = Mo.*(1-exp(-TR/100));
M1000 = Mo.*(1-exp(-TR/1000));

%equations for individual TR points
M1 = Mo.*(1-exp(-t/10)); 
M2 = Mo.*(1-exp(-t/100));
M3 = Mo.*(1-exp(-t/1000));

%plot full functions
plot(TR, M10, 'b');
hold on
plot(TR, M100, 'g');
plot(TR, M1000, 'r');

%plot individual points
scatter(t, M1, 'b')
scatter(t, M2, 'g')
scatter(t, M3, 'r')

hold off

%label graph
grid on
ylabel('MZ');
xlabel('TR');
title('Magnitude');
legend('T1=10','T1=100', 'T1=1000')
