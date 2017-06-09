clear
clc

N = 40;
K1 = 0.02; % the param in circumProb
R = 1; P = 0; S = 0;
T = 1.1 : 0.1 : 1.5;
K = 0.1; % the param in Femi
neigRadius = 1;
iter_num = 100;

cooperate_rate_vec = zeros(1, length(T));
line_style = {'-', '--', '-.', '-', '--'};
line_color = {'r', 'g', 'b', 'c', 'm'};
marker = {'>', 's', '^', '<', 'o'};

idx = 5:5:100;
idx = [1, idx];

for t = 1:length(T)

    tic
    StrasMatrix = initStrasMatrix( N );
%         fprintf(['init: ', num2str(sum(sum(StrasMatrix)) / N / N)])
    PayoffMatr = [R, S; T(t), P];
    PaysMatrix = Play( StrasMatrix, PayoffMatr, neigRadius );
    for i = 1:iter_num
        [StrasMatrix, cooperate_rate_vec(i)] = Evolution( StrasMatrix, PaysMatrix, neigRadius, K , K1);
        PaysMatrix = Play( StrasMatrix, PayoffMatr, neigRadius );
    end
    hold on
    plot(cooperate_rate_vec(idx), 'LineStyle', line_style{t}, 'LineWidth',...
        2, 'Color', line_color{t}, 'Marker', marker{t})
    toc
   
end
legend('T = 1.1', 'T = 1.2', 'T = 1.3', 'T = 1.4', 'T = 1.5')
