function [ newStra_ij ] = UpdateStra( myPayoff, myStra, neighSet, neigRadius,...
    StrasMatrix, PaysMatrix, N, K, K1)

newStra_ij = myStra;

circumProb = CircumProb(neighSet, N, neigRadius, PaysMatrix, K1);
[~, ~,randNeigh] = histcounts(rand(1), [0, cumsum(circumProb)]);

neighPos_i = neighSet(randNeigh, 1);
neighPos_j = neighSet(randNeigh, 2);

neighPayoff = PaysMatrix(neighPos_i, neighPos_j);
neighStra = StrasMatrix(neighPos_i, neighPos_j);

femiProb = FemiProb( myPayoff, neighPayoff, K );
if femiProb > rand(1);
    newStra_ij = neighStra;
end
