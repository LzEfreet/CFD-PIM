%% This program is used to draw curves at different times
clc,clear
x = linspace(0, 1, 81);
TR = [0, 0.4, 0.8, 1.2, 1.6, 2];
N = [57, 31, 23, 20, 20, 20];
len = length(TR);
u = zeros(len, 81);
for i = 1:len
    u(i, :) = huatu(TR(i), N(i));
end
%% plotting
plot(x, u, 'linewidth', 1.5);
xlabel('x', 'FontName', 'Times New Roman', 'FontSize', 16);
ylabel('u(x,t)', 'FontName', 'Times New Roman', 'FontSize', 16);
hl = legend('t=0', 't=0.4', 't=0.8', 't=1.2', 't=1.6', 't=2');
set(hl, 'FontName', 'Times New Roman', 'FontSize', 16);
set(gca, 'FontName', 'Times New Roman', 'FontSize', 16);