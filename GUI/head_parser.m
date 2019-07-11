%�Լ��ܺ�ͼ��ͷ�����д���
%���룺1.���ܺ�ͼ��ľ���M_encrypted_image
%      2.ͷ�����ܵĳ�ʼֵKse_x0
%      3.ͷ�����ܵĿ��Ʋ���Kse_u
%      4.ͷ�����ܵĵ�������Kse_n
%�����1.M1''�ĳ��ȣ�L_M1_2
%     2.M4�ĳ��ȣ�L_M4
%     3.��ֵ���ֵ��P
%     4.��ֵ���ֵ��Z
%     5.ͷ�����еĳ��ȵ�ʮ���Ʊ�ʾ��dec_k

function[L_M1_2,L_M4,P,Z,dec_k] = head_parser(M_encrypted_image,Kse_x0,Kse_u,Kse_n)

% M = imread('lena_encrypted.bmp');
% Kse_x0 = x0_Head;
% Kse_u = u_Head;
% Kse_n = n_Head;

M = M_encrypted_image;

[h w] = size(M);

%���ͷ�����еĳ���k
bin_a = ceil(log2(h)+log2(w));
bin_b = bin_a;
dec_k_a_and_b = ceil((bin_a + bin_a)/8);
dec_k = dec_k_a_and_b + 2;

%��M��ȡ��ͷ������
M = M';  %��������ת����reshape����֮ǰreshape�������ת�ò�����
S_M = reshape(M,1,h*w);
Head_e = S_M(1:dec_k);

%��ͷ�����н���
[Head] = Logistic_position_decryption(Head_e,Kse_x0,Kse_u,Kse_n);

%��ͷ�����и����ָ�ԭ(�Ӻ���ǰȡ)
L_M1_2_and_L_M4 = Head(1:dec_k_a_and_b); %L_M1_2��L_M4һ��ƴ�ӳɵ�����
num_of_ParseZero = dec_k_a_and_b*8 - bin_a - bin_b;%֮ǰ���ϵ���ĸ���
bin_L_M1_2_and_L_M4 = [];
for i = 1:dec_k_a_and_b
    bin_temp = dec2bin(L_M1_2_and_L_M4(i),8);
    bin_L_M1_2_and_L_M4 = [bin_L_M1_2_and_L_M4 bin_temp];
end

L_M1_2 = bin2dec(bin_L_M1_2_and_L_M4((num_of_ParseZero+1):(num_of_ParseZero+bin_a)));
L_M4 = bin2dec(bin_L_M1_2_and_L_M4((num_of_ParseZero+bin_a+1):(num_of_ParseZero+bin_a+bin_b)));

    
%��P��Z��ԭ
P = Head(dec_k_a_and_b+1);
Z = Head(dec_k_a_and_b+2);

