% Function short_road_fun 计算最短路问题中种群个体的适应度值
% v 需要计算适应度值的种群
% power 最短路问题的邻接矩阵
% fit 种群每个个体对应的路径长度矩阵
function fit = short_road_fun(v,power)
[N L] = size(v);
fit = zeros(N,1);  % %初始化， 将适应度清0 fit是一个80*1的矩阵
for i = 1:N
    I = find(v(i,:)==1);  %% I矩阵是每一行1的位置  如v（1，：）中第一、二、六个数是1 则I=[1 2 6]
    [Im,In] = size(I);   %% Im固定为1 In表示每行有多少个1 例I=[1 2 6]，In=3 ；  I=[2 3 6 9 16] In=5
    for j = 1:In-1
        fit(i) = fit(i) + power(I(j),I(j+1));  %% fit是一个80*1的矩阵， fit（i）只是1*1的矩阵，也就是一个数                                                                         
    end    %% 例 当i=1时，I=[2 3 6 9 16]，  对于j=1,fit(1)=0+power(2,3) power(2,3)是2到3的距离。 
            % 当i=1，且j全部循环完成时
            % fit（1）=power(2,3)+power(3,6)+power(6,9)+power(9,16)  In=5，
            % power就有4个 因此j是从1：4
end   

