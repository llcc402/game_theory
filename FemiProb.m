function [ femiProb ] = FemiProb( myPayoff, neigPayoff, K )

femiProb = 1 / (1+exp(-(neigPayoff-myPayoff)/K));