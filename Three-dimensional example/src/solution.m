function error = solution(N, Re, k)
%% This function is used to calculate the error of the numerical solution
%% the spatial step
XL=-1; XR=1;TR=1;
ep=1;


dx=(XR-XL)/(N-1);
x=zeros(N,1);
for i=1:N
x(i)=XL+(i-1)*dx;
end
%% compact
v=1/Re;

XL=-0.5; XR=0.5;
u0=pim_cos1(N,-1.5,-0.5,v,TR);
u1=pim_cos1(N,-0.5,0.5,v,TR);
u2=pim_cos1(N,0.5,1.5,v,TR);
U=[u0' u1' u2'];
U(2*N)=[];
U(N)=[];

U1=U((N+1)/2:3*N-(N+1)/2);
U1=U1(1:2:end)';
uu1=pim_sin(N,-1,0,v,TR);
uuu1=pim_sin(N,0,1,v,TR);
uu2=[uu1' uuu1'];
uu2(N)=[];
uu2=uu2(1:2:end)';
ux=uu2;
uy=ux;
uz=uy;
udx=U1;
for i=1:N
  UZ{i}=udx*uy'*uz(i);
end

for i=1:N
  UM{i}=ux*uy'*uz(i);
end

n=-pi^2;
uex=sin(pi*x)*exp(n*TR*v);
uey=sin(pi*x)*exp(n*TR*v);
uez=sin(pi*x)*exp(n*TR*v);

for i=1:N
  UMM{i}=uex*uey'*uez(i);
end
n=-pi^2;
uedx=cos(pi*x)*exp(n*TR*v);

for i=1:N
  UZZ{i}=uedx*uy'*uz(i);
end

A = cellcal(UZ, 2*pi*v, 2);
B = cellcal(UM, ep, 0);
uu = cellcal(A, B, 3);
uu = cellcal(uu, 1/k, 2);


A = cellcal(UZZ, 2*pi*v, 2);
B = cellcal(UMM,ep, 0);
uuex = cellcal(A, B, 3);
uuex = cellcal(uuex, 1/k, 2);

ua = Cellto3dim(uu);
ub = Cellto3dim(uuex);
error = ub - ua;
end