%{

This program plots the magnitudes and
contrast by weighting T1 and T2 values.

%}

Mo = 1;
TR = 0:1:5000;

% get T1 values
prompt1 = 'T1 for CSF: ';
csfT1 = input(prompt1);

prompt2 = 'T1 for Gray matter: ';
grayT1 = input(prompt2);

prompt3 = 'T1 for White matter: ';
whiteT1 = input(prompt3);

prompt4 = 'T1 for Fat: ';
fatT1 = input(prompt4);

% get T2 values
prompt5 = 'T2 for CSF: ';
csfT2 = input(prompt5);

prompt6 = 'T2 for Gray matter: ';
grayT2 = input(prompt6);

prompt7 = 'T2 for White matter: ';
whiteT2 = input(prompt7);

prompt8 = 'T2 for Fat: ';
fatT2 = input(prompt8);

% get TE value
prompt9 = 'TE: ';
TE = input(prompt9);


% equations for magnitude with each T1 and T2 value
CSF = Mo .*(1-exp(-TR/csfT1)).* exp(-TE/csfT2);
gray = Mo .* (1-exp(-TR/grayT1)).* exp(-TE/grayT2);
white = Mo .* (1-exp(-TR/whiteT1)).* exp(-TE/whiteT2);
fat = Mo .*(1-exp(-TR/fatT1)).* exp(-TE/fatT2);


figure()

% plot magnitude
subplot(221)
plot(TR, CSF);
hold on 
plot(TR, gray);
plot(TR, white);
plot(TR, fat);
hold off
title('Weighted Imaging');
grid on 

% plot contrast between gray matter and csf
subplot(222)
csfcontrast = gray - CSF;
plot(TR, csfcontrast)
title('Contrast Between Gray Matter and CSF')
hold on
if csfcontrast<=0
    [M,I] = min(csfcontrast); 
else 
    [M,I] = max(csfcontrast) ;
end
plot(I, M, 'o');
hold off
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