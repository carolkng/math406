% Circle, all Dirichlet
clear;clf
% Number of triangles
n=32;
% phi is 64 subdivisions from 0 to 2pi
phi=2*pi*(0:n)'/n;

% pv is a 64 row * 2 column of points x,y points 
% on the boundary of the circle
pv=[cos(phi),sin(phi)];

% Pmesh called with :
%   - pv: the (x,y) points of the boundariesa
%   - hmax: the angular distance between the boundary points
%   - 0????
[p,t,e]=pmesh(pv,2*pi/n,0);

% p: something
% t: corresponds to number of triangles, 3 xyz coordinates per triangle?
% e: boundary nodes on the triangle mesh

%e=e(p(e,2)==1|p(e,2)==-1)

[u,D]=fempoi(p,t,e);

% Real eigenvalues
De = [5.7831,14.682,14.682,26.374,26.374,30.472];
for i=[1,2,4,6]
    tplot(p,t,u(:,i));
    title("FEM \lambda = " + D(i,i) + ", Actual \lambda = " + De(i));
    saveas(gcf, "plotfile" + i + ".png");
end