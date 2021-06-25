% Homework #3b
% 2D Newton-Raphson (no fancy stuff)
%===================================
% (3b)

clc
clear;
close all;

%-----------------------------------

iter   = 100
tol    = 1e-6;
x0     = [1.01,.01]  % initial guess




[rootf,iend] = rf_newton2d(x0,tol,iter);
fprintf(1,'r3b: iend=%4d, r(1)=%22.14e, r(2)=%22.14e\n',...
        iend,rootf(1),rootf(2));

%===================================
