function u = exact_solution(Re, t, N, count)
%% This function is used to calculate the analytical solution
v = 1/Re;
m = N;
n = N;
lambda = 1/(4*pi*v);
xl = 0;xr = 1;
x = linspace(xl, xr, count);
y = x;

up = zeros(count, count);
down = zeros(count, count);
for i = 0:n
    for j = 0:m
        flag = [i, j];
        flag = flag == 0;
        switch sum(flag)
            case 2
                Amn = 1;
            case 1
                Amn = 2;
            case 0
                Amn = 4;
        end
        
        if mod(i+j, 2) == 0
            Cmn = besseli((i+j)/2, lambda)*besseli((i-j)/2, lambda);
        else
            Cmn = 0;
        end
        
        Emn = exp(-(i*i+j*j)*pi*pi*v*t);
        
        up = up+i*Amn*Cmn*Emn*sin(i*pi*x)'*cos(j*pi*y);
        down = down+Amn*Cmn*Emn*cos(i*pi*x)'*cos(j*pi*y);
    end
end
u = 2*pi*v*up./down;
end
