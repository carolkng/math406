%The TRAPEZIUM ROUTINE
%From https://www.math.ubc.ca/~peirce/Trapez.m
function [h0, val]=trapez(f,a,b,oval,N)
if (N == 1)
  val=0.5*(b-a)*(feval(f,a)+feval(f,b));
  h0=(b-a);
else
  i=2^(N-2);
  h=(b-a)/i;h0=h/2;
  x=(a+0.5*h):h:b;
  val=0.5*(oval+h*sum(feval(f,x)));
end
