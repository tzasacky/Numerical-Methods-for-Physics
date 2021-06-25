% Homework #8b
clc
clear;
close all;
%===================================
% (8b)
%-----------------------------------


%==========================================

j=linspace(0,127,128);
fj= sin(4.*pi.*j./128);
fft=fft(fj);
plot(j,fj)
hold on
fourier=sdft(fj,-1);
ifourier=sdft(fourier,1);
plot(j,ifourier)
legend('original function', 'Inverse FT of FT')
hold off
disp('Press Enter to continue...')
pause 

plot(j,abs(fourier),'b-o')
legend('Spectrum')

