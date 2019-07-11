%解密文本水印信息并读取其值
%输入： 1.水印信息序列：watermark
%      3.水印加密的初始值kw_x0
%      4.水印加密的控制参数kw_u
%      5.水印加密的迭代次数kw_n
%输出： 1.解密后的文本信息：text

function[text] = text_watermark_decrypt_and_parse(watermark,kw_x0,kw_u,kw_n)

%首先对水印信息序列进行解密
[watermark_d] = Logistic_position_decryption(watermark,kw_x0,kw_u,kw_n);

%获取解密后的水印信息头部和文本信息部分
watermark_Head = watermark_d(1:16);
watermark_Body = watermark_d(17:end);

%获取文本水印的编码类型
s_encoding = watermark_Head(9:16);%表示水印编码的序列
v_convert8 = [128;64;32;16;8;4;2;1]; %用于二进制序列转十进制序列的向量
encoding = s_encoding*v_convert8; %获取编码类型号

%根据编码类型号解析数据
switch encoding
    case 1   %当为unicode编码时
        %首先检测得到的数据是否完整
        if mod(length(watermark_Body),16) ~= 0
            display('数据不完整或已损坏');
        end
        %准备好放文字的字符串
        text(1:(length(watermark_Body))/16) = ' ';
        %每16个二进制位为一组，逐组提取文字信息
        v_convert16 = [32768;16384;8192;4096;2048;1024;512;256;128;64;32;16;8;4;2;1];
        j = 1; %text计数变量
        for i = 1:16:(length(watermark_Body)-15)
            dec_character = watermark_Body(i:(i+15))*v_convert16;
%             text = strcat(text,char(dec_character));
            char_character = char(dec_character);
            text(j) = char_character; %第j个字符为当前得到的字符
            j = j + 1; %j自增1
        end
end
            
        
        