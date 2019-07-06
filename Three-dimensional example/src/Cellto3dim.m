function u3dim = Cellto3dim(ucell)
%% This function is used to convert the solution in the form of a cell array into a three-dimensional matrix.
len = length(ucell);
u3dim = zeros(len, len, len);
for i = 1:len
    temp = ucell{i};
    u3dim(:, :, i) = temp;
end
end