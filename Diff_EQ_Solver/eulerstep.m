% Homework #10a
% function y = eulerstep(y,f,x,h)
%
% Advancing solution by one single Euler step.
%
% input:
%   y      : initial y value, scalar
%   f      : inline function (RHS of ODE)
%   x      : starting x.
%   h      : stepsize
% output:
%   y      : updated result
%---------------------------------------
function y = eulerstep(y,f,x,h)
y=y+f(x,y)*h;
  return
end
