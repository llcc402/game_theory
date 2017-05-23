clear
clc

N = 40;
K1 = 0 : 0.02 : 0.1; % the param in circumProb
K1 = 0 - K1;
R = 1; P = 0; S = 0;
T = 1.01 : 0.05 : 1.51;
K = 0.1; % the param in Femi
neigRadius = 1;
iter_num = 100;

accept_rate = zeros(length(T), length(K1));
cooperator_rate = zeros(length(T), length(K1));

for k = 1:length(K1)
    for t = 1:length(T)
        tic
        StrasMatrix = initStrasMatrix( N );
%         fprintf(['init: ', num2str(sum(sum(StrasMatrix)) / N / N)])
        PayoffMatr = [R, S; T(t), P];
        PaysMatrix = Play( StrasMatrix, PayoffMatr, neigRadius );
        for i = 1:iter_num
            [StrasMatrix, accept_rate(t,k)] = Evolution( StrasMatrix, PaysMatrix, neigRadius, K , K1(k));
            PaysMatrix = Play( StrasMatrix, PayoffMatr, neigRadius );
        end
        cooperator_rate(t, k) = sum(sum(StrasMatrix)) / N / N;
        toc
    end
end