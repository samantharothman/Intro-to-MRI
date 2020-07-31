Mo = 1;
TE = 0:1:200;

% get T2 values
prompt1 = 'CSF: ';
csfT2 = input(prompt1);

prompt2 = 'Gray matter: ';
grayT2 = input(prompt2);

prompt3 = 'White matter: ';
whiteT2 = input(prompt3);

prompt4 = 'Fat: ';
fatT2 = input(prompt4);

% equations for signal magnitude using given T2 values
CSF = Mo .* exp(-TE/csfT2);
gray = Mo .* exp(-TE/grayT2);
white = Mo .* exp(-TE/whiteT2);
fat = Mo .* exp(-TE/fatT2);

figure()

% plot magnitudes
subplot(221)
plot(TE, CSF);
hold on 
plot(TE, gray);
plot(TE, white);
plot(TE, fat);
hold off
grid on 

legend('CSF','Gray Matter', 'White Matter', 'Fat')

% plot contrast between gray matter and CSF
subplot(222)
csfcontrast = gray - CSF;
plot(TE, csfcontrast)
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
plot(TE, whitecontrast)
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
plot(TE, fatcontrast)
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