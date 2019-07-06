clc,clear
%% Parameter setting and initialization
Re = 100;
TR = 5;
N = 2;
count = 81;
v = 1/Re;
lambda = 1/(4*pi*v);
s = 0;
a = zeros(N, count);
b = zeros(N, count);
A = zeros(count, count);
B = zeros(count, count);

%% Numerical solution
parfor i = 1:N
    [a(i, :), b(i, :)] = Num_Solution(i, count, Re, TR);
end
for i = 0:N
    for j = 0:N
        if i ~=0 && j ~= 0
            ax = a(i, :);
            bx = b(i, :);
            ay = a(j, :);
            by = b(j, :);
        elseif i == 0 && j == 0
            ax = zeros(1, count);
            bx = ones(1, count);
            ay = zeros(1, count);
            by = ones(1, count);
        elseif i == 0
            ax = zeros(1, count);
            bx = ones(1, count);
            ay = a(j, :);
            by = b(j, :);
        else
            ax = a(i, :);
            bx = b(i, :);
            ay = zeros(1, count);
            by = ones(1, count);
        end
        
        if i==0&&j==0
            s = 1;
        elseif i*j == 0
            s = 2;
        else
            s = 4;
        end

        if mod(i+j, 2) == 0
            Cmn = besseli((i+j)/2, lambda)*besseli(abs((i-j)/2), lambda);
        else
            Cmn = 0;
        end

        A = A+s*Cmn*(ax'*by);
        B = B+s*Cmn*(bx'*by);
    end
end  

%% Hopf-Cole transformation
u = 2*v*A./B;
XL=0; XR=1;
x1 = linspace(XL, XR, count);

%% Analytic solution
u1 = exact_solution(Re, TR, N, count);

%% Comparison and plotting
figure(1)
meshc(x1, x1', u)
xlabel('x', 'FontName', 'Times New Roman', 'FontSize', 16);
ylabel('y', 'FontName', 'Times New Roman', 'FontSize', 16);
zlabel('u(x,y,t)', 'FontName', 'Times New Roman', 'FontSize', 16);
set(gca, 'FontName', 'Times New Roman', 'FontSize', 16);
colormap(jet);

figure(2)
meshc(x1, x1', u-u1);
xlabel('x', 'FontName', 'Times New Roman', 'FontSize', 16);
ylabel('y', 'FontName', 'Times New Roman', 'FontSize', 16);
zlabel('u(x,y,t)', 'FontName', 'Times New Roman', 'FontSize', 16);
set(gca, 'FontName', 'Times New Roman', 'FontSize', 16);
colormap(jet);