% Function roulette_selection �������ӡ�������ѡ��
% v ��Ҫ��������ѡ�����Ⱥ
% fit ��Ⱥ��������Ӧ����Ӧ��ֵ����Ӧ��ֵԽ��Խ��
% vtemp ��������ѡ������Ⱥ����Ⱥ��ģ����
function vtemp = roulette_selection(v,fit)    % fit >= 0
[N,L] = size(v);
S = sum(fit);
for i = 1:N
    SI = S*rand(1);
    for j = 1:N
        if SI <= sum(fit(1:j))   %%���ڶ���ÿһ��i SI��ֵ���̶� ����i�̶�ʱ��j���ٽ�ֵ ��������ٽ�ֵ����Ⱥȫ���ᱻѡ��
            vtemp(i,:) = v(j,:);
            break
        end
    end
end
