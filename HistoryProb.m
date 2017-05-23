function histProb = HistoryProb( neigHistPayoff, K1 )

histProb = 1 / (1 + exp(-neigHistPayoff / K1));