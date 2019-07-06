function u = PIM(XL, XR, n, flag, count, Re, TR)
%% this function is used for computing CDF scheme and PIM
N = count;
dx = (XR-XL) / (N-1);
x = zeros(N, 1);
for i = 1:N
x(i) = XL + (i-1)*dx;
end

%% compact
v = 1/Re;
A = v*reconuxx1p(N, dx);        % sixth-order CDF scheme and Dirichlet condition

%% Parameter setting
tao = 0.00001;                  % Time Step
M = 20;                         % Generally take twenty, there are formula calculations
m = 2^M;                        % 2^N algorithm
dt = tao/m;
Nstep = round(TR/tao);         

%% PIM
T = jingxi(A,dt,M);             % Taylor expansion of precise integration method

u0 = intialu(x, 0, v, n, flag); % initial conditions
unew = u0;

for k = 1:Nstep
unew = T*unew;
unew(1,1) = 0;unew(N,1) = 0;    % Boundary conditions
end
u = unew';
end