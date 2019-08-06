% Function init_population 生成初始种群
% n 初始种群的规模
% s 二进制的长度
% v n行s列的01矩阵，表示已生成的初始种群
function v = init_population(n,s)  %% 此处s计算时为main文件里的PN，也就是16
v = round(rand(n,s));    %% 随机生成一个有n行s列的01矩阵 每一行都是一个个体
