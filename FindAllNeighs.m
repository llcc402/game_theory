function [ neighSet ] = FindAllNeighs(pos_i, pos_j, N, neigRadius)
% �ҵ���ǰλ�ã�i��j����neigRadius��Χ�������ھ�


neighSet = [];

for i = pos_i - neigRadius : pos_i + neigRadius
    for j = pos_j - neigRadius : pos_j + neigRadius
        dist = abs(i - pos_i) + abs(j - pos_j);            
        if dist <= neigRadius && dist ~= 0  % �����ҵ����ھӲ���ڵ�����
            neighSet = [neighSet; i, j];
        end

    end
end

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




