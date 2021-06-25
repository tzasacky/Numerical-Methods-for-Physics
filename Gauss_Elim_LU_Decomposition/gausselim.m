% Homework #6a
% function [x] = gausselim(A,b)
%
% Basic Gauss elimination with pivoting
% input:
%   A   : (n,n) matrix
%   b   : (n,1) vector
% output:
%   x   : solution (n,1) vector
%
% comment: You can implement the pivoting 
% (= searching for largest element in column
% below current diagonal element and exchanging
% rows if necessary) either by directly switching 
% the rows (temp = row_i; row_i = row_j; row_j = temp;),
% or by introducing an order-vector p (with n elements).
% In the latter case, p should be initialized as p(i) = i, for
% i=1...n, and the row indices in your implementation need to
% be appropriately indexed.
%---------------------------------------


function [x] = gausselim(A,b)
tot=[A,b];
%need together to do stuff easily
[pizza,burger]=size(tot);
%good for iteration defining stuff

for i=1:pizza-1
    %Pivot to find largest element
    for k=i+1:pizza   
      if abs(tot(i,i))< abs(tot(k,i))
       temp= tot(i,:);
       temp2= tot(k,:);
       tot(k,:)=temp;
       tot(i,:)=temp2;
      end
    end
    %Gaussian Elimination
    for j=i+1:pizza            
        tot(j,i:burger)= tot(j,i:burger)- tot(j,i)/tot(i,i)*tot(i,i:burger);       
    end
end
% Backsubstitution
x=zeros(pizza,1);
x(pizza)=tot(pizza,burger)/tot(pizza,(burger-1));
for i=pizza-1 : -1: 1
   x(i)=(tot(i,burger)-(tot(i,i+1:pizza)*x(i+ 1:pizza)))/tot(i,i);
end
end

