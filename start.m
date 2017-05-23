clc
clear

N = 40;
r = 0.5;
T = 1 + r; R = 1; P = 0; S = 0;
K = 0.1; % the param in Femi
K1 = 0.8; % the param in circumProb
neigRadius = 1;
iter_num = 100;

% 初始化策略矩阵
StrasMatrix = initStrasMatrix( N );
figure(1)
DrawStraMatrix(StrasMatrix)
title('Initial StrasMatrix')
% pause(0.01)


% 博弈支付矩阵
PayoffMatr = [R, S; T, P];

% 邻居间博弈矩阵
PaysMatrix = Play( StrasMatrix, PayoffMatr, neigRadius );

% accept
accept_rate = zeros(1, iter_num);

fq_coop = zeros(iter_num);

for i = 1:iter_num
    tic
    
    [StrasMatrix, accept_rate(i)] = Evolution( StrasMatrix, PaysMatrix, neigRadius, K , K1);  % 一次演化，更新各节点的策略
    
    PaysMatrix = Play( StrasMatrix, PayoffMatr, neigRadius );
    
    fq_coop(i) = sum(sum(StrasMatrix));
    
    toc
    fprintf(['iter ', num2str(i), ' done\n'])
end


fq_coop = fq_coop / (N * N);
figure(2)
plot(fq_coop)
title('Proportion of cooperators in each iteration')

figure(3)
DrawStraMatrix(StrasMatrix)
title(['StrasMatrix after ', num2str(iter_num), ' iterations'])


