%生成文本水印信息并加密
%输入： 1.水印信息：W
%      2.水印加密的初始值x0
%      3.水印加密的控制参数u
%      4.水印加密的迭代次数n
%输出： 1.加密后的水印信息序列：watermark

function[watermark] = text_watermark_generate_and_encrypt(W,kw_x0,kw_u,kw_n)

%首先将cell转化为字符串序列
char_W = char(W);
[l,r] = size(char_W);
    
%水印信息为文字时
%将水印化为二进制char序列
dec_W = abs(char_W); %将汉字转化为unicode编码
dec_W_n = zeros(l,r+1);
%为每一行的末尾加上换行符的unicode编码13
for i = 1:l
    dec_W_n(i,:) = [dec_W(i,:) 13];
end

%将dec_W_n重组为单行序列
dec_W_n = dec_W_n'; %reshape前先转置
S_dec_W_n = reshape(dec_W_n,1,l*(r+1));

bin_W = dec2bin(S_dec_W_n,16);%将十进制编码转换为二进制编码，每16位表示一个汉字
[h,w] = size(bin_W); 
L_W = h*w; %二进制水印信息的长度
bin_W = bin_W';%reshape前需先进行转置
S_bin_W = reshape(bin_W,1,L_W);%将二进制编码转换为一维char序列，每16位表示一个汉字
S_W = zeros(1,L_W); %用于储存水印二进制编码的数组
for i = 1:L_W
    S_W(i) = str2double(S_bin_W(i)); %将原char序列转换为double序列
end

%标记水印头（共16位，分别为1：水印的类型 2：编码的类型)
TYPE_info = 1; %文字的数据类型标记为1
Encoding = 1; %目前采用的是unicode编码，类型号为1
dec_Head = [TYPE_info Encoding]; %数据头十进制
bin_Head = dec2bin(dec_Head,8);%数据由8位二进制表示
[h,w] = size(bin_Head); 
L_H = h*w;
bin_Head = bin_Head';%reshape前需先对头部进行转置
S_bin_Head = reshape(bin_Head,1,L_H);%将二进制编码转换为一维char序列，每个数8位
S_Head = zeros(1,L_H); %用于储存水印二进制编码的数组
for i = 1:L_H
    S_Head(i) = str2double(S_bin_Head(i)); %将原char序列转换为double序列
end

%拼接水印及其水印头
S_HW = [S_Head S_W];

%加密水印信息
[watermark,~,~,~] = Logistic_position_encryption(S_HW,kw_x0,kw_u,kw_n);




