function [A, B] = Num_Solution(N, count, Re, TR)
%% Since the Hopf-Cole transfarmation will take the form of a series solution, use the CDF-PIM scheme for each item.
%% The solution interval for this function is [0, 1]
%% Numerator
c = count;
xl = 0;xr = 1;
flag = linspace(xl, xr, N+1);
uA = zeros(c, N);
parfor i = 1:N
    u = PIM(flag(i), flag(i+1), N, 1, c, Re, TR);
    uA(:,i) = u';
end
uA = [reshape(uA(1:end-1,1:end-1), 1, (N-1)*(c-1)), uA(:,end)'];
uA1 = reshape(uA(1:end-1), N, c-1);
A = [uA1(1, :), uA(end)];

%% Denominator
xl = -0.5;
xl = xl/N;
xr = abs(xl)+1;
flag = linspace(xl, xr, N+2);
uB = zeros(c, N+1);
parfor i = 1:N+1
    u = PIM(flag(i), flag(i+1), N, 0, c, Re, TR);
    uB(:,i) = u';
end
uB = [reshape(uB(1:end-1,1:end-1), 1, N*(c-1)), uB(:,end)'];
len = length(uB);
epsilon = 1e-6;
k = linspace(xl,xr,len);
k = (k>=0-epsilon).*(k<=1+epsilon);
uB(find(k==0)) = [];
uB1 = reshape(uB(1:end-1), N, c-1);
B = [uB1(1, :), uB(end)];
end