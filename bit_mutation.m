% Function bit_mutation 基本位变异算子
% vtemp 需要进行变异运算的种群
% pm 交叉概率
% v 通过基本位变异算子新产生的种群，种群规模不变
function v = bit_mutation(vtemp,pm)   %%没读懂
[N, L] = size(vtemp); 
M = rand(N,L)<=pm;
v = vtemp-2.*(vtemp.*M)+M;
