% Homework #2b 2c
% For scripts (not for functions) keep the next three lines.
clc
clear;
close all;
%===================================
% (2b)

iter  = 100;   % maximum number of iterations
tol   = 1e-12;  % tolerance
xlo   = 0.0;    % lower bracket
xhi   = 1.0;    % upper bracket
f1x   = inline('3.*x+sin(x)-exp(x)');
f2x   = inline('x.^3');
f3x   = inline('sin(1.0/(x+0.01))');
f4x   = inline('1.0/(x-0.5)');
f     = f1x;

%Bisection Method Normally fails on 3 of 4 of these. Must address issues.
%------------------------------------

rootf = 0.0;    % the root
iend  = 0.0;    % number of iterations used

% plot the requested function f here (you can use MATLAB's fplot routine):
fplot(f,[0,1])
%This spits out completely incorrect graph for 3 out of 4. WHY????
% The next line is for (2c). Comment this out while you are working on (2b). 
% It calls a function rf_bracket, attempting to find an interval that brackets the root of f.

[xlo,xhi,iend] = rf_bracket(f,xlo,xhi,tol,iter);

% The next line is for (2b). Note that the function returns two values: the actual solution rootf, 
% and the number of iterations used iend. As arguments, it takes the function f, the starting interval
% [xlo,xhi], the tolerance tol, and the maximum number of iterations. 

[rootf,iend]   = rf_bisect(f,xlo,xhi,tol,iter);

fprintf(1,'rf_bisect found root = %23.15e after %5d iterations.\n',...
        rootf,iend);
  
%===================================

