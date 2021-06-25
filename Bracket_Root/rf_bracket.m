% Homework #2c
% rf_bracket brackets a root of f if existing,
% by increasing the interval geometrically by fac.
% input: fx    : the inline function
%        xlo   : initial lower bracket
%        xhi   : initial upper bracket
% output:[xlo,xhi,i]: lower and upper bracket, number of tries
%===================================

function [xlo,xhi,iend] = rf_bracket(f,xlo,xhi,tol,iter)
lo=f(xlo);
hi=f(xhi);
for i=1:iter
    if lo*hi==0 
        disp('No Bracketing Needed, endpoint is root')
        iend=1;
        break
    end
    if lo*hi<0
        iend=log((xhi-xlo)/tol)./log(2);
        disp('Required Iterations (round up to nearest integer):')
        disp(iend)
         break
    else
        xlo=xlo-1;
        xhi=xhi+100;
    end
    if i==iter
        disp('No root found between')
        disp(xlo)
        disp(xhi)
        break
    end

end

%===================================

