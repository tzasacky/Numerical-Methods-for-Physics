% Homework #6b
% function [x] = lusolve(L,U,b,porder)
%
% Solving LUx = b via forward and back substitution
% input:
%   L   : (n,n) lower triangular matrix
%   U   : (n,n) upper triangular matrix
%   b   : (n,1) vector
%   porder: (n,1) order (permutation) vector
% output:
%   x   : solution (n,1) vector
%    
%---------------------------------------
% y=Ux--> Ly=b--> plug L answer into b for U--> actual solution
%Why would porder matter?
function [x] = lusolve(L,U,b,porder)
Lsub = [L,porder*b];
[pizza, burger]=size(Lsub);

Lsub = [L,b];

%Substitution (Solve Ly=b where Ux=y)
heels=zeros(pizza,1);
heels(1)= Lsub(1,burger)/Lsub(1,1);
for i= 2:pizza
heels(i)= (Lsub(i,burger)-(Lsub(i,i+1:pizza))*heels(i+1:pizza))/L(i,i);

end
% Backsubstitution
Uback=[U,heels];
x=zeros(pizza,1);
x(pizza)=Uback(pizza,burger)/Uback(pizza,(burger-1));
for i=pizza-1 : -1: 1
   x(i)=(Uback(i,burger)-Uback(i,i+1:pizza)*x(i+1:pizza))/Uback(i,i);
end
disp(x)
end
