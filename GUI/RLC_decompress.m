%RLC��ѹ��
%���룺ѹ��������У�S_RLC
%�������ѹ��������У�S_deRLC

function[S_deRLC] = RLC_decompress(S_RLC)

%���ѹ�������еĳ���
L_S_RLC = length(S_RLC);
%��ʼ����ѹ�������
S_deRLC = zeros; 

%��ѹ��������н�����λ��ԭ
count = 1; %��ѹ������λ�ü�������
for i = 1:2:(L_S_RLC-1)
    for j = 1:S_RLC(i)
        S_deRLC(count) = S_RLC(i+1);
        count = count + 1;
    end
end

    