%{
This program plots surface graphs 
for weighted T1 and T2 contrast.
%}

Mo = 1;
[TR, TE] = meshgrid(1:1:5000,1:200);

% get T1 and T2 values
prompt1 = 'First T1: ';
T1 = input(prompt1);

prompt2 = 'First T2: ';
T2 = input(prompt2);

prompt3 = 'Second T1: ';
T12 = input(prompt3);

prompt4 = 'Second T2: ';
T22 = input(prompt4);

% equations for magnetizations
M = Mo .*(1-exp(-TR/T1)).* exp(-TE/T2);
M2 = Mo .* (1-exp(-TR/T12)) .* exp(-TE/T22);

% solve for contrast
contrast =  M - M2;

figure()

% plot magnetization
subplot(211)
h = surf(TR, TE, M);
set(h, 'edgecolor', 'none')
xlabel('TR')
ylabel('TE')
zlabel('Magnetization')
colormap hsv
colorbar
rotate3d on;

% plot contrast
subplot(212)
g = surf(TR, TE, contrast);
set(g, 'edgecolor', 'none')
xlabel('TR')
ylabel('TE')
zlabel('Contrast')
colormap hsv
colorbar
rotate3d on;