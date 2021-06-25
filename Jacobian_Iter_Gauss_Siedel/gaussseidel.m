% Homework #7b
% function [x] = gaussseidel(A,b,tol)
%
% Solving a system of linear equations 
% via Gauss-Seidel iteration.
%
% The function tests whether the input
% matrix A is row diagonal dominant.
% input:
%   A   : (n,n) matrix
%   b   : (n,1) vector
%   tol : tolerance for convergence
% output:
%   x   : solution (n,1) vector
% Comment: The tolerance condition should
%   be implemented as |x_{old}-x_{new}|
%---------------------------------------

function [x] = gaussseidel(A,b,tol)
[wilson,kenan]=size(A);
if wilson~=kenan
    disp('error, matrix not square')
end
x=zeros(wilson,1);
%fills x with first guess
    for j=2:wilson
        x(j,1)=b(j,1)/A(j,j);
    end
%max= max iterations
max=100000;
x_old=x;
x_new=zeros(wilson,1);
    for i=1:max       
        if and(i~=1,norm(x_new-x_old)<tol)
            disp(x)
            iter=i;
            disp(iter)
            break
        elseif i==max
            disp('No solution within max iterations')
            break
        else
        x_old=x;
            for j=1:wilson
                x(j,1)= (b(j,1)-A(j,1:j-1)*x(1:j-1,1)-A(j,j+1:wilson)*x(j+1:wilson,1))/A(j,j);
            end
        x_new=x;
        end
    end        
  return
end
