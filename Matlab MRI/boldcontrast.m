% function of TE
TE = 0:1:500;

%constant
Mo = 1;

% get input for first signal
disp('First Signal')
T21 = input('What T2 value: ');
T21bchi = input('What T2(Bo, Delta Chi): ');

% get input for second signal
disp('Second Signal')
T22 = input('What T2 value: ');
T22bchi = input('What T2(Bo, Delta Chi): ');

% calculate T2star using user input
T2star1 = ((1/T21) + (1/T21bchi)).^(-1);
T2star2 = ((1/T22) + (1/T22bchi)).^(-1);

% equations for magnitudes
M1 = Mo .* exp(-TE/T2star1);  %first signal
M2 = Mo .* exp(-TE/T2star2);  %second signal

% calculate contrast
contrast = M1 - M2;

% plot contrast
figure()
plot(TE, contrast)

% show max or min
hold on
if contrast<=0
    [M,I] = min(contrast); 
else 
    [M,I] = max(contrast) ;
end
plot(I, M, 'o');
hold off

% label graph
xlabel('TE')
ylabel('Contrast')
title('BOLD Contrast')
grid on


