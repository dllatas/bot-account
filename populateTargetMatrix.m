%% 2 x 4148
%% 1 - 2702
%% 2703 - 4148
for i = 1:2
    for j = 1:1000
        if i==1
            if (j<501)
                testTargetValues2(i,j) = 0;
            else
                testTargetValues2(i,j) = 1;
            end
        else
            if (j<501)
                testTargetValues2(i,j) = 1;
            else
                testTargetValues2(i,j) = 0;
            end
        end
    end
end