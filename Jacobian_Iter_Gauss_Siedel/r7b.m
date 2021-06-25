% Homework #7b
% Driver for gaussseidel.m
clc
clear;
close all;
%===================================
% (6b)
%-----------------------------------
tol=1e-4;
% Here go the three matrix definitions

A1=[1.01 0.99; 0.99 1.01];
b1=[2.0;2.0];

A2=[1.5 .5; .5 1.5];
b2=[2.0;2.0];'

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

% For A3, first write down the finite difference
% equations, convert them into a linear system,
% and pay special attention to the points i=1,n.

%==========================================

fprintf(1,'A1*x1 = b1\n');
x1 = gaussseidel(A1,b1,tol);
display(x1);
fprintf(1,'Enter to continue...\n');
pause;
 
fprintf(1,'A2*x2 = b2\n');
x2 = gaussseidel(A2,b2,tol);
display(x2);
fprintf(1,'Enter to continue...\n');
pause;

fprintf(1,'A3*x3 = b3\n');
x3 = gaussseidel(A3,b3,tol);
display(x3);

% plot the results here
% Plot b3 against the support points, 
% and then x3 (the solution). 
% Extra credit: Use MatLab's "\" operator
% to solve A3*x3=b3 and plot the results also.
xthree=A3\b3;
plot(x,b3,x,x3,x,xthree);
legend('b3','x3','x3 using "/" operator')

fprintf(1,'Enter to continue...\n');



fprintf(1,'Enter to continue...\n');
pause;

%==========================================


