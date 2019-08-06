% Function crossover ���㽻������
% vtemp ��Ҫ���н����������Ⱥ
% pc �������
% v ͨ�����������²�������Ⱥ����Ⱥ��ģ����
function v = crossover(vtemp,pc)
[N,L] = size(vtemp);
C(:,1) = rand(N,1)<=pc;  % % rand(N,1)<=pc ���ж���� �����λ�õ�����С�ڵ���0.7 ��C�ж�Ӧλ��Ϊ1 
I = find(C(:,1)==1);     %% I����ΪC������1��λ�� I����Ĵ�С����1�ĸ���

for i = 1:2:size(I)         % %������
    if i >= size(I)
        break;
    end
    site = fix(1+L*rand(1));
    temp = vtemp(I(i,1),:);
    vtemp(I(i,1),site:end) = vtemp(I(i+1,1),site:end);
    vtemp(I(i+1,1),site:end) = temp(:,site:end);
end

v = vtemp;
