% Short road GA main program 

% n     ---- 种群规模
% ger   ---- 迭代次数
% pc    ---- 交叉概率
% pm    ---- 变异概率
% v     ---- 初始种群（规模为n）
% f     ---- 目标函数值
% fit   ---- 适应度向量
% vx    ---- 最优适应度值向量
% vmfit ---- 平均适应度值向量

%% 初始化：数据录入及参数设定
clear all;
close all;
clc;

tic;

% power 为最短路问题的邻接矩阵，没有直接路径的两个节点的距离为无穷大，
%       这里用一个很大的数（100）表示
power = [0 5 3 100 100 100 100 100 100 100 100 100 100 100 100 100;
         100 0 100 1 3 6 100 100 100 100 100 100 100 100 100 100;
         100 100 0 100 8 7 6 100 100 100 100 100 100 100 100 100;
         100 100 100 0 100 100 100 6 8 100 100 100 100 100 100 100;
         100 100 100 100 0 100 100 3 5 100 100 100 100 100 100 100;
         100 100 100 100 100 0 100 100 3 3 100 100 100 100 100 100;
         100 100 100 100 100 100 0 100 8 4 100 100 100 100 100 100;
         100 100 100 100 100 100 100 0 100 100 2 2 100 100 100 100;
         100 100 100 100 100 100 100 100 0 100 100 1 2 100 100 100;
         100 100 100 100 100 100 100 100 100 0 100 3 3 100 100 100;
         100 100 100 100 100 100 100 100 100 100 0 100 100 3 5 100;
         100 100 100 100 100 100 100 100 100 100 100 0 100 5 2 100;
         100 100 100 100 100 100 100 100 100 100 100 100 0 6 6 100;
         100 100 100 100 100 100 100 100 100 100 100 100 100 0 100 4;
         100 100 100 100 100 100 100 100 100 100 100 100 100 100 0 3;
         100 100 100 100 100 100 100 100 100 100 100 100 100 100 100 0];

[PM, PN] = size(power);  % % PM（列长度） PN（行长度） 均为16 ，可能是后续计算要用两个16   

% 参数设定
n = 80;     % % n     ---- 种群规模
ger = 200;   % %  ger   ---- 迭代次数
pc = 0.7;  % % pc    ---- 交叉概率
pm = 0.02;  % % pm    ---- 变异概率

% 生成初始种群
v = init_population(n,PN);   % 生成有n个个体，串长为PN的初始种群
v(:,1) = 1;     % 强行令二进制串的左边第1位为1，以保证首节点A一定被选中
v(:,end) = 1;   % 强行令二进制串的右边第1位为1，以保证未节点G一定被选中

% 在MATLAB的命令窗口显示各种参数
[N,L] = size(v);
fprintf('Number of generations:%d\n',ger);    %%fprintf是将数值显示在命令框的函数 %d\n是显示整数，3f\是显示小数点后三位
fprintf('Population size:%d\n',N);
fprintf('Crossover probability:%.3f\n',pc);
fprintf('Mutation probability:%.3f\n',pm);

% 计算适应度，并画出图形
fit = short_road_fun(v,power);
figure(1);
grid on;  %% 开启坐标图的网格
hold on;
plot(fit,'k*');  %%每一代的适应度

% 变量初始化
vmfit = [];  % vmfit ---- 平均适应度值向量
it = 1;
vx = [];  % vx    ---- 最优适应度值向量

%% 开始进化
while it <= ger     % %  ger   ---- 迭代次数 200
    
    % Reproduction(Bi-classist Selection)    
    fitmax = max(fit);
    fit = fitmax - fit;    %% 最大适应度与本身适应度的差值 计算结果为80*1的矩阵 。差值越大 适应度越小。 对于轮盘选择而言，适应度值越大越好  
    vtemp = roulette_selection(v,fit);

    % Crossover
    vtemp = crossover(vtemp,pc);
    
    % Mutation
    v = bit_mutation(vtemp,pm);
    v(:,1) = 1;     % 强行为1，以保证首节点A一定被选中
    v(:,end) = 1;   % 强行为1，以保证未节点G一定被选中

    % 保留中间运算结果
    fit = short_road_fun(v,power);
    
    [sol,indb] = min(fit);
    v(1,:) = v(indb,:);
    media = mean(fit);
    vx = [vx sol];
    vmfit = [vmfit media];
    it = it+1;    % 迭代次数增 1
end

%% 最后结果呈现
fprintf('\n\n');    %空一行

% 显示最优解及最优值
fprintf('Shortroad is %s\n',num2str(find(v(indb,:))));
fprintf('Mininum is %d\n',sol);
v(indb,:)

% 图形显示最优结果
figure(1);
plot(fit,'r^');
title(['种群的初始和最终位置'],'fontsize',16);
legend({'初始位置','最终位置'},'FontSize',11,'Location','Northeast')
xlabel('种群个体','fontsize',14);
ylabel('路径值','fontsize',14);

% 图形显示最优及平均函数值变化趋势
figure(2);
plot(vx);
title(['最优及平均路径值变化趋势'],'fontsize',16);
xlabel('迭代次数','fontsize',14);
ylabel('路径值','fontsize',14);
hold on;
plot(vmfit,'r');
legend({'最优值','平均值'},'FontSize',11,'Location','Northeast')
hold off;

runtime = toc
