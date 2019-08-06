% Function crossover 单点交叉算子
% vtemp 需要进行交叉运算的种群
% pc 交叉概率
% v 通过交叉算子新产生的种群，种群规模不变
function v = crossover(vtemp,pc)
[N,L] = size(vtemp);
C(:,1) = rand(N,1)<=pc;  % % rand(N,1)<=pc 是判断语句 如果该位置的数字小于等于0.7 则C中对应位置为1 
I = find(C(:,1)==1);     %% I矩阵为C矩阵中1的位置 I矩阵的大小就是1的个数

for i = 1:2:size(I)         % %读不懂
    if i >= size(I)
        break;
    end
    site = fix(1+L*rand(1));
    temp = vtemp(I(i,1),:);
    vtemp(I(i,1),site:end) = vtemp(I(i+1,1),site:end);
    vtemp(I(i+1,1),site:end) = temp(:,site:end);
end

v = vtemp;
