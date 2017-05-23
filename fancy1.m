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
StrasMatrix = zeros(N);
StrasMatrix(18 : 22, 18 : 22) = 1;
figure(1)
DrawStraMatrix(StrasMatrix)
% pause(0.01)


% 博弈支付矩阵
PayoffMatr = [R, S; T, P];

% 邻居间博弈矩阵
PaysMatrix = Play( StrasMatrix, PayoffMatr, neigRadius );


for i = 1:iter_num
    tic
    
    StrasMatrix = Evolution( StrasMatrix, PaysMatrix, neigRadius, K , K1);  % 一次演化，更新各节点的策略
    
    PaysMatrix = Play( StrasMatrix, PayoffMatr, neigRadius );
    
    if mod(i, 10) == 0
        figure(i / 10 + 1)
        DrawStraMatrix(StrasMatrix)
    end
    
    toc
    fprintf(['iter ', num2str(i), ' done\n'])
end


