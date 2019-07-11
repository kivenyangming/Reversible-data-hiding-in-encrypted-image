%��ͼ����н��ܺ����ع�
%���룺1.�ع����ܺ��ͼ���·����encrypted_image_directory
%     2.ͷ��������ԿKse������Kse_x0��Kse_u��Kse_n��
%     2.��β��������ԿKen������Ken_x0��Ken_u��Ken_n��
%������������ع����ͼ��M

function[M] = image_decrypt_and_recover(encrypted_image_directory,Kse_x0,Kse_u,Kse_n,Ken_x0,Ken_u,Ken_n)


%��ȡ���ܺ��ͼ��
% encrypted_image_directory = 'lena_encrypted.bmp';
M_encrypted_image = imread(encrypted_image_directory);
[h,w]=size(M_encrypted_image);

%���Ƚ���ͷ�����в���ȡ������Ϣ
[L_M1_2,L_M4,P,Z,dec_k] = head_parser(M_encrypted_image,Kse_x0,Kse_u,Kse_n);

%�Ӽ��ܺ��ͼ�������ȡ�����ܺ���в���β������
M_encrypted_image = M_encrypted_image';  %��������ת����reshape����֮ǰreshape�������ת�ò�����
S_encrypted_image = reshape(M_encrypted_image,1,h*w);
Body_e = S_encrypted_image((dec_k+1):(dec_k+L_M1_2+L_M4));
Tail_e = S_encrypted_image((dec_k+L_M1_2+L_M4+1):end);

%����ȡ���ļ��ܺ�ͼ�����β������
[Body_d] = Logistic_position_decryption(Body_e,Ken_x0,Ken_u,Ken_n);
[Tail_d] = Logistic_position_decryption(Tail_e,Ken_x0,Ken_u,Ken_n);

%��ȡM1''��M2'
M1_2 = Body_d(1:L_M1_2);%��M1''���в���������ȡ����
L_M3 = h*w/2 - dec_k - L_M1_2 - L_M4;  %����β��M3�ĳ���
M2_1 = Tail_d(L_M3+1:end);%��M2'��β����������ȡ����

%�������ڶ�����ƴ�ӵ������,�õ�M1'��M2
[M1_1] = separate_adjacent_bits(M1_2);
[S_M2] = separate_adjacent_bits(M2_1); %��ϲ��������õ�M2������
M2 = reshape(S_M2,w,h);  %��reshape���������ԣ�Ҫ�����еõ�m��n�еľ���Ҫ�Ƚ�����reshapeΪn��m�еľ���
M2 = M2';    %�ٶԵõ��ľ������ת�ò������õ�m��n�еľ���

%��M1'���н�ѹ����,�õ�M1������
[S_M1] = RLC_decompress(M1_1);

%��M1�����л�ԭΪh*w�ľ���
M1 = reshape(S_M1,h,w);
M1 = M1';

%��M1��M2��λƽ��ϲ��õ�ԭͼ��M
M = zeros(h,w); %��ʼ��M����
for i = 1:h
    for j = 1:w
        M(i,j) = M1(i,j)*16+M2(i,j);
    end
end

imshow(M,[]);






