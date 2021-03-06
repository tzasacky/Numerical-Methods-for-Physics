% Homework #10a
% function [x,y] = ode_fixedstep(nstep,f,x0,y0,x1,iinteg)
%
% Solving an ordinary differential equation
% using fixed step size.
%
% input:
%   nstep  : number of steps
%   f      : inline function (RHS of ODE)
%   x0     : starting x.
%   y0     : starting y (scalar).
%   x1     : end x.
%   iinteg : integrator: 0: Euler
%                        1: Runge-Kutta 2nd order
%                        2: Runge-Kutta 4th order
% output:
%   x      : positions of n+1 steps (we'll need this for
%            consistency with adaptive step size integrators later)
%   y      : (nstep+1,1) vector of resulting y's
%
% comment  : Determine dx from the given stepsize and the integration
%            boundaries. Then use MatLab's switch statement to choose
%            between the integrators. The integrators you will have to
%            provide through functions eulerstep, rk2step, rk4step.
%            Each of them does just one single step.
%---------------------------------------

function [x,y] = ode_fixedstep(nstep,f,x0,y0,x1,iinteg)
%Creating x, y 
  y=zeros(nstep+1,1);
  y(1)=y0;
  h=(x1-x0)/nstep;
  x=x0:h:x1;
  %using switch to call solver routine based on iinteg
  %adding nstep as input to all 
  switch iinteg
      case 0
          for i=1:nstep
             y(i+1)=eulerstep(y(i),f,x(i),h);  
          end
      case 1
          for i=1:nstep
            y(i+1)=rk2step(y(i),f,x(i),h);  
          end
      case 2 
         for i=1:nstep
            y(i+1)=rk4step(y(i),f,x(i),h);            
         end
  end

  return
end
