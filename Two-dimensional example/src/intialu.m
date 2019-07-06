function u = intialu(x, t, v, n, flag)
%% This function is used to give initial conditions
if nargin<=4
    flag = 1;
end

if flag == 1
    u = pi*n*sin(n*pi*x);
else
    u = cos(n*pi*x);
end
end