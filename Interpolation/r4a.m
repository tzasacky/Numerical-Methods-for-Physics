% Homework #4a
% Spline interpolation
clc
clear;
close all;
%===================================
% (4a)
%-----------------------------------

nres = 1000;
xmin = -2.0;
xmax = 2.0;
%xpos = [-2.0,0.0,2.0];
%xpos = [-2.0,-1.0,0.0,1.0,2.0];
%xpos = [-2.0,-1.5,-1.0,0.0,1.0,1.5,2.0];
%xpos = [-2.0,-1.5,-1.0,-0.5,0.0,0.5,1.0,1.5,2.0];
xpos = 4.0*rand(1,6)-2.0;

fx  = @(x) abs(sin(x));

%==========================================

ndeg = size(xpos,2)-1;
fprintf(1,'Interpolating polynomial of %2dth degree\n',ndeg);
dx   = (xmax-xmin)/(nres-1);
xarr = xmin:dx:xmax; % interpolation points
yarr = fx(xarr);     % true function values at interpolation points (for error estimates)
ypos = fx(xpos);     % function values at support points.
ypol = zeros(1,nres);  % the interpolation result for polynomials
ypols= zeros(1,nres);  % the interpolation result for splines

% next line: get the polynomial with MatLab's polyfit routine.
pol  = polyfit(xpos,ypos,(length(xpos)-1));
for i=1:nres % step through xarr and calculate interpolation (see two lines below)
% next line: use MatLab's polyval routine to evaluate polynomial at positions xarr
  ypol(i)   = polyval(pol,xarr(i));
% next line: use MatLab's spline routine to interpolate ypos at postions xarr.
  ypols(i)  = spline(xpos,ypos,xarr(i));
end

% Calculate the root-mean-square error for polynomial and spline interpolation.
% If you don't remember how the rms error is defined, look it up.
c=1;
    summated= 0;
    while c < nres+1
    summated= summated + (yarr(c)-ypol(c))^2;
    c=c+1;
    end
    rmse = sqrt(summated / nres) 
   
    d=1;
    summated2= 0;
    while d < nres+1
    summated= summated + (yarr(d)-ypols(d))^2;
    d=d+1;
    end
    rmses = sqrt(summated / nres) 


% plot everything.
hold all;
fplot(fx,[xmin xmax],'b'); % plot the function
plot(xpos,ypos,'sb'); % plot the function evaluated at support points
plot(xarr,ypol,'+r'); % the polynomial interpolation
plot(xarr,ypols,'--r'); % the spline interpolation
xlabel('x');
ylabel('y');
hold off;


