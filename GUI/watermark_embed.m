%水印嵌入
%输入：1.加密后的水印序列：watermark
%      2.加密后图像的矩阵：M_encrypted_image
%      3.头部解密的初始值Kse_x0
%      4.头部解密的控制参数Kse_u
%      5.头部解密的迭代次数Kse_n
%      6.数据嵌入密钥的初始值Kp_x0
%      7.数据嵌入密钥的控制参数Kp_u
%      8.数据嵌入密钥的迭代次数Kp_n

%输出: 1.嵌入水印后的图像：M_marked_encrypted_image
%      2.嵌入情况变量：bool_embed(1：成功；0：失败)

function[M_marked_encrypted_image,bin_L_embeded_Tail_encrypted] = watermark_embed(watermark,M_encrypted_image,Kse_x0,Kse_u,Kse_n,Kp_x0,Kp_u,Kp_n)

% M_encrypted_image = imread('brain2_encrypted.bmp');
% Kp_x0 = 0.1;
% Kp_u = 4;
% Kp_n = 100;
% Kse_x0 = 0.2785;
% Kse_u = 3.81422;
% Kse_n = 292;

%watermark = [1 2 3 4 5];

%获取图像的长和宽
[h,w] = size(M_encrypted_image);

%解析矩阵头部，获取峰值点P，零值点Z等信息
[L_M1_2,L_M4,P,Z,dec_k] = head_parser(M_encrypted_image,Kse_x0,Kse_u,Kse_n);

%从加密后的图像矩阵中取出加密后的中部与尾部序列
M_encrypted_image = M_encrypted_image';  %！！！先转置再reshape（因之前reshape后进行了转置操作）
S_encrypted_image = reshape(M_encrypted_image,1,h*w);
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
    if mod(n,5) ~= 0 %若n不为5的倍数    %可以通过修改倍数的基值来控制加密性和嵌入容量之间的关系（比如将2改为5，跳过的像素点会减少，但保密性会随之降低）
        A(j) = i; %当前这一位将被用来加密
        j = j + 1;
    else     %若n为偶数
        continue; %当前这一位将不被用来加密
    end
end

%根据选取的地图集合A在加密后的尾部序列Tail_e中选择要嵌入数据的序列Tail_s
Tail_s = zeros;
for i = 1:length(A)
    Tail_s(i) = Tail_e(A(i));
end
        
% %根据数据嵌入密钥Kp随机选取数据嵌入的起始点
% x=Kp_x0;  %赋初始值
% for i=1:Kp_n    %迭代Kp_n次，达到充分混沌状态
%     x=Kp_u*x*(1-x);
% end
% start_point = floor(mod(x*100,50))+2; %起始点在序列第2到第51个元素中随机选取
% 
% %得到待嵌入数据的序列
% if length(Tail_e) > 50
%     Tail_s = Tail_e(start_point:end); 
% else
%     display('尾部序列长度不足');
% end

%向待嵌入数据的序列Tail_s中嵌入数据
[Tail_marked,L_embeded_Tail] = sequence_watermark_embed(Tail_s,watermark,P,Z);
L_embeded_Tail
%用Kp加密L_embeded_Tail
bin_L_embeded_Tail = dec2bin(L_embeded_Tail); %获取L_embeded_Tail的二进制序列
s_bin_L_embeded_Tail = zeros(1,length(bin_L_embeded_Tail)); %储存二进制L_embeded_Tail的double序列
for i = 1:length(bin_L_embeded_Tail)
    s_bin_L_embeded_Tail(i) = str2double(bin_L_embeded_Tail(i)); %将原char序列转换为double序列
end
[s_bin_L_embeded_Tail_encrypted,~,~,~] = Logistic_position_encryption(s_bin_L_embeded_Tail,Kp_x0,Kp_u,Kp_n) %对二进制L_embeded_Tail进行Logistic置乱加密
bin_L_embeded_Tail_encrypted = '';%储存二进制L_embeded_Tail_encrypted的字符串序列
for i = 1:length(s_bin_L_embeded_Tail_encrypted)
    bin_L_embeded_Tail_encrypted(i) = num2str(s_bin_L_embeded_Tail_encrypted(i)); %再将加密得到的double序列转换为char序列
end
    

%将嵌入数据后的序列Tail_marked的值赋予对应位置的Tail_e,得到嵌入数据后的尾部序列Tail_m
Tail_m = Tail_e;
for i = 1:length(A)
    Tail_m(A(i)) = Tail_marked(i);
end

%重构以恢复加密后的图像矩阵
S_marked_encrypted_image = [S_encrypted_image(1:(dec_k+L_M1_2+L_M4)) Tail_m]; %得到嵌入数据后的加密序列
M_marked_encrypted_image = reshape(S_marked_encrypted_image,h,w); %将序列转换为矩阵
M_marked_encrypted_image = M_marked_encrypted_image'; %矩阵转置得到水印嵌入后的加密图像矩阵

%显示嵌入数据后的图像
% imshow(M_marked_encrypted_image);


