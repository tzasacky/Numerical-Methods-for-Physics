% Homework #5a
% function  w = matMul(A,v);
%
% 
% input:
%   A: matrix of coefficients
%   v: vector
% output: 
%   w: Output Matrix
%---------------------------------------

function w = matMul(A,v)

  Adim = size(A);
  vlength = length(v);
  
  if Adim(2) == vlength
      w=zeros(Adim(2),1);
      n=1;
      while n < (vlength+1);
         B(:,n)= A(:,n).* v(n);
         n=n+1;
      end
      m=1;
      while m < (vlength+1)
          w(:,1)= w(:,1)+B(:,m);
          m=m+1;
      end       
  else 
      disp('error, dimensions must match')
  end
end
