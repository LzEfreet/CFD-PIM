function res = cellcal(a, b, s)
%% This function is used to calculate the element array on an element by element basis.
% s = 0:Number plus
% s = 1:addition
% s = 2:Number multiplication
% s = 3:division
[m, n] = size(a);
res = cell(m, n);
switch s
    case 0
        for i = 1:n
            res{i} = a{i} + b;
        end
    case 1
        for i = 1:n
                res{i} = a{i} + b{i};
        end
    case 2
        for i = 1:n
                res{i} = a{i} * b;
        end
    case 3
        for i = 1:n
                res{i} = a{i}./b{i};
        end  
end