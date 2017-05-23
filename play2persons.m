function [ X_payoff, Y_payoff ] = play2persons( X_stra, Y_stra, PayoffMatr )
% ‘1’表示合作，‘0’表示背叛

T = PayoffMatr(2,1);
R = PayoffMatr(1,1);
P = PayoffMatr(2,2);
S = PayoffMatr(1,2);

if X_stra == 1
    if Y_stra == 1
        X_payoff = R;
        Y_payoff = R;
    else
        X_payoff = S;
        Y_payoff = T;
    end
else
    if Y_stra == 1
        X_payoff = T;
        Y_payoff = S;
    else
        X_payoff = P;
        Y_payoff = P;
    end
end

