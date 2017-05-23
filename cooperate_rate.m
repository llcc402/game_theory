clear
clc

N = 40;
K1 = 0 : 0.02 : 0.1; % the param in circumProb
R = 1; P = 0; S = 0;
T = 1.5;
K = 0.1; % the param in Femi
neigRadius = 1;
iter_num = 100;

cooperate_rate_vec = zeros(1, length(K1));
line_style = {'-', '--', '-.', '-', '--', '-.'};
line_color = {'r', 'g', 'b', 'c', 'm', 'r'};

for k = 1:length(K1)

    tic
    StrasMatrix = initStrasMatrix( N );
%         fprintf(['init: ', num2str(sum(sum(StrasMatrix)) / N / N)])
    PayoffMatr = [R, S; T, P];
    PaysMatrix = Play( StrasMatrix, PayoffMatr, neigRadius );
    for i = 1:iter_num
        [StrasMatrix, cooperate_rate_vec(i)] = Evolution( StrasMatrix, PaysMatrix, neigRadius, K , K1(k));
        PaysMatrix = Play( StrasMatrix, PayoffMatr, neigRadius );
    end
    hold on
    plot(cooperate_rate_vec, 'LineStyle', line_style{k}, 'LineWidth', 2, 'Color', line_color{k})
    toc
   
end
legend('K1 = 0', 'K1 = 0.02', 'K1 = 0.04', 'K1 = 0.06', 'K1 = 0.08', 'K1 = 0.1')