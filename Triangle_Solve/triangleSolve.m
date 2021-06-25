% Homework #5b
% function  v = triangleSolve(M,b,UpLo,tol);
%
% 
% input:
%   M: matrix of coefficients
%   b: right-hand side
%   UpLo: Upper- or lower-triangular switch
%   tol: tolerance
% output:
%   v: solutions
%---------------------------------------

function v = triangleSolve(M,b,UpLo,tol);
  v=zeros(length(b),1);
  k=1;
  pizza=1;
  while k < length(b)
      pizza = pizza*M(k,k);
      k=k+1;
  end
  if UpLo == 1
     for i= 1:length(b)
         %defines substitution
         v(i)= b(i)/M(i,i);
         %corrects b(i) to substituted form one column reduction at a time
         b(i+1:length(b))= b(i+1:length(b))-(M(i+1:length(b),i)*(b(i)/L(i));
     end
  elseif UpLo == 2
      v(length(b)
      for i= length(b)-1:-1:1
         %defines substitution
         v(i)= b(i)/M(i,i);
         %corrects b(i) to substituted form one column reduction at a time
         b(i+1:length(b))= b(i+1:length(b))-(M(i+1:length(b),i)*v(i));
      end
  elseif pizza < tol 
      disp('Error')
  else 
      disp('Error, matrix must be triangular')
  end
end

