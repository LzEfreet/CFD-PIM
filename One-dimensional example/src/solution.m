function e = solution(Re, N, count)
%% This function is used to calculate the error of the numerical solution
TR = 1;
v = 1/Re;
A = zeros(1, count);
B = zeros(1, count);
parfor i = 1:N
    [a, b] = Num_Solution(i, count, Re, TR);
    A = A+a;
    B = B+b;
end

a0 = exp(-1/(2*pi*v))*besseli(0, Re/(2*pi));
u = 2*v*pi*(A./(a0+B));
XL=0; XR=1;
x1 = linspace(XL, XR, count);
uex = exact_solution(Re, TR, N, count);
e = u-uex;
end