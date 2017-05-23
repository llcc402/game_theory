function [ PaysMatrix ] = Play( StrasMatrix, PayoffMatr, neigRadius )
% 在自己和邻居间进行博弈，得到所有节点的收益

N = length(StrasMatrix);
PaysMatrix = zeros(N, N);

for i = 1:N
    for j = 1:N        
        neighSet = FindAllNeighsForPlay(i, j, N, neigRadius);
        [num_neigh, nnn] = size(neighSet);
        for k = 1:num_neigh
            neighPos_i = neighSet(k, 1);
            neighPos_j = neighSet(k, 2);
            [payoff_player, payoff_neigh] = play2persons( StrasMatrix(i,j), StrasMatrix(neighPos_i,neighPos_j), PayoffMatr );
            PaysMatrix(i,j) = PaysMatrix(i,j) + payoff_player;
            PaysMatrix(neighPos_i,neighPos_j) = PaysMatrix(neighPos_i,neighPos_j) + payoff_neigh;
        end
    end
end

