% Function bit_mutation ����λ��������
% vtemp ��Ҫ���б����������Ⱥ
% pm �������
% v ͨ������λ���������²�������Ⱥ����Ⱥ��ģ����
function v = bit_mutation(vtemp,pm)   %%û����
[N, L] = size(vtemp); 
M = rand(N,L)<=pm;
v = vtemp-2.*(vtemp.*M)+M;
