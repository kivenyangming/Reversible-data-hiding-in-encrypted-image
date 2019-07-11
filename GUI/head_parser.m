%对加密后图像头部进行处理
%输入：1.加密后图像的矩阵：M_encrypted_image
%      2.头部解密的初始值Kse_x0
%      3.头部解密的控制参数Kse_u
%      4.头部解密的迭代次数Kse_n
%输出：1.M1''的长度：L_M1_2
%     2.M4的长度：L_M4
%     3.峰值点的值：P
%     4.零值点的值：Z
%     5.头部序列的长度的十进制表示：dec_k

function[L_M1_2,L_M4,P,Z,dec_k] = head_parser(M_encrypted_image,Kse_x0,Kse_u,Kse_n)

% M = imread('lena_encrypted.bmp');
% Kse_x0 = x0_Head;
% Kse_u = u_Head;
% Kse_n = n_Head;

M = M_encrypted_image;

[h w] = size(M);

%求得头部序列的长度k
bin_a = ceil(log2(h)+log2(w));
bin_b = bin_a;
dec_k_a_and_b = ceil((bin_a + bin_a)/8);
dec_k = dec_k_a_and_b + 2;

%从M中取出头部序列
M = M';  %！！！先转置再reshape（因之前reshape后进行了转置操作）
S_M = reshape(M,1,h*w);
Head_e = S_M(1:dec_k);

%将头部序列解密
[Head] = Logistic_position_decryption(Head_e,Kse_x0,Kse_u,Kse_n);

%将头部序列各部分复原(从后往前取)
L_M1_2_and_L_M4 = Head(1:dec_k_a_and_b); %L_M1_2与L_M4一起拼接成的序列
num_of_ParseZero = dec_k_a_and_b*8 - bin_a - bin_b;%之前补上的零的个数
bin_L_M1_2_and_L_M4 = [];
for i = 1:dec_k_a_and_b
    bin_temp = dec2bin(L_M1_2_and_L_M4(i),8);
    bin_L_M1_2_and_L_M4 = [bin_L_M1_2_and_L_M4 bin_temp];
end

L_M1_2 = bin2dec(bin_L_M1_2_and_L_M4((num_of_ParseZero+1):(num_of_ParseZero+bin_a)));
L_M4 = bin2dec(bin_L_M1_2_and_L_M4((num_of_ParseZero+bin_a+1):(num_of_ParseZero+bin_a+bin_b)));

    
%将P、Z复原
P = Head(dec_k_a_and_b+1);
Z = Head(dec_k_a_and_b+2);

