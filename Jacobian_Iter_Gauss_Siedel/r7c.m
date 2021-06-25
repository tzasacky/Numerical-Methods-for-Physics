% Homework #7c
% Driver for gausselim.m
clc
clear;
close all;
%===================================
% (6c)
%-----------------------------------

% setting up A3: Poisson equation
%making the a3 matrix and b3 rhs
x=linspace(0,2*pi,100);
b3=zeros(100,1);
A3=zeros(100,100);
%Make periodic boundary conditions
A3(1,1)=-2*(50/pi)^2;
A3(1,2)=(50/pi)^2;
A3(1,100)=(50/pi)^2;
A3(100,100)=-2*(50/pi)^2;
A3(100,99)=(50/pi)^2;
A3(100,1)=(50/pi)^2;
%fill b3,A3
for j=1:100
    b3(j,1)=-4*pi*sin(x(1,j));
end
for i=2:99
    A3(i,i)=-2*(50/pi)^2;
    A3(i,i+1)=(50/pi)^2;
    A3(i,i-1)=(50/pi)^2;
end

%==========================================

fprintf(1,'A3*x3 = b3\n');
x3 = gausselim(A3,b3);
display(x3);

% plot your results here:
% Plot b3 against the support points, 
% and then x3 (the solution). 
% Extra credit: Use MatLab's "\" operator
% to solve A3*x3=b3 and plot the results also.
xthree=A3\b3;
plot(x,b3,x,x3,x,xthree);
legend('b3','x3 using gausselim.m','x3 using "/" operator')

fprintf(1,'Enter to continue...\n');
pause;

%==========================================


