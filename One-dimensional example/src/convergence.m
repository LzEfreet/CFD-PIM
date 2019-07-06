clc,clear
%% parameter setting
Re = 10;
N = 5;
%% Calculate the maximum error
count = 11;
e11 = solution(Re, N, count);
emax11 = max(abs(e11));

count = 21;
e21 = solution(Re, N, count);
emax21 = max(abs(e21));

count = 41;
e41 = solution(Re, N, count);
emax41 = max(abs(e41));

count = 81;
e81 = solution(Re, N, count);
emax81 = max(abs(e81));

%% convergence
c1 = log2(emax11/emax21);
c2 = log2(emax21/emax41);
c3 = log2(emax41/emax81);