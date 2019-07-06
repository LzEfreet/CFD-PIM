function u=exact(m,n,x,t,N)
%% This function is used to calculate the analytical solution
u1=20*pi*sin(m*x)*exp(n*t);
u2=2+cos(m*x)*exp(n*t);
for i=1:N
u(i)=u1(i)/u2(i);
end
end