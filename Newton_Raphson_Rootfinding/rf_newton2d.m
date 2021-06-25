% Homework #3b
% Function rf_newton2d(x0,tol,iter)
% Given an initial guess x0, finds a local 
% root.
% input:
% f     : inline function
% x0    : starting point
% tol   : tolerance (absolute)
% iter  : maximum number of iterations. 
% output: rootf, the root
%         iend, the number of iterations used.
%===================================


function [rootf,iend] = rf_newton2d(x0,tol,iter)
nloop=iter;
for i=1:iter
x=x0
f= newtfunc(x)
mat= newtijac(x)
dx= f*mat
    if f(1)> tol
        guess=x0-dx
    else
        iend=nloop;
        disp(iend)
        rootf=x;
        break
    end
   if i==iter
       disp('No Root Found')
       break
   end
end    
end

%===================================

% returns the function value (2-element vector)
function f = newtfunc(x)
    f1= x(1)^3-3*x(1)^2*x(2)+x(1)*x(2);
    f2=3*x(1)^2*x(2)-x(2)^3';
f=[f1,f2];
end

% returns the inverse of the Jacobian (2x2 matrix)
function mat = newtijac(x)
    Broncos= 3*(x(1)^2-x(2)^2);
    Superbowl= 3*x(1)^2-x(1);
    Panthers= -6*x(1)*x(2);
    Superlame= 3*x(1)^2-6*x(1)*x(2)+x(2);
mat= [Broncos, Superbowl; Panthers, Superlame];

end

