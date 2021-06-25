% Homework #4b
% function  fint = interpol2d(xarr,yarr,fmap,xpos,ypos,iord);
%
% nearest neighbor and bilinear interpolation function
% input:
%   xarr: 1d-array of x-values (no y input since x&y are same
%   f: function to be interpolated
%   dx: distance between gridpoints in x and y
%   xmin: needed for my nearest neighbor method
%   xpos: x positions to be interpolated
%   ypos: y positions to be interpolated
%   iord: 0: nearest cell ("constant states"), 1: linear
% output:
%   fint: interpolated function values
% COMMENT: this argument list is a suggestion 
%---------------------------------------

%Easiest way to call positions on grid: Make a vector for x positions, and
%another one for y posititons. This lets you call any position
%nres, xmax, xmin, dx= (xmax-xmin)/(nres-1) , x=xmin:dx:xmax, y=x
% can call x(2) and y(3) for example 
%Finding location: (( xpos / dx) +1) = xlo
%Finding closest: xpos/dx +1 = xind
%(xind-xlo) < .5 == closer to left, else closer to right


function fint = interpol2d(x,y,f,xpos,ypos,dx,xmin,iord)
 %makes everything positive
    xind=xpos-xmin;
    yind=ypos-xmin;
if iord == 0 
    %this works because x's and y's were modified to be positive only
    %rounds pos to pos of nearest neighbor
    broncos = x(round((xind/dx)+1));
    peyton  = y(round((yind/dx)+1));  
    superbowl = sqrt(broncos.^2+peyton.^2);
    %interpolation 
    fint = f(superbowl); 
   
elseif iord == 1
    a=1;
    while a < (length(xpos)+1)
    %Call Surrounding Points
    xhi  = x(ceil((xind(a)/dx)+1));
    yhi  = y(ceil((yind(a)/dx)+1));  
    xlo  = x(floor((xind(a)/dx)+1));
    ylo  = y(floor((yind(a)/dx)+1));  
    %Surrounding Point Value Assignment
    flolo  = f(sqrt(xlo.^2+ylo.^2)); 
    flohi  = f(sqrt(xlo.^2+yhi.^2));
    fhilo  = f(sqrt(xhi.^2+ylo.^2));
    fhihi  = f(sqrt(xhi.^2+yhi.^2));
    %While loop to interpolate
    %Bilinear Function (x,y) are taken
    fint(a)=(1./((xhi-xlo).*(yhi-ylo))).*(flolo.*(xhi-xpos(a)).*(yhi-ypos(a)))+ ((fhilo).*(xpos(a)-xlo).*(yhi-ypos(a)))+((flohi).*(xhi-xpos(a)).*(ypos(a)-yhi))+((fhihi).*(xhi-xpos(a)).*(yhi-ypos(a)));
    a=a+1;
    end
else 
    disp('Error, interpolation of this order not supported in current release')
end
end

