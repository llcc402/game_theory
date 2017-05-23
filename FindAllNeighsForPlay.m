function [ neighSet ] = FindAllNeighsForPlay(pos_i, pos_j, N, neigRadius)
% 找到当前位置(i,j)的neigRadius范围内的所有邻居
% 比如找到(4,5)的邻居，最后得出的neighSet为
%  4  6
%  5  5
% 只是找到两个，因为左上的两个邻居在上次博弈中已经考虑过，这样可以避免重复博弈


neighSet = [];

for i = pos_i : pos_i + neigRadius
    for j = pos_j : pos_j + neigRadius
        dist = abs(i - pos_i) + abs(j - pos_j);
        if dist <= neigRadius && dist ~= 0  % 这里找到的邻居不包含节点自身
            neighSet = [neighSet; i, j];
        end
    end
end

neighSet;


num_neigh = size(neighSet, 1);
for i = 1:num_neigh
    if neighSet(i,1) <= 0
        neighSet(i,1) = neighSet(i,1) + N;
    end
    if neighSet(i,2) <= 0
        neighSet(i,2) = neighSet(i,2) + N;
    end

    if neighSet(i,1) > N
        neighSet(i,1) = neighSet(i,1) - N;
    end
    if neighSet(i,2) > N
        neighSet(i,2) = neighSet(i,2) - N;
    end
end


