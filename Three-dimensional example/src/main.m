clear ;clc;
%% the spatial step
N=81; XL=-1; XR=1;TR=1;
ep=2;
k = 1;

dx=(XR-XL)/(N-1);
x=zeros(N,1);
for i=1:N
x(i)=XL+(i-1)*dx;
end
%% compact
Re=100;
v=1/Re;

%%
XL=-0.5; XR=0.5;
u0=pim_cos1(N,-1.5,-0.5,v,TR);
u1=pim_cos1(N,-0.5,0.5,v,TR);
u2=pim_cos1(N,0.5,1.5,v,TR);
U=[u0' u1' u2'];
U(2*N)=[];
U(N)=[];

U1=U((N+1)/2:3*N-(N+1)/2);
U1=U1(1:2:end)';
%%
uu1=pim_sin(N,-1,0,v,TR);
uuu1=pim_sin(N,0,1,v,TR);
uu2=[uu1' uuu1'];
uu2(N)=[];
uu2=uu2(1:2:end)';
%%
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

%% 
% n=-pi^2;
% uex=sin(pi*x)*exp(n*TR*v);
% uey=sin(pi*x)*exp(n*TR*v);
% uez=sin(pi*x)*exp(n*TR*v);
% 
% for i=1:N
%   UMM{i}=uex*uey'*uez(i);
% end
%%
% n=-pi^2;
% uedx=cos(pi*x)*exp(n*TR*v);
% 
% for i=1:N
%   UZZ{i}=uedx*uy'*uz(i);
% end

% Numerical Solution
A = cellcal(UZ, 2*pi*v, 2);
B = cellcal(UM, ep, 0);
uu = cellcal(A, B, 3);
uu = cellcal(uu, 1/k, 2);

% Analytical solution
% A = cellcal(UZZ, 2*pi*v, 2);
% B = cellcal(UMM,ep, 0);
% uuex = cellcal(A, B, 3);
% uuex = cellcal(uuex, 1/k, 2);

%%
% figure(1)
% mesh(x, x, uu{21})
% xlabel('x','FontName','Times New Roman','FontSize',16);
% ylabel('y','FontName','Times New Roman','FontSize',16);
% zlabel('u(x,y,z,t)','FontName','Times New Roman','FontSize',16);
% set(gca, 'FontName', 'Times New Roman', 'FontSize', 16);

%%
% figure(2)
% mesh(x, x, uuex{21}-uu{21})
% ua = Cellto3dim(uu);
% ub = Cellto3dim(uuex);
% error81 = ub - ua;
% xlabel('x','FontName','Times New Roman','FontSize',16);
% ylabel('y','FontName','Times New Roman','FontSize',16);
% zlabel('u(x,y,z,t','FontName','Times New Roman','FontSize',16);
% set(gca, 'FontName', 'Times New Roman', 'FontSize', 16);

%%
% y=x;
% z=x;
% xs = [-0.5 0.5];
% ys = [-0.25 0.25];
% % zs = [-0.5 0.5];
% zs = 0;
% c=ua;
% % figure(3)
% slice(x,y,z,c,xs,ys,zs)
% ylabel('y','FontName','Times New Roman','FontSize',16);
% xlabel('x','FontName','Times New Roman','FontSize',16);
% zlabel('z','FontName','Times New Roman','FontSize',16);
% set(gca, 'FontName', 'Times New Roman', 'FontSize', 16);
% view([-33 36]);
% shading interp;
% colormap jet;
% ux61 = zeros(81, 81);
% for i = 1:81
%     for j = 1:81
%         ux61(i, j) = ua(j, i, 61);
%     end
% end
% figure(3)
% mesh(x, x, ux61)
% xlabel('y','FontName','Times New Roman','FontSize',16);
% ylabel('z','FontName','Times New Roman','FontSize',16);
% zlabel('u(x,y,z,t)','FontName','Times New Roman','FontSize',16);
% set(gca, 'FontName', 'Times New Roman', 'FontSize', 16);
