% Homework #6b
% function [x,L,U,porder] = ludecomp(A,b)
%
% Performs LU decomposition
% input:
%   A   : (n,n) matrix
%   b   : (n,1) vector
% output:
%   x   : solution (n,1) vector
%   L   : lower triangular matrix
%   U   : upper triangular matrix
%   porder: permutation vector
% comment: (1) Note that this function uses
%   MatLab's convention to return values 
%   of different types or shapes (here, 
%   one vector, two matrices, and another
%   vector).
%   (2) For the LU decomposition, the Lower
%   triangular matrix L has 1's in its diagonals,
%   and the factors a(i,j)/a(j,j), with i>j below
%   the diagonal.
%   The Upper matrix contains the diagonal elements
%   a(j,j), and the matrix coefficients as calculated
%   from the Gauss elimination.
%---------------------------------------

function [x,L,U,porder] = ludecomp(A,b)

%GaussElim
tot=[A,b];
%need together to do stuff easily
[pizza,burger]=size(tot);
%good for iteration defining stuff
U=zeros(pizza,pizza);
L=zeros(pizza,pizza);
perm=[1;2;3;4];
porder =zeros(pizza,pizza);
for i=1:pizza-1
    %Pivot to find largest element
    for k=i+1:pizza   
      if abs(tot(i,i))< abs(tot(k,i))
       temp= tot(i,:); , perm(i)= k;
       temp2= tot(k,:); , perm(k)= i;
       tot(k,:)=temp;
       tot(i,:)=temp2;
      end
    end
  
    for q=1:pizza
        porder(q,perm(q))=1;
    end
        
    %Gaussian Elimination
    for j=i+1:pizza           
        L(j,i)= tot(j,i)/tot(i,i);
        tot(j,i:burger)= tot(j,i:burger)- tot(j,i)/tot(i,i)*tot(i,i:burger);       
    end
end
%Filling an upper triangular for U with solved guasselim
for i=1:pizza
    L(i,i)=1;
    for j=1:pizza
       U(i,j)=tot(i,j);
    end    
end

%backsubstitution
x=zeros(pizza,1);
x(pizza)=tot(pizza,burger)/tot(pizza,(burger-1));
for i=pizza-1 : -1: 1
   x(i)=(tot(i,burger)-(tot(i,i+1:pizza)*x(i+ 1:pizza)))/tot(i,i);
end
disp(x), disp(U), disp(L), disp(porder)
end
