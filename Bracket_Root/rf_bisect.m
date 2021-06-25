% Homework #2b
% Function rf_bisect(f,xlo,xhi,tol,iter)
% finding a single root bracketed by [xlo,xhi].
% input:
% f     : inline function
% xlo   : lower bracket
% xhi   : upper bracket
% tol   : tolerance (absolute)
% iter  : maximum number of iterations. 
% output: rootf, the root
%         iend, the number of iterations used.
%===================================

function [rootf,iend] = rf_bisect(f,xlo,xhi,tol,iter)
flo = f(xlo);
fhi = f(xhi);
for i=1:iter
   guess=((xhi+xlo)/2);
   T=((xhi-xlo)/2) ;
   go = f(guess);
    if (go==0) 
       rootf=guess;
       iend=i;
       break
    end
    if (flo==0) 
       iend=i;
       rootf=xlo;
       break
    end
    if (fhi==0) ;
       iend=i;
       rootf=xhi;
       break
    end
   if flo*go < 0;
       xhi=guess;
   else
       xlo=guess;
   end
   if i==iter;
       iend=-1;
       rootf='No root found in max iterations';
        break
   end
   if T<tol
       if abs(go)<.01
       rootf=(guess);
       iend=i;
       break
       else
       iend=-1;
       rootf='DNE'
       break
       %I can't figure out why it's still spitting out a root
       end
   end
end

%===================================

