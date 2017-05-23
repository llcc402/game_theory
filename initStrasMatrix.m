function [ StrasMatrix ] = initStrasMatrix( N )

% ����ʼ�� ���Ծ���
StrasMatrix = zeros(N, N);

for i = 1:N
    for j = 1:N
        if rand(1) > 0.5
            StrasMatrix(i,j) = 1;
        end
    end
end
