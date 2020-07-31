%{

This program plots the magnitudes after saturation
recovery and the resulting contrast
relative to gray matter.

%}

Mo = 1;
TR = 0:1:5000;

% get T1 values
prompt1 = 'CSF: ';
csfT1 = input(prompt1);

prompt2 = 'Gray matter: ';
grayT1 = input(prompt2);

prompt3 = 'White matter: ';
whiteT1 = input(prompt3);

prompt4 = 'Fat: ';
fatT1 = input(prompt4);


% equations for signal magnitude using given T1 values
CSF = Mo .* exp(-TR/csfT1);
gray = Mo .* exp(-TR/grayT1);
white = Mo .* exp(-TR/whiteT1);
fat = Mo .* exp(-TR/fatT1);

figure()


subplot(221)

% plot magnitudes
plot(TR, CSF);
hold on 
plot(TR, gray);
plot(TR, white);
plot(TR, fat);
hold off
grid on 
legend('CSF','Gray Matter', 'White Matter', 'Fat')

% plot contrast between gray matter and CSF
subplot(222)
csfcontrast = gray - CSF;
plot(TR, csfcontrast)
hold on
if csfcontrast<=0
    [M,I] = min(csfcontrast); 
else 
    [M,I] = max(csfcontrast) ;
end
plot(I, M, 'o');
hold off
title('Contrast Between Gray Matter and CSF')
grid on 

% plot contrast between gray matter and white matter
subplot(223)
whitecontrast = gray - white;
plot(TR, whitecontrast)
hold on
if whitecontrast<=0
    [M,I] = min(whitecontrast); 
else 
    [M,I] = max(whitecontrast) ;
end
plot(I, M, 'o');
hold off
title('Contrast Between Gray and White Matter')
grid on 

% plot contrast between gray matter and fat
subplot(224)
fatcontrast = gray - fat;
plot(TR, fatcontrast)
hold on
if fatcontrast<=0
    [M,I] = min(fatcontrast); 
else 
    [M,I] = max(fatcontrast) ;
end
plot(I, M, 'o');
hold off
title('Contrast Between Gray Matter and Fat')
grid on 