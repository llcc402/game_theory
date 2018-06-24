clc
clear

N = 100;
r = 0.3;
T = 1 + r; R = 1; P = 0; S = 0;
K = 0.1; % the param in Femi
K1 = 0.3; % the param in circumProb
neigRadius = 1;
iter_num = 240;

% 初始化策略矩�?
StrasMatrix = zeros(N);
StrasMatrix(45 : 55, 45 : 55) = 1;
figure(1)
DrawStraMatrix(StrasMatrix)
% pause(0.01)


% 博弈支付矩阵
PayoffMatr = [R, S; T, P];

% 邻居间博弈矩�?
PaysMatrix = Play( StrasMatrix, PayoffMatr, neigRadius );


for i = 1:iter_num
    tic
    
    StrasMatrix = Evolution( StrasMatrix, PaysMatrix, neigRadius, K , K1);  % �?��演化，更新各节点的策�?
    
    PaysMatrix = Play( StrasMatrix, PayoffMatr, neigRadius );
    
    if mod(i, 40) == 0
        figure(i / 40 + 1)
        DrawStraMatrix(StrasMatrix)
    end
    
    toc
    fprintf(['iter ', num2str(i), ' done\n'])
end


