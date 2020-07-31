% constant
T2 = input('What T2 value for all 7 points?');
Mo = 1;


figure()


subplot(3,2,1)

% plot first point

frequency1 = input('What is the first frequency:');

point1 = Mo .* ((T2)./(1+((2*pi*frequency1) .* T2).^2));

plot(frequency1, point1, 'o');

%label subplot
title('One Point')
xlabel('Frequency (Hz)')
ylabel('Signal Magnitude')

subplot(3,2,2)
% plot 2 more points  
frequency2pos = input('Second Frequency:');
frequency2neg = -(frequency2pos);

point2 =  Mo .* ((T2)./(1+((2*pi*frequency2pos) .* T2).^2));
point3 = Mo .* ((T2)./(1+((2*pi*frequency2neg) .* T2).^2));

plot(frequency2pos, point2, 'o')
hold on 
plot(frequency2neg, point3, 'o')
plot(frequency1, point1, 'o')
hold off

%label
title('Three Points')
xlabel('Frequency (Hz)')
ylabel('Signal Magnitude')


subplot(3,2,3)
% plot 2 more points 
frequency3pos = input('Third frequency:');
frequency3neg = -(frequency3pos);

point4 =  Mo .* ((T2)./(1+((2*pi*frequency3pos) .* T2).^2));
point5 = Mo .* ((T2)./(1+((2*pi*frequency3neg) .* T2).^2));

plot(frequency2pos, point2, 'o')
hold on 
plot(frequency2neg, point3, 'o')
plot(frequency1, point1, 'o')
plot(frequency3pos, point4, 'o')
plot(frequency3neg, point5, 'o')
hold off

%label
title('Five Points')
xlabel('Frequency (Hz)')
ylabel('Signal Magnitude')


subplot(3,2,4)
% plot 2 more points 
frequency4pos = input('Fourth frequency:');
frequency4neg = -(frequency4pos);

point6 =  Mo .* ((T2)./(1+((2*pi*frequency4pos) .* T2).^2));
point7 = Mo .* ((T2)./(1+((2*pi*frequency4neg) .* T2).^2));

plot(frequency2pos, point2, 'o')
hold on 
plot(frequency2neg, point3, 'o')
plot(frequency1, point1, 'o')
plot(frequency3pos, point4, 'o')
plot(frequency3neg, point5, 'o')
plot(frequency4pos, point6, 'o')
plot(frequency4neg, point7, 'o')
hold off

%label
title('Seven Points')
xlabel('Frequency (Hz)')
ylabel('Signal Magnitude')


subplot(3,2,[5,6])
% plot points with matching Lorentzian function
frequency = -30:1:30;
omega = 2*pi*frequency;

lor = Mo .* ((T2)./(1+(omega .* T2).^2));
plot(frequency, lor)

hold on 
plot(frequency2pos, point2, 'o')
plot(frequency2neg, point3, 'o')
plot(frequency1, point1, 'o')
plot(frequency3pos, point4, 'o')
plot(frequency3neg, point5, 'o')
plot(frequency4pos, point6, 'o')
plot(frequency4neg, point7, 'o')
hold off

%label
title('Lorentzian Function with Previous Points')
xlabel('Frequency (Hz)')
ylabel('Signal Magnitude')


