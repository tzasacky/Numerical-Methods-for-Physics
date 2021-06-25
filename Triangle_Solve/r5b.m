% Homework #5b
% triangular solver
clc
clear;
close all;
%===================================
% (5b)
%-----------------------------------
UpLo = 2; % [1=up 2=lo]
tol=1e-6;
%M = [9 0 0; -4 2 0; 5 0 1];
M=[1 0 5; 0 2 -4; 0 0 9];

% Define right-hand side vector
%b = [8;1;4];
b=[4;1;8];

x = triangleSolve(M,b,UpLo,tol);

disp(x)
% Test algorithm using 100x100

x = triangleSolve(M,b,UpLo,tol);

% Display a measure of the difference between the expected 
% and actual results:
sqrt(sum((1 - 1).^2))

