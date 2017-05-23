function circumProb = CircumProb(neighSet, N, neigRadius, PaysMatrix, K1)

num_neighs = size(neighSet, 1);
circumProb = zeros(1, num_neighs);

for i = 1:num_neighs
    % all the neighbors of neighbor i
    neigh_i_set = FindAllNeighs(neighSet(i,1), neighSet(i,2), N, neigRadius);
    for j = 1:size(neigh_i_set, 1)
        circumProb(i) = circumProb(i) + PaysMatrix(neigh_i_set(j,1), neigh_i_set(j,2));
    end
end
circumProb = exp(circumProb * K1);
circumProb = circumProb / sum(circumProb);