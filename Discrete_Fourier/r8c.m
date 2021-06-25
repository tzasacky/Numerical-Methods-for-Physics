% Homework #8c
clc
clear;
close all;
%===================================
% (8c)
%-----------------------------------
N=512;
j=linspace(0,511,512);
f1j=zeros(512,1);
f2j=zeros(512,1);
shift=2*pi*rand;
for i=1:N/2-1
    f1j(i)=sin(2*pi*j(i)*i/N)*(1/i)^2;
    f2j(i)=sin(2*pi*j(i)*i/N + shift)*(1/i)^2;
end
FT1=fft(f1j);
FT2=fft(f2j);
plot(j,f1j,j,f2j)
legend('f1(j)','f2(j)') 
disp('Press Enter to continue...')
pause
F1k=log(abs(FT1));
F2k=log(abs(FT2));
plot(log(j),F1k,'bo', log(j),F2k,'go')
disp('Phase Shift =')
disp(shift)
title('Power Spectra')
legend('without phase shift','phase shifted')
%==========================================


%==========================================


