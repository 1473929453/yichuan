% Function short_road_fun �������·��������Ⱥ�������Ӧ��ֵ
% v ��Ҫ������Ӧ��ֵ����Ⱥ
% power ���·������ڽӾ���
% fit ��Ⱥÿ�������Ӧ��·�����Ⱦ���
function fit = short_road_fun(v,power)
[N L] = size(v);
fit = zeros(N,1);  % %��ʼ���� ����Ӧ����0 fit��һ��80*1�ľ���
for i = 1:N
    I = find(v(i,:)==1);  %% I������ÿһ��1��λ��  ��v��1�������е�һ��������������1 ��I=[1 2 6]
    [Im,In] = size(I);   %% Im�̶�Ϊ1 In��ʾÿ���ж��ٸ�1 ��I=[1 2 6]��In=3 ��  I=[2 3 6 9 16] In=5
    for j = 1:In-1
        fit(i) = fit(i) + power(I(j),I(j+1));  %% fit��һ��80*1�ľ��� fit��i��ֻ��1*1�ľ���Ҳ����һ����                                                                         
    end    %% �� ��i=1ʱ��I=[2 3 6 9 16]��  ����j=1,fit(1)=0+power(2,3) power(2,3)��2��3�ľ��롣 
            % ��i=1����jȫ��ѭ�����ʱ
            % fit��1��=power(2,3)+power(3,6)+power(6,9)+power(9,16)  In=5��
            % power����4�� ���j�Ǵ�1��4
end   

