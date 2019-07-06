function u=pim_sin(N,XL,XR,v,TR)
dx=(XR-XL)/(N-1);
x=zeros(N,1);
for i=1:N
x(i)=XL+(i-1)*dx;
end
%% compact
A=v*reconuxx1p(N,dx);
%% PIM
tao=0.0005;
M=20;
m=2^M;
dt=tao/m;
Nstep = round(TR/tao);
T=jingxi(A,dt,M);
%% ¾«È·½â
n=-pi^2;
u0ex=sin(pi*x)*exp(n*TR*v);
u0=sin(pi*x);
unew=u0;
for k=1:Nstep
unew=T*unew;
unew(1,1)=0;unew(N,1)=0;
end
u=unew;
end