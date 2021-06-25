% Homework #2d
% Function Plotting Script Template
% For scripts (not for functions) keep the next three lines.
clc
clear;
close all;
%===================================
% (2d)

iter  = 1000;   % maximum number of iterations
tol   = 1e-15;  % tolerance
xlo   = 0.0;   % lower bracket
xhi   = 1.0;    % upper bracket
f1x   = inline('3.*x+sin(x)-exp(x)');
f2x   = inline('x.^3');
f3x   = inline('sin(1.0/(x+0.01))');
f4x   = inline('1.0/(x-0.5)');
f     = f1x;

%------------------------------------

rootf   = 0.0;    % the root
iend    = 0.0;    % number of iterations used
xmidarr = zeros(1,iter);
fmidarr = zeros(1,iter);
iterarr = zeros(1,iter);

subplot(2,1,1);
% next line: first plot the function

% next line: rf_bracket
[xlo,xhi,iend] = rf_bracket(f,xlo,xhi,tol,iter);

% next line: your modified rf_bisec, returning the diagnostic values
bisection(f,xlo,xhi,tol,iter)
fprintf(1,'rf_bisect found root = %23.15e after %5d iterations.\n',...
        rootf,iend);

% next line(s): plot the sequence of points


% next line(s) plot the error
subplot(2,1,2);

  
%===================================

