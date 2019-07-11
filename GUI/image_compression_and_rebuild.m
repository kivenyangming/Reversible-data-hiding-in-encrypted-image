%ͼ���ѹ�����ع�
%���룺1.ͼ���·��
%�����1.�ع����ͼ�����
%     2.�ع���ͼ���ͷ�����У�Head
%     3.�ع���ͼ����в����У�Body
%     4.�ع���ͼ���β�����У�Tail

function[M_Rebuild_image,Head,Body,Tail] = image_compression_and_rebuild(image_directory)

%image_directory ='brain2.bmp';

%���Ƚ�ͼƬ��Ϊ�ߵ�����λƽ��M1���ߣ���M2���ͣ�
[M1,M2,origin_image_height,origin_image_width] = image_bit_plane_sep_high_and_low(image_directory);

%������λƽ��M1����RLE�γ̱���ѹ�����õ�M1ѹ��������'��M1_1��
[M1_1] = high_bit_plane_RLC(M1);

%��M1'��������λ������ƴ�ӣ��õ�ƴ�Ӻ�����M1''��M1_2��
[M1_2] = conbine_adjacent_bits(M1_1);
%������M1''����L_M1_2
L_a = ceil(log2(origin_image_height)+log2(origin_image_width));
L_M1_2 = zeros(1,L_a);
L_M1_2_dec = length(M1_2); %edited
L_M1_2_bin = dec2bin(L_M1_2_dec,L_a);
for i = 1:L_a
    L_M1_2(i) = str2double(L_M1_2_bin(i));
end

%������λƽ��M2��������λ������ƴ�ӣ��õ�ƴ�Ӻ������M2'(M2_1)
[M2_1] = conbine_adjacent_bits(M2);

%ͳ��M2'�ķ�ֵ�����ֵ����ϢZ��P���Լ���Сֵ��λ����Ϣ����M4������M4�ĳ���L_M4
[Z,P,M4,L_M4,L_M4_dec] = record_max_and_min_and_min_position_info(M2_1,origin_image_height,origin_image_width); %edited

%��װ�ع����е�ͷ��
k_a_and_b = ceil((L_a + L_a)/8); %a,b��������λ��,a,b������ͬ
L_a_and_b = 8*k_a_and_b; %a,b���������λ��
Head_Padding_Zeros = zeros(1,L_a_and_b-L_a-L_a); %ͷ��L_M1''��L_M4ǰ����������
Head_L_M1_2_and_L_M4_binary = [Head_Padding_Zeros L_M1_2 L_M4]; %ͷ��L_M1''��L_M4�Ķ���������
M_8bits_bin2dec = [128;64;32;16;8;4;2;1];%8λ������->ʮ����ת����������
M_Head_L_M1_2_and_L_M4_binary = reshape(Head_L_M1_2_and_L_M4_binary,8,k_a_and_b);
M_Head_L_M1_2_and_L_M4_binary = M_Head_L_M1_2_and_L_M4_binary';
Head_L_M1_2_and_L_M4_dec_column = M_Head_L_M1_2_and_L_M4_binary*M_8bits_bin2dec;%ͷ��L_M1''��L_M4��ʮ����������
Head_L_M1_2_and_L_M4_dec = reshape(Head_L_M1_2_and_L_M4_dec_column,1,k_a_and_b);%ͷ��L_M1''��L_M4��ʮ��������
Head = [Head_L_M1_2_and_L_M4_dec P Z]; %�ع����е�ͷ�� %edited
k = k_a_and_b + 2; %�ع�����ͷ���ĳ���

%���ɷ�ֵ�������M3
L_rebuild_sequence = origin_image_height*origin_image_width;
L_M3 = L_rebuild_sequence/2 - k - L_M1_2_dec - L_M4_dec;
M3 = repmat(P,1,L_M3);

%�����ع�����
Rebuild_sequence = [Head M1_2 M4 M3 M2_1];

% %�����ع�ͼ��ľ���
M_Rebuild_image = reshape(Rebuild_sequence,origin_image_height,origin_image_width);
M_Rebuild_image = M_Rebuild_image';

% M = imread(image_directory);
% subplot(2,2,1);
% imshow(M,[]);
% title('ԭʼͼ��');
% 
% subplot(2,2,2);
% imshow(M_Rebuild_image,[]);
% imti = '�ع�ͼ��';
% title(imti);
% 
% subplot(2,2,3);
% imhist(M);
% imti = 'ԭʼͼ��ֱ��ͼ';
% title(imti);
% 
% subplot(2,2,4);
% hist(Rebuild_sequence,0:255);
% %imhist(M_Rebuild_image);
% imti = '�ع�ͼ��ֱ��ͼ';
% title(imti);

%�����ع�ͼ���ͷ�����в���β������
Head = Head;
Body = [M1_2 M4];
Tail = [M3 M2_1];








