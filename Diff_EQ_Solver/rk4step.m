% Homework #10
% function y = rk4step(y,f,x,h)
%
% Advancing solution by one single RK4 step.
%
% input:
%   y      : initial y value, scalar
%   f      : inline function (RHS of ODE)
%   x      : starting x.
%   h      : stepsize
% output:
%   y      : updated result
%---------------------------------------

function [y] = rk4step(y0,f,x,h)

%k1-4
k1=f(x,y0);
k2=f(x+(h/2),y0+k1*(h/2));
k3=f(x+(h/2),y0+k2*(h/2));
k4=f(x+h,y0+k3*h);
%actual step function (grouped terms)
%Classical Fourth-Order RK
y=y0+(h/6)*(k1+k4+2*k2+2*k3);

  return
end
