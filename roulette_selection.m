% Function roulette_selection 复制算子——轮盘选择
% v 需要进行轮盘选择的种群
% fit 种群个体所对应的适应度值，适应度值越大越好
% vtemp 经过轮盘选择后的种群，种群规模不变
function vtemp = roulette_selection(v,fit)    % fit >= 0
[N,L] = size(v);
S = sum(fit);
for i = 1:N
    SI = S*rand(1);
    for j = 1:N
        if SI <= sum(fit(1:j))   %%由于对于每一个i SI的值都固定 所以i固定时，j有临界值 超过这个临界值的种群全都会被选走
            vtemp(i,:) = v(j,:);
            break
        end
    end
end
