% Function init_population ���ɳ�ʼ��Ⱥ
% n ��ʼ��Ⱥ�Ĺ�ģ
% s �����Ƶĳ���
% v n��s�е�01���󣬱�ʾ�����ɵĳ�ʼ��Ⱥ
function v = init_population(n,s)  %% �˴�s����ʱΪmain�ļ����PN��Ҳ����16
v = round(rand(n,s));    %% �������һ����n��s�е�01���� ÿһ�ж���һ������
