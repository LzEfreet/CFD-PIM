clc, clear
%% parameter setting
N = 11;
Re = 1000;
k = 10;
%% Calculate the maximum error(z = 0.1)
error11 = solution(N, Re, k);

N = 21;
error21 = solution(N, Re, k);

N = 41;
error41 = solution(N, Re, k);

N = 81;
error81 = solution(N, Re, k);
z = 0.1;

x11 = linspace(0, 1, 11);
n11 = sum(x11<=z);
e11 = max(max(abs(error11(:, :, n11))));

x21 = linspace(0, 1, 21);
n21 = sum(x21<=z);
e21 = max(max(abs(error21(:, :, n21))));

x41 = linspace(0, 1, 41);
n41 = sum(x41<=z);
e41 = max(max(abs(error41(:, :, n41))));

x81 = linspace(0, 1, 81);
n81 = sum(x81<=z);
e81 = max(max(abs(error81(:, :, n81))));

%% convergence
c1 = log2(e11/e21);
c2 = log2(e21/e41);
c3 = log2(e41/e81);