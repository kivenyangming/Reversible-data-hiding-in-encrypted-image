%�����ı�ˮӡ��Ϣ������
%���룺 1.ˮӡ��Ϣ��W
%      2.ˮӡ���ܵĳ�ʼֵx0
%      3.ˮӡ���ܵĿ��Ʋ���u
%      4.ˮӡ���ܵĵ�������n
%����� 1.���ܺ��ˮӡ��Ϣ���У�watermark

function[watermark] = text_watermark_generate_and_encrypt(W,kw_x0,kw_u,kw_n)

%���Ƚ�cellת��Ϊ�ַ�������
char_W = char(W);
[l,r] = size(char_W);
    
%ˮӡ��ϢΪ����ʱ
%��ˮӡ��Ϊ������char����
dec_W = abs(char_W); %������ת��Ϊunicode����
dec_W_n = zeros(l,r+1);
%Ϊÿһ�е�ĩβ���ϻ��з���unicode����13
for i = 1:l
    dec_W_n(i,:) = [dec_W(i,:) 13];
end

%��dec_W_n����Ϊ��������
dec_W_n = dec_W_n'; %reshapeǰ��ת��
S_dec_W_n = reshape(dec_W_n,1,l*(r+1));

bin_W = dec2bin(S_dec_W_n,16);%��ʮ���Ʊ���ת��Ϊ�����Ʊ��룬ÿ16λ��ʾһ������
[h,w] = size(bin_W); 
L_W = h*w; %������ˮӡ��Ϣ�ĳ���
bin_W = bin_W';%reshapeǰ���Ƚ���ת��
S_bin_W = reshape(bin_W,1,L_W);%�������Ʊ���ת��Ϊһάchar���У�ÿ16λ��ʾһ������
S_W = zeros(1,L_W); %���ڴ���ˮӡ�����Ʊ��������
for i = 1:L_W
    S_W(i) = str2double(S_bin_W(i)); %��ԭchar����ת��Ϊdouble����
end

%���ˮӡͷ����16λ���ֱ�Ϊ1��ˮӡ������ 2�����������)
TYPE_info = 1; %���ֵ��������ͱ��Ϊ1
Encoding = 1; %Ŀǰ���õ���unicode���룬���ͺ�Ϊ1
dec_Head = [TYPE_info Encoding]; %����ͷʮ����
bin_Head = dec2bin(dec_Head,8);%������8λ�����Ʊ�ʾ
[h,w] = size(bin_Head); 
L_H = h*w;
bin_Head = bin_Head';%reshapeǰ���ȶ�ͷ������ת��
S_bin_Head = reshape(bin_Head,1,L_H);%�������Ʊ���ת��Ϊһάchar���У�ÿ����8λ
S_Head = zeros(1,L_H); %���ڴ���ˮӡ�����Ʊ��������
for i = 1:L_H
    S_Head(i) = str2double(S_bin_Head(i)); %��ԭchar����ת��Ϊdouble����
end

%ƴ��ˮӡ����ˮӡͷ
S_HW = [S_Head S_W];

%����ˮӡ��Ϣ
[watermark,~,~,~] = Logistic_position_encryption(S_HW,kw_x0,kw_u,kw_n);




