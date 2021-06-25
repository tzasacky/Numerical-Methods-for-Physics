% Homework #10
% function y = rk2step(y,f,x,h)
%
% Advancing solution by one single RK2 step.
%
% input:
%   y      : initial y value, scalar
%   f      : inline function (RHS of ODE)
%   x      : starting x.
%   h      : stepsize
% output:
%   y      : updated step
%---------------------------------------

function y = rk2step(y0,f,x,h)
  %Modified Euler RK2 steps (wasn't specified which way to do it in HW)
  k1=f(x,y0);
  k2=f(x+(2/3)*h,y0+(2/3)*k1*h);
  
  y=y0+(k1/4+3*k2/4)*h;
  return
end
