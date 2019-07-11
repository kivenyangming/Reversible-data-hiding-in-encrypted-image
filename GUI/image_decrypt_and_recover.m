%对图像进行解密和逆重构
%输入：1.重构加密后的图像的路径：encrypted_image_directory
%     2.头部加密密钥Kse（包括Kse_x0、Kse_u、Kse_n）
%     2.中尾部加密密钥Ken（包括Ken_x0、Ken_u、Ken_n）
%输出：解密逆重构后的图像：M

function[M] = image_decrypt_and_recover(encrypted_image_directory,Kse_x0,Kse_u,Kse_n,Ken_x0,Ken_u,Ken_n)


%读取加密后的图像
% encrypted_image_directory = 'lena_encrypted.bmp';
M_encrypted_image = imread(encrypted_image_directory);
[h,w]=size(M_encrypted_image);

%首先解密头部序列并读取其中信息
[L_M1_2,L_M4,P,Z,dec_k] = head_parser(M_encrypted_image,Kse_x0,Kse_u,Kse_n);

%从加密后的图像矩阵中取出加密后的中部和尾部序列
M_encrypted_image = M_encrypted_image';  %！！！先转置再reshape（因之前reshape后进行了转置操作）
S_encrypted_image = reshape(M_encrypted_image,1,h*w);
Body_e = S_encrypted_image((dec_k+1):(dec_k+L_M1_2+L_M4));
Tail_e = S_encrypted_image((dec_k+L_M1_2+L_M4+1):end);

%将读取到的加密后图像的中尾部解密
[Body_d] = Logistic_position_decryption(Body_e,Ken_x0,Ken_u,Ken_n);
[Tail_d] = Logistic_position_decryption(Tail_e,Ken_x0,Ken_u,Ken_n);

%提取M1''和M2'
M1_2 = Body_d(1:L_M1_2);%将M1''由中部序列中提取出来
L_M3 = h*w/2 - dec_k - L_M1_2 - L_M4;  %计算尾部M3的长度
M2_1 = Tail_d(L_M3+1:end);%将M2'由尾部序列中提取出来

%进行相邻二进制拼接的逆操作,得到M1'和M2
[M1_1] = separate_adjacent_bits(M1_2);
[S_M2] = separate_adjacent_bits(M2_1); %逆合并操作仅得到M2的序列
M2 = reshape(S_M2,w,h);  %因reshape函数的特性，要由序列得到m行n列的矩阵，要先将序列reshape为n行m列的矩阵
M2 = M2';    %再对得到的矩阵进行转置操作，得到m行n列的矩阵

%对M1'进行解压缩操,得到M1的序列
[S_M1] = RLC_decompress(M1_1);

%将M1的序列还原为h*w的矩阵
M1 = reshape(S_M1,h,w);
M1 = M1';

%将M1、M2两位平面合并得到原图像M
M = zeros(h,w); %初始化M矩阵
for i = 1:h
    for j = 1:w
        M(i,j) = M1(i,j)*16+M2(i,j);
    end
end

imshow(M,[]);






