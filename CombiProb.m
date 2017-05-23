function combiProb = CombiProb( femiProb, histProb, K2 )
r = rand(1);
if r < K2
    combiProb = histProb;
else
    combiProb = femiProb;
end
