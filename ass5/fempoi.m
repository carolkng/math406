function [u,D]=fempoi(p,t,e)

% Assemble K and F
N=size(p,1);
M=sparse(N,N);
A=sparse(N,N);
u=zeros(N,6); 

for ielem=1:size(t,1)
  el=t(ielem,:);
  
  Q=[ones(3,1),p(el,:)];
  Area=abs(det(Q))/2;
  c=inv(Q);
    
  Ah=Area*(c(2,:)'*c(2,:)+c(3,:)'*c(3,:));
  % Construct mass matrix, see Lecture 27
  Mh = (ones(3)+eye(3)) * Area/12;
  A(el,el)=A(el,el)+Ah;
  M(el,el)=M(el,el)+Mh;
end

% Implement Dirichlet boundary conditions
A(e,:)=0;
A(e,e)=speye(length(e),length(e));
% u = eigenvectors
[u,D] = eigs(A,M,6,'smallestabs');

% Solve
%u=A\f;
