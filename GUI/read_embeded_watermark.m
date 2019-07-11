%读出图片中的加密过的水印信息
%输入：1.嵌入水印后的图片：M_marked_encrypted_image
%      2.头部解密的初始值Kse_x0
%      3.头部解密的控制参数Kse_u
%      4.头部解密的迭代次数Kse_n
%      5.数据嵌入密钥的初始值Kp_x0
%      6.数据嵌入密钥的控制参数Kp_u
%      7.数据嵌入密钥的迭代次数Kp_n
%      8.实际数据嵌入长度：Kp_l
%输出：1.读取到的加密后的水印信息序列：encrypted_wartermark_sequence

function[encrypted_wartermark_sequence] = read_embeded_watermark(M_marked_encrypted_image,Kse_x0,Kse_u,Kse_n,Kp_x0,Kp_u,Kp_n,Kp_l)

% M_marked_encrypted_image = imread('brain_encrypted_encrypted_marked.BMP');
% Kse_x0 = 0.814720;
% Kse_u = 3.961370;
% Kse_n = 126;
% 
% Kp_x0 = 0.814720;
% Kp_u = 3.961370; 
% Kp_n = 126;
% Kp_l = 156;

%对有关变量赋值
bin_L_embeded_Tail_encrypted = char(Kp_l);
M = M_marked_encrypted_image;

%用Kp解密出L_embeded_Tail
s_bin_L_embeded_Tail_encrypted = zeros(1,length(bin_L_embeded_Tail_encrypted));%储存二进制L_embeded_Tail_encrypted的double序列
for i = 1:length(bin_L_embeded_Tail_encrypted)
    s_bin_L_embeded_Tail_encrypted(i) = str2double(bin_L_embeded_Tail_encrypted(i)); %将原char序列转换为double序列
end
[s_bin_L_embeded_Tail] = Logistic_position_decryption(s_bin_L_embeded_Tail_encrypted,Kp_x0,Kp_u,Kp_n); %对二进制L_embeded_Tail_encrypted进行Logistic置乱解密
L_embeded_Tail = 0; %初始化L_embeded_Tail
L_s_bin_L_embeded_Tail = length(s_bin_L_embeded_Tail); %s_bin_L_embeded_Tail的长度
for i = 1:L_s_bin_L_embeded_Tail
    L_embeded_Tail = L_embeded_Tail + s_bin_L_embeded_Tail(L_s_bin_L_embeded_Tail+1-i) * (2^(i-1)); %将二进制转换为十进制数
end

%首先根据头部密钥解析出头部信息
[L_M1_2,L_M4,P,Z,dec_k] = head_parser(M,Kse_x0,Kse_u,Kse_n);

%接着提取出尾部序列
[h,w] = size(M);
M = M';  %！！！先转置再reshape（因之前reshape后进行了转置操作）
S_encrypted_image = reshape(M,1,h*w);
Tail_e = S_encrypted_image((dec_k+L_M1_2+L_M4+1):end);

%根据数据嵌入密钥Kp随机选取数据嵌入的地图集合A
L_Tail_e = length(Tail_e); %加密后尾部序列的总长度
A = zeros; %选出的地图集合A
j = 1; %A的计数初值
x = Kp_x0;%赋初始值
n = 0; %n为x*10的整数位下取整
%首先让x由Kp_x0开始迭代Kp_n次，达到充分混沌状态
for i = 1:Kp_n
    x=Kp_u*x*(1-x);
end
%然后由当前x开始迭代生成地图集合A
for i = 1:L_Tail_e
    x=Kp_u*x*(1-x);
    n = floor(10*x);
    if mod(n,5) ~= 0 %若n不为2的倍数    %可以通过修改倍数的基值来控制加密性和嵌入容量之间的关系（比如将2改为5，跳过的像素点会减少，但保密性会随之降低）
        A(j) = i; %当前这一位将被用来加密
        j = j + 1;
    else     %若n为偶数
        continue; %当前这一位将不被用来加密
    end
end

%根据选取的地图集合A在加密后的尾部序列Tail_e中选择嵌入了数据的序列Tail_m
Tail_m = zeros;
for i = 1:length(A)
    Tail_m(i) = Tail_e(A(i));
end

%读取嵌入的数据
encrypted_wartermark_sequence = zeros;
j = 1; %用于encrypted_wartermark_sequence的位置计数
if P>Z   %当P>Z时
    for i = 1:L_embeded_Tail    %只需读取实际加密过的序列即可
        if Tail_m(i) == P
            encrypted_wartermark_sequence(j) = 0; %当读到像素值的为P时，提取0
            j = j + 1;
        elseif Tail_m(i) == P-1
            encrypted_wartermark_sequence(j) = 1; %当读到像素值的为P-1时，提取1
            j = j + 1;
        else
            continue;      %当读到的像素值为其它像素值时，不操作
        end
    end
elseif P<Z   %当P<Z时
    for i = 1:L_embeded_Tail    %只需读取实际加密过的序列即可
        if Tail_m(i) == P
            encrypted_wartermark_sequence(j) = 0; %当读到像素值的为P时，提取0
            j = j + 1;
        elseif Tail_m(i) == P+1
            encrypted_wartermark_sequence(j) = 1; %当读到像素值的为P+1时，提取1
            j = j + 1;
        else
            continue;     %当读到的像素值为其它像素值时，不操作
        end
    end
else
    disp('error');
end





