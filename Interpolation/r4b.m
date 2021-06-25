% Homework #4b
% bilinear interpolation
clc
clear;
close all;
%===================================
% (4b)
%-----------------------------------

nres = [4 8 16 32 64 128]; % the grid resolutions
nrand= 100; % the number of random points along x and y to be interpolated (total of 10000 points)
xmin = -0.5*pi; % extent of grid
xmax =  0.5*pi;

f = @(r) (cos(r).^2); % this is the function to be interpolated

%==========================================

niter  = size(nres,2);   % number of resolution steps
rmse   = zeros(niter,2); % the root-mean-square error: 1 for nearest, 2 for linear
fint   = zeros(nrand,2); % the interpolated function values: 1 for nearest, 2 for linear
fpos   = zeros(nrand,1); % the true function values, needed to calculate rmse
%changed 1 in fpos to 2 so that subtraction dim wouldn't disagree (kept columns identical) 
xpos = (xmax-xmin)*rand(nrand,1)+xmin; % random positions for x
ypos = (xmax-xmin)*rand(nrand,1)+xmin; % random positions for y

% Loop through the resolution
for n=1:niter
    
    % (1) generate the data points in x and y
    dx= (xmax-xmin)/(nres(n)-1);
    x = xmin:dx:xmax;
    y = x;
    % (2) generate the 2D function using f above [hint: f = (cos(sqrt(x^2+y^2)))^2 ]
    
    f2= @(x,y) cos(sqrt(x.^2+y.^2)).^2;
    
    
    % (3) for error assessment, generate the function values at the random locations [xpos,ypos]
    fpos(:,1) = f2(xpos,ypos);
    fpos(:,2) = fpos(:,1);
    
    % (4) call your interpolation routine interpol2d twice, once for nearest neighbor, once for
    %     linear interpolation
    fint(:,1) = interpol2d(x,y,f,xpos,ypos,dx,xmin,0);
    fint(:,2) = interpol2d(x,y,f,xpos,ypos,dx,xmin,1);
    % (5) determine the root-mean-square error for each interpolation method (and resolution)
    %while for summation
    c=1;
    summated= [0,0];
    while c < (length(xpos)+1)
    summated= summated + (fpos(c,:)-fint(c,:)).^2;
    c=c+1;
    end
    rmse(n,:) = sqrt(summated ./ length(xpos)) ;
  
  
    fprintf(1,'r4b: rmse(%2d) = %13.5e at nres = %5d\n',n,rmse(n),nres(n));
end

% just take the log2 of rmse and nres: easier diagnostics
for l=1:2
  rmse(:,l) = log2(rmse(:,l)/rmse(1,l));
end
nres  = log2(nres/nres(1));

%---------------------------------------
hold all;
for l=1:2
  plot(nres,rmse(:,l));grid on;
end
xlabel('log2 nres');
ylabel('log2 rms error');
hold off;

