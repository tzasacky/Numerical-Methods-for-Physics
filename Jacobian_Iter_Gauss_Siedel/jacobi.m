% Homework #7a
% function [x] = jacobi(A,b,tol)
%
% Solving a system of linear equations 
% via Jacobi iteration.
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
%   be implemented as |x_{old}-x_{new}|.
%---------------------------------------

function [x] = jacobi(A,b,tol)
[wilson,kenan]=size(A);
if wilson~=kenan
    disp('error, matrix not square')
end
x=zeros(wilson,1);
    for j=1:wilson
        x(j,1)=b(j,1)/A(j,j);
    end
%max= max iterations
max=100000;
x_old=x;
x_new=zeros(wilson,1);
    for i=1:max       
        if norm(x_new-x_old)<tol
            x=x_new;
            disp(x)
            iter=i;
            disp(iter)
            break
        elseif i==max
            disp('No solution within max iterations')
            break
        else
        x_old=x_new;
            for j=1:wilson
                x_new(j,1)= (b(j,1)-A(j,1:j-1)*x_old(1:j-1,1)-A(j,j+1:wilson)*x_old(j+1:wilson,1))/A(j,j);
            end
        end
    end
  return
end
