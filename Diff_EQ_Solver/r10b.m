% Homework #10b
% Driver for ode_fixedstep
clc
clear;
close all;
%===================================
% (10b)
%-----------------------------------

nstep =[1e1 1e2 1e3 1e4] ;
   % number of steps (array so that all can be done together)
iinteg= [0 1 2];    % type of integrator 
%made iinteg an array so that all types can be done at once
x0    = 0.0;  % starting x.
y0    = -1.0; % starting y.
x1    = 3.0;  % end x.
fxy   = @(x,y) (-2*x-y); % the function.

answer = @(x) (-3*exp(-x)-2*x+2); 
%==========================================
%first for loop: each method
%second for loop: each step size
%third for loop: defines rms error at step size and method
for j=1:length(iinteg)   
    for i=1:length(nstep)
        [x,y] = ode_fixedstep(nstep(i),fxy,x0,y0,x1,iinteg(j));
        %Make an error sum
        errsquared=0;
        for k=1:length(y)
            errsquared=errsquared+((y(k)-answer(x(k)))/answer(x(k))).^2;
        end
        erms(j,i)= (errsquared/nstep(i)).^(1/2); 
    end
end
%plotting the errors by step size and by method
%errors are also displayed so that you can see them
%I'm not putting them in a separate document because this should be adequate
hold on 
plot(log(nstep),log(erms(1,:)),log(nstep),log(erms(2,:)),log(nstep),log(erms(3,:)))
legend('Euler Method','RK2','RK4')
title('RMS Error of fixed step ODE methods')
ylabel('log(RMS Error)')
xlabel('Number of fixed steps')

%==========================================


