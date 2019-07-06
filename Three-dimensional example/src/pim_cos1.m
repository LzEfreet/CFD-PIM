function u=pim_cos1(N,XL,XR,v,TR)
dx=(XR-XL)/(N-1);
x=zeros(N,1);
for i=1:N
x(i)=XL+(i-1)*dx;
end
m=pi;n=-pi^2;
u1ex=cos(m*x)*exp(n*TR*v);
u1=cos(m*x);
u1new=u1;

%% compact
A1=v*reconuxx1p(N,dx);

%% PIM
tao=0.0005;
M=20;
m=2^M;
dt=tao/m;
Nstep = round(TR/tao);
T1=jingxi(A1,dt,M);
for k=1:Nstep
u1new=T1*u1new;
u1new(1,1)=0;u1new(N,1)=0;
end
u=u1new;
end