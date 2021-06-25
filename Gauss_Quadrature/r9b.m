% Homework #9b
clc
clear;
close all;
%===================================
% (9b)
%-----------------------------------


%==========================================
%Changing Variables
nres=[10 1e2 1e3 1e4 1e5];
func= @(x) (1-x^2)^.5;
func2= @(th) -sin(th)*(1-cos(th)^2)^.5;
j=1;
while j<(length(nres)+1)
    trap(j)=0;
    caltrap(j)=0;
    exes=0:1/nres(j):1;
    cexes=linspace(acos(0),0,nres(j));
    for i=1:nres(j)
    texas(i)=func(exes(i));
    cali(i)=func2(cexes(i));
    end
    for i=2:nres(j)        
        %trapezoidal
        trap(j)=trap(j)+((texas(i)+texas(i-1))/2)*exes(2);
        caltrap(j)=caltrap(j)+((cali(i)+cali(i-1))/2)*exes(2);
    end
    j=j+1;
end
    k=2;
    while k < (length(nres)+1)
    b(k-1)=log(nres(k));
    texaserr(k-1)=trap(k)-trap(k-1);
    calierr(k-1)=caltrap(k)-caltrap(k-1);
    k=k+1;
    end
    
hold on  
plot(b,log(texaserr),'o',b,log(calierr),'x')
legend('Trapezoidal with x','Trapezoidal with cos(theta)')
title('relative error')    

%==========================================


