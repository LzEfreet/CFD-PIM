function res = huatu(TR, N)
%% This function is used to calculate the numerical solution
Re = 100;
count = 81;
A = zeros(1, count);
B = zeros(1, count);
parfor i = 1:N
    [a, b] = Num_Solution(i, count, Re, TR);
    A = A+a;
    B = B+b;
end
v = 1/Re;
a0 = exp(-1/(2*pi*v))*besseli(0, Re/(2*pi));
u = 2*v*pi*(A./(a0+B));
res = u;
end