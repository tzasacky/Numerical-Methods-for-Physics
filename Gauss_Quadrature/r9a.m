% Homework #9a
clc
clear;
close all;
%===================================
% (9a)
%-----------------------------------
nres=[10 1e2 1e3 1e4 1e5];
func= @(x) log(1+x)/x;
j=1;
while j<(length(nres)+1)
    exes=0:1/nres(j):1;
    for i=1:nres(j)
    texas(i)=func(exes(i));
    end
    trap(j)=0;
    third(j)=0;
    treefiddy(j)=0;
    %f(a) uses right side rectangle due to NaN on first subinterval
    trap(j)=texas(2)/nres(j);
    for i=3:nres(j)        
        %trapezoidal
        trap(j)=trap(j)+((texas(i)+texas(i-1))/2)*exes(2);     
    end
    %Simpsons 1/3
    %f(b)+f(a)
    %f(a) uses right side rectangle due to NaN on first interval
    third(j)=(exes(2)/3)*(texas(nres(j))+texas(2));
    %middle terms
    for i=2:2:nres(j)-2
       third(j)=third(j)+(exes(2)/3)*(4*texas(i)+2*texas(i+1));   
    end
    %Simpsons 3/8
    %f(a)+f(b). first interval also rectangle as before
    treefiddy(j)=(3*exes(2)/8)*(texas(nres(j)));
    %middle term summations
    for i=2:3:nres(j)-1
        treefiddy(j)=treefiddy(j)+(3*exes(2)/8)*(3*(texas(i)+texas(i+1)));
    end 
    for i=4:3:nres(j)-2
        treefiddy(j)=treefiddy(j)+(3*exes(2)/8)*(2*texas(i));
    end
    trap(j)=trap(j)+texas(2)*exes(2);
    third(j)=third(j)+texas(2)*exes(2);
    treefiddy(j)=treefiddy(j)+texas(2)*exes(2);
    j=j+1;  
end
k=2;
    while k < (length(nres)+1)
    b(k-1)=log(nres(k));
    traperr(k-1)=trap(k)-trap(k-1);
    thirderr(k-1)=third(k)-third(k-1);
    treefiddyerr(k-1)=treefiddy(k)-treefiddy(k-1);
    k=k+1;
    end
    
hold on  
plot(b,log(abs(traperr)),'or',b,log(abs(thirderr)),'xb',b,log(abs(treefiddyerr)),'.r');
legend('Trapezoidal Method','Simpsons 1/3','Simpsons 3/8')
title('Relative Error')




%==========================================


%==========================================


