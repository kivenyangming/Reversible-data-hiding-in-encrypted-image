%���룺Ҫ����RLCѹ����ͼƬ����M
%�����ѹ��������У�M_RLC
function[compressed_Matrix] = high_bit_plane_RLC(Matrix_to_be_compress)

M = Matrix_to_be_compress;  %Ҫѹ������λλƽ�棬����һ������ʱ�����ȼ��������λƽ��ľ���ֵ
[h, w] = size(M);
compressed_Matrix = zeros;  %�������õı�������

L = M(1,1); %��ʼ����ǰֵ�������ñ������ڼ�¼��ǰ����ĻҶȼ�ֵ����ʼֵΪ����λƽ�����ĵ�һ�е�һ�е�ֵ
R = 0;%��ʼ���γ̳��ȱ������ñ������ڼ�¼��ǰ������γ̳���ֵ,��ʼֵΪ0(Ϊ1�Ļ���һ�е�һ�е�ֵ������������)
round_count = 0;%��ʼ���γ̼����������ñ������ڼ�¼��ǰ���빲�����˼����γ�,��ʼֵΪ0
for i=1:h
    for j=1:w
        if R==15          %�����ʱR�Ѿ�����15�������¿�ʼһ���γ̵ı���
            round_count = round_count + 1; %�γ̶���+1
            compressed_Matrix(2*round_count-1) = R; %д���γ̳��ȵ���������
            compressed_Matrix(2*round_count) = L; %д��Ҷ�ֵ����������
            R=1;          %��������R=1
            L = M(i,j);   %���½���ǰ�Ҷ�ֵ��Ϊ��ǰ�γ̱���ĻҶ�ֵ
            continue;
        else              %�����ʱRû��15
            if M(i,j) == L    %�����ǰ�Ҷ�ֵ�뵱ǰ�γ̱���ĻҶ�ֵ��ͬ
                R=R+1;            %�γ�+1                 
            else               %�����ǰ�Ҷ�ֵ�뵱ǰ�γ̱���ĻҶ�ֵ��ͬ
                round_count = round_count + 1; %�γ̶���+1
                compressed_Matrix(2*round_count-1) = R; %д���γ̳��ȵ���������
                compressed_Matrix(2*round_count) = L; %д��Ҷ�ֵ����������
                L = M(i,j); %���½���ǰ�Ҷ�ֵ��Ϊ��ǰ�γ̱���ĻҶ�ֵ
                R=1; %��������R=1
            end
        end
    end
end

%�������һ���γ̵����ݽ��в�¼
round_count = round_count + 1; %�γ̶���+1
compressed_Matrix(2*round_count-1) = R; %д���γ̳��ȵ���������
compressed_Matrix(2*round_count) = L; %д��Ҷ�ֵ����������
            
            
        
