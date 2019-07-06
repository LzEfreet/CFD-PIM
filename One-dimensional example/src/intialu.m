function u = intialu(x, t, v, n, flag)
%% This function is used to give initial conditions

Re = 1/v;
if nargin<=4
    flag = 1;
end
a = 2*exp(-1/(2*pi*v))*besseli(n, Re/(2*pi));
if flag == 1
    u = a*n*sin(n*pi*x)*exp(-n*n*pi*pi*v*t);
else
    u = a*cos(n*pi*x)*exp(-n*n*pi*pi*v*t);
end