clear
clc

N = 100;
T = [1.1, 1.2, 1.3, 1.4, 1.5]; % the param in circumProb
R = 1; P = 0; S = 0;
K1 = 0.1;
K = 0.1; % the param in Femi
neigRadius = 1;
iter_num = 1000;

cooperate_rate_vec = zeros(1, length(T));
line_style = {'-', '--', '-.', '-', '--','-.'};
line_color = {'r', 'g', 'b', 'c', 'm','y'};
marker = {'>', 's', '^', '<', 'o','*'};

idx = 1:25:iter_num;

for tt = 1:length(T)

    tic
    StrasMatrix = initStrasMatrix( N );
%         fprintf(['init: ', num2str(sum(sum(StrasMatrix)) / N / N)])
    PayoffMatr = [R, S; T(tt), P];
    PaysMatrix = Play( StrasMatrix, PayoffMatr, neigRadius );
    for i = 1:iter_num
        [StrasMatrix, cooperate_rate_vec(i)] = Evolution( StrasMatrix, PaysMatrix, neigRadius, K , K1);
        PaysMatrix = Play( StrasMatrix, PayoffMatr, neigRadius );
    end
    hold on
    plot(cooperate_rate_vec(idx), 'LineStyle', line_style{tt}, 'LineWidth',...
        2, 'Color', line_color{tt}, 'Marker', marker{tt})
    toc
   
end
legend('T = 1.1', 'T = 1.2', 'T = 1.3', 'T = 1.4', 'T = 1.5')
