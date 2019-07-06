clc,clear
%% parameter setting
Re = 10;
TR = 1;
N = 5;
count = 81;
v = 1/Re;
A = zeros(1, count);
B = zeros(1, count);

%% Calculating the numerator and denominator of the series solution
parfor i = 1:N
    [a, b] = Num_Solution(i, count, Re, TR);
    A = A+a;
    B = B+b;
end

a0 = exp(-1/(2*pi*v))*besseli(0, Re/(2*pi));
u = 2*v*pi*(A./(a0+B));

%% analytical solution
% XL=0; XR=1;
% x1 = linspace(XL, XR, count);
% uex = exact_solution(Re, TR, N, count);

%% plotting
% figure
% plot(x1, u)
% figure
% plot(x1, uex)
% e = u-uex;
% figure
% plot(x1, e)
