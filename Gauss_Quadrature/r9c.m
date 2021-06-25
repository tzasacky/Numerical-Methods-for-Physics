% Homework #9c
clc
clear;
close all;
%===================================
% (9c)
%-----------------------------------
%Gaussian Quadrature
n=[5 10 15 20 25 30 35 40 45 50];
k=[5 6 7 8 9 10 11 12 13 14];
load('ptsandweights.mat')
%create function for xvals and weights

func= @(x,k) sin(k*x)^2;
%This'll be messy, I'm having trouble making it neat
%Integrals n free k constant at 5
nint=zeros(1,10);
kint=zeros(1,10);
%1/2 multiplier since it's symmetric and only over 0 to +inf
for i=1:5
nint(1)=nint(1)+(1/2)*func(xval5(i),5)*weight5(i);
end
for i=1:10
nint(2)=nint(2)+(1/2)*func(xval10(i),5)*weight10(i);
end
for i=1:15
nint(3)=nint(3)+(1/2)*func(xval15(i),5)*weight15(i);
end
for i=1:20
nint(4)=nint(4)+(1/2)*func(xval20(i),5)*weight20(i);
end
for i=1:25
nint(5)=nint(5)+(1/2)*func(xval25(i),5)*weight25(i);
end
for i=1:30
nint(6)=nint(6)+(1/2)*func(xval30(i),5)*weight30(i);
end
for i=1:35
nint(7)=nint(7)+(1/2)*func(xval35(i),5)*weight35(i);
end
for i=1:40
nint(8)=nint(8)+(1/2)*func(xval40(i),5)*weight40(i);
end
for i=1:45
nint(9)=nint(9)+(1/2)*func(xval45(i),5)*weight45(i);
end
for i=1:50
nint(10)=nint(10)+(1/2)*func(xval50(i),5)*weight50(i);
end
%integrals k free n constant at 5
for i=1:5
kint(1)=kint(1)+(1/2)*func(xval5(i),5)*weight5(i);
kint(2)=kint(2)+(1/2)*func(xval5(i),6)*weight5(i);
kint(3)=kint(3)+(1/2)*func(xval5(i),7)*weight5(i);
kint(4)=kint(4)+(1/2)*func(xval5(i),8)*weight5(i);
kint(5)=kint(5)+(1/2)*func(xval5(i),9)*weight5(i);
kint(6)=kint(6)+(1/2)*func(xval5(i),10)*weight5(i);
kint(7)=kint(7)+(1/2)*func(xval5(i),11)*weight5(i);
kint(8)=kint(8)+(1/2)*func(xval5(i),12)*weight5(i);
kint(9)=kint(9)+(1/2)*func(xval5(i),13)*weight5(i);
kint(10)=kint(10)+(1/2)*func(xval5(i),14)*weight5(i);
end    
plot(n,nint)
ylabel('Integral Value')
xlabel('Number of Points and Weights used')
disp('Press enter for second plot')
legend('k=5')
pause
plot(k,kint)
ylabel('Integral Value')
xlabel('k-value used for sin^2(kx)')
legend('n=5')

%==========================================

%==========================================


