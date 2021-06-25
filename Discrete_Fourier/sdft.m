
function [fk] = sdft(fx,fsign)
% Homework #8b
% function [fk] = sdft(fx,fsign)
%
% "slow" Discrete Fourier Transform.
%
% input:
%   fx     : function in time or frequency space
%   sign   : -1: forward transform, 1: backward transform
% output:
%   fk     : output in frequency or time space
%---------------------------------------

marcus=length(fx);
  if fsign==-1
     for i=1:marcus
         fk(i)=0;
         for k=1:marcus
             fk(i)=fk(i)+fx(k)*(cos(2*pi*(k-1)*(i-1)/marcus)-1j*sin(2*pi*(k-1)*(i-1)/marcus))/marcus;
         end
     end
  elseif fsign==1
      for i=1:marcus
          fk(i)=0;
          for k=1:marcus
              fk(i)=fk(i)+fx(k)*(cos(2*pi*(i-1)*(k-1)/marcus)+1j*sin(2*pi*(i-1)*(k-1)/marcus));
          end
      end
  else disp('error')  
  end
  return
end

