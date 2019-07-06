function u = exact_solution(Re, TR, N, count)
%% This function is used to calculate the analytical solution
v = 1/Re;
XL = 0; XR = 1;
x1 = linspace(XL, XR, count);
A = zeros(1, count);
B = zeros(1, count);
for i = 1:N
    a = intialu(x1, TR, v, i, 1);
    b = intialu(x1, TR, v, i, 0);
    A = A+a;
    B = B+b;
end

a0 = exp(-1/(2*pi*v))*besseli(0, Re/(2*pi));
u = 2*v*pi*(A./(a0+B));
end