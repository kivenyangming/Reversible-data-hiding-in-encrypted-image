%�����ı�ˮӡ��Ϣ����ȡ��ֵ
%���룺 1.ˮӡ��Ϣ���У�watermark
%      3.ˮӡ���ܵĳ�ʼֵkw_x0
%      4.ˮӡ���ܵĿ��Ʋ���kw_u
%      5.ˮӡ���ܵĵ�������kw_n
%����� 1.���ܺ���ı���Ϣ��text

function[text] = text_watermark_decrypt_and_parse(watermark,kw_x0,kw_u,kw_n)

%���ȶ�ˮӡ��Ϣ���н��н���
[watermark_d] = Logistic_position_decryption(watermark,kw_x0,kw_u,kw_n);

%��ȡ���ܺ��ˮӡ��Ϣͷ�����ı���Ϣ����
watermark_Head = watermark_d(1:16);
watermark_Body = watermark_d(17:end);

%��ȡ�ı�ˮӡ�ı�������
s_encoding = watermark_Head(9:16);%��ʾˮӡ���������
v_convert8 = [128;64;32;16;8;4;2;1]; %���ڶ���������תʮ�������е�����
encoding = s_encoding*v_convert8; %��ȡ�������ͺ�

%���ݱ������ͺŽ�������
switch encoding
    case 1   %��Ϊunicode����ʱ
        %���ȼ��õ��������Ƿ�����
        if mod(length(watermark_Body),16) ~= 0
            display('���ݲ�����������');
        end
        %׼���÷����ֵ��ַ���
        text(1:(length(watermark_Body))/16) = ' ';
        %ÿ16��������λΪһ�飬������ȡ������Ϣ
        v_convert16 = [32768;16384;8192;4096;2048;1024;512;256;128;64;32;16;8;4;2;1];
        j = 1; %text��������
        for i = 1:16:(length(watermark_Body)-15)
            dec_character = watermark_Body(i:(i+15))*v_convert16;
%             text = strcat(text,char(dec_character));
            char_character = char(dec_character);
            text(j) = char_character; %��j���ַ�Ϊ��ǰ�õ����ַ�
            j = j + 1; %j����1
        end
end
            
        
        