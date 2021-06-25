% Homework #6a
% Driver for gausselim.m
clc
clear;
close all;
%===================================
% (5a)
%-----------------------------------

% Here you need to define the three 
% matrices A1...A3, and the three
% column (!) vectors b1...b3.
% If the column elements of b are b1,b2,b3, 
% the definition of a column vector is 
% b = [b1; b2; b3];
% The matrix A is defined by
% A = [a11 a12 a13; a21 a22 a23; a31 a32 a33];
A1 = [4 -2 1; -3 -1 4; 1 -1 3];
b1 = [15; 8; 13];
A2 = [0 2 0 1; 2 2 3 2; 4 -3 0 1; 6 1 -6 -5];
b2 = [0; -2; -7; 6];
A3 = [1.01 0.99; 0.99 1.01];
b3 = [2.0; 2.0];
a=[1 2 -1; 2 1 1; 1 -1 2];
b=[4; 2; -2];
%b3=[1.98; 2.02] gives x1=0 x2= 2
%I don't see a reason to explain. x2 equaling two is enough
%to explain the RHS so x1 is unnecesarry and therefore ==0
%[4 -2 1; -3 -1 4; 1 -1 3],[15; 8; 13]
%==========================================
% Change the code below if you want to do
% additional tests etc.

fprintf(1,'A1*x1 = b1\n');
x1 = gausselim(a,b);
disp(x1);
fprintf(1,'Enter to continue...\n');
pause;
 
fprintf(1,'A2*x2 = b2\n');
x2 = gausselim(A2,b2);
disp(x2);
fprintf(1,'Enter to continue...\n');
pause;

fprintf(1,'A3*x3 = b3\n');
x3 = gausselim(A3,b3);
disp(x3);
fprintf(1,'Enter to continue...\n');
pause;

%==========================================


