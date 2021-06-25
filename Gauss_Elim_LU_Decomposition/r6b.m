% Homework #6b
% Driver for ludecomp.m and lusolve.m
clc
clear;
close all;
%===================================
% (5b)
%-----------------------------------

%As in r5a, here you need to define your matrices and vectors.
A1 = [4 -2 1; -3 -1 4; 1 -1 3];
b1 = [15; 8; 13];
A2 = [0 2 0 1; 2 2 3 2; 4 -3 0 1; 6 1 -6 -5];
b2 = [0; -2; -7; 6];
A3 = [1.01 0.99; 0.99 1.01];
b3 = [2.0; 2.0];

%==========================================
% Easiest way to check the results is
% to use "display", e.g. "display(L*U)"
% and "display(A)" should give the same
% result, if A=LU...
%I can't figure out how to use porder to get the right result
%
fprintf(1,'LU decomposition of A1');
[x,L,U,porder] = ludecomp(A1,b1);
x = lusolve(L,U,b1,porder);

fprintf(1,'Enter to continue...\n');
pause;

fprintf(1,'LU decomposition of A2');
[x,L,U,porder] = ludecomp(A2,b2);
x = lusolve(L,U,b2,porder);


%==========================================


