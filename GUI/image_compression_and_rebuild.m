%图像的压缩与重构
%输入：1.图像的路径
%输出：1.重构后的图像矩阵
%     2.重构后图像的头部序列：Head
%     3.重构后图像的中部序列：Body
%     4.重构后图像的尾部序列：Tail

function[M_Rebuild_image,Head,Body,Tail] = image_compression_and_rebuild(image_directory)

%image_directory ='brain2.bmp';

%首先将图片分为高低两个位平面M1（高）、M2（低）
[M1,M2,origin_image_height,origin_image_width] = image_bit_plane_sep_high_and_low(image_directory);

%将高四位平面M1运用RLE游程编码压缩，得到M1压缩后序列'（M1_1）
[M1_1] = high_bit_plane_RLC(M1);

%将M1'进行相邻位二进制拼接，得到拼接后序列M1''（M1_2）
[M1_2] = conbine_adjacent_bits(M1_1);
%并计算M1''长度L_M1_2
L_a = ceil(log2(origin_image_height)+log2(origin_image_width));
L_M1_2 = zeros(1,L_a);
L_M1_2_dec = length(M1_2); %edited
L_M1_2_bin = dec2bin(L_M1_2_dec,L_a);
for i = 1:L_a
    L_M1_2(i) = str2double(L_M1_2_bin(i));
end

%将低四位平面M2进行相邻位二进制拼接，得到拼接后的序列M2'(M2_1)
[M2_1] = conbine_adjacent_bits(M2);

%统计M2'的峰值点和零值点信息Z、P，以及最小值点位置信息序列M4，还有M4的长度L_M4
[Z,P,M4,L_M4,L_M4_dec] = record_max_and_min_and_min_position_info(M2_1,origin_image_height,origin_image_width); %edited

%组装重构序列的头部
k_a_and_b = ceil((L_a + L_a)/8); %a,b所需像素位数,a,b长度相同
L_a_and_b = 8*k_a_and_b; %a,b所需二进制位数
Head_Padding_Zeros = zeros(1,L_a_and_b-L_a-L_a); %头部L_M1''与L_M4前填充的零序列
Head_L_M1_2_and_L_M4_binary = [Head_Padding_Zeros L_M1_2 L_M4]; %头部L_M1''与L_M4的二进制序列
M_8bits_bin2dec = [128;64;32;16;8;4;2;1];%8位二进制->十进制转换算子向量
M_Head_L_M1_2_and_L_M4_binary = reshape(Head_L_M1_2_and_L_M4_binary,8,k_a_and_b);
M_Head_L_M1_2_and_L_M4_binary = M_Head_L_M1_2_and_L_M4_binary';
Head_L_M1_2_and_L_M4_dec_column = M_Head_L_M1_2_and_L_M4_binary*M_8bits_bin2dec;%头部L_M1''与L_M4的十进制列向量
Head_L_M1_2_and_L_M4_dec = reshape(Head_L_M1_2_and_L_M4_dec_column,1,k_a_and_b);%头部L_M1''与L_M4的十进制序列
Head = [Head_L_M1_2_and_L_M4_dec P Z]; %重构序列的头部 %edited
k = k_a_and_b + 2; %重构序列头部的长度

%生成峰值填充序列M3
L_rebuild_sequence = origin_image_height*origin_image_width;
L_M3 = L_rebuild_sequence/2 - k - L_M1_2_dec - L_M4_dec;
M3 = repmat(P,1,L_M3);

%生成重构序列
Rebuild_sequence = [Head M1_2 M4 M3 M2_1];

% %生成重构图像的矩阵
M_Rebuild_image = reshape(Rebuild_sequence,origin_image_height,origin_image_width);
M_Rebuild_image = M_Rebuild_image';

% M = imread(image_directory);
% subplot(2,2,1);
% imshow(M,[]);
% title('原始图像');
% 
% subplot(2,2,2);
% imshow(M_Rebuild_image,[]);
% imti = '重构图像';
% title(imti);
% 
% subplot(2,2,3);
% imhist(M);
% imti = '原始图像直方图';
% title(imti);
% 
% subplot(2,2,4);
% hist(Rebuild_sequence,0:255);
% %imhist(M_Rebuild_image);
% imti = '重构图像直方图';
% title(imti);

%生成重构图像的头部、中部和尾部序列
Head = Head;
Body = [M1_2 M4];
Tail = [M3 M2_1];








