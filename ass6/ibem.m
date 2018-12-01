clear;clf;
% define elements on the boundary of a circle
N=16;R=10;Ns=1:N;TH=1/2*pi;
dth=TH/N;
th=0:dth:TH;
dx=R/N;dy=R/N;
xs=(1:N-1).*dx; % Ignore corner points
ys=(((N:-1:1)-1).*dy);%Ignore the top left corner point

xb=R*cos(th);yb=R*sin(th); % define elements on the boundary of the circle
vals=[sin(8*th)]; % f(th) on circle boundary
xb=[xb ys.*0];yb=[yb ys]; % define elements on the x=0 edge
xb=[xb xs]; yb=[yb xs.*0];% define elements on the y=0 edge
vals=[vals ys.*0 xs.*0]; % 0 on slice edges

[~,N]=size(xb);Ns=1:N;

xe=xb*0;ye=yb*0;
xe(1:N-1)=xb(2:N);xe(N)=xb(1);
ye(1:N-1)=yb(2:N);ye(N)=yb(1);
xm=0.5*(xb+xe);ym=0.5*(yb+ye);
ah=0.5*sqrt((xe-xb).^2+(ye-yb).^2);
calf=0.5*(xe-xb)./ah;salf=0.5*(ye-yb)./ah;
%generate influence matrices
for i=1:N % sending element
   xs=xm(i);ys=ym(i);ci=calf(i);si=salf(i);as=ah(i);
   for j=1:N
      x=xm(j)-xs;y=ym(j)-ys;
      xp=x*ci+y*si;yp=-x*si+y*ci;
      G(j,i)=V(xp,yp,as);
      H(j,i)=VN(xp,yp,as);
   end
end

g=vals;
% !!! determine boundary flux **JUMPS**
F=G\(g');

% evaluate the solution at benchmarks
Nbm=100;Nbms=1:Nbm;thbm=pi/16;dybm=R*sin(thbm)/Nbm;dxbm=R*cos(thbm)/Nbm;
xbm=(Nbms.*dxbm)-dxbm./2;ybm=(Nbms.*dybm)-dybm./2;
ubm=0*xbm;
for i=1:N % sending element
   xs=xm(i);ys=ym(i);ci=calf(i);si=salf(i);as=ah(i);
   for j=1:length(ybm)
      x=xbm(j)-xs;y=ybm(j)-ys;
      xp=x*ci+y*si;yp=-x*si+y*ci;
      % !!! Use V * flux jumps instead of the DBEM
      ubm(j)=ubm(j) + V(xp,yp,as)*F(i);
   end
end
rbm=sqrt(xbm.*xbm+ybm.*ybm);
ue=(rbm.^8)./(R.^8) .* sin(8*thbm);
figure(1);
subplot(2,1,1),plot(xb,yb,xm(Ns),ym(Ns),'o');
axis square
subplot(2,1,2),plot(rbm,ue,'k-',rbm,ubm,'r-o','markersize',2,'markerfacecolor','r')

xlabel('r')
ylabel('$$u(r,\theta=\frac{\pi}{16})$$','interpreter','latex')
legend(' Exact Solution ',' Direct BEM ','Location','northwest')
title('Indirect boundary integral solution to Laplace Equation: $$\Delta u = 0$$ along $$\theta = \frac{\pi}{16}$$','interpreter','latex')
figure(2);
plot(rbm,ue-ubm,'r-o','markersize',2,'markerfacecolor','r');
xlabel('r')
ylabel('Error $$u_{ex}(r,\theta=\frac{\pi}{16})-u(r,\theta=\frac{\pi}{16})$$','interpreter','latex')
title('Error in indirect boundary integral solution to Laplace Equation: $$\Delta u = 0$$ along $$\theta = \frac{\pi}{16}$$','interpreter','latex')
