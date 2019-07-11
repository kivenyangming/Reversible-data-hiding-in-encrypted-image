%ˮӡǶ��
%���룺1.���ܺ��ˮӡ���У�watermark
%      2.���ܺ�ͼ��ľ���M_encrypted_image
%      3.ͷ�����ܵĳ�ʼֵKse_x0
%      4.ͷ�����ܵĿ��Ʋ���Kse_u
%      5.ͷ�����ܵĵ�������Kse_n
%      6.����Ƕ����Կ�ĳ�ʼֵKp_x0
%      7.����Ƕ����Կ�Ŀ��Ʋ���Kp_u
%      8.����Ƕ����Կ�ĵ�������Kp_n

%���: 1.Ƕ��ˮӡ���ͼ��M_marked_encrypted_image
%      2.Ƕ�����������bool_embed(1���ɹ���0��ʧ��)

function[M_marked_encrypted_image,bin_L_embeded_Tail_encrypted] = watermark_embed(watermark,M_encrypted_image,Kse_x0,Kse_u,Kse_n,Kp_x0,Kp_u,Kp_n)

% M_encrypted_image = imread('brain2_encrypted.bmp');
% Kp_x0 = 0.1;
% Kp_u = 4;
% Kp_n = 100;
% Kse_x0 = 0.2785;
% Kse_u = 3.81422;
% Kse_n = 292;

%watermark = [1 2 3 4 5];

%��ȡͼ��ĳ��Ϳ�
[h,w] = size(M_encrypted_image);

%��������ͷ������ȡ��ֵ��P����ֵ��Z����Ϣ
[L_M1_2,L_M4,P,Z,dec_k] = head_parser(M_encrypted_image,Kse_x0,Kse_u,Kse_n);

%�Ӽ��ܺ��ͼ�������ȡ�����ܺ���в���β������
M_encrypted_image = M_encrypted_image';  %��������ת����reshape����֮ǰreshape�������ת�ò�����
S_encrypted_image = reshape(M_encrypted_image,1,h*w);
Tail_e = S_encrypted_image((dec_k+L_M1_2+L_M4+1):end);

%��������Ƕ����ԿKp���ѡȡ����Ƕ��ĵ�ͼ����A
L_Tail_e = length(Tail_e); %���ܺ�β�����е��ܳ���
A = zeros; %ѡ���ĵ�ͼ����A
j = 1; %A�ļ�����ֵ
x = Kp_x0;%����ʼֵ
n = 0; %nΪx*10������λ��ȡ��
%������x��Kp_x0��ʼ����Kp_n�Σ��ﵽ��ֻ���״̬
for i = 1:Kp_n
    x=Kp_u*x*(1-x);
end
%Ȼ���ɵ�ǰx��ʼ�������ɵ�ͼ����A
for i = 1:L_Tail_e
    x=Kp_u*x*(1-x);
    n = floor(10*x);
    if mod(n,5) ~= 0 %��n��Ϊ5�ı���    %����ͨ���޸ı����Ļ�ֵ�����Ƽ����Ժ�Ƕ������֮��Ĺ�ϵ�����罫2��Ϊ5�����������ص����٣��������Ի���֮���ͣ�
        A(j) = i; %��ǰ��һλ������������
        j = j + 1;
    else     %��nΪż��
        continue; %��ǰ��һλ��������������
    end
end

%����ѡȡ�ĵ�ͼ����A�ڼ��ܺ��β������Tail_e��ѡ��ҪǶ�����ݵ�����Tail_s
Tail_s = zeros;
for i = 1:length(A)
    Tail_s(i) = Tail_e(A(i));
end
        
% %��������Ƕ����ԿKp���ѡȡ����Ƕ�����ʼ��
% x=Kp_x0;  %����ʼֵ
% for i=1:Kp_n    %����Kp_n�Σ��ﵽ��ֻ���״̬
%     x=Kp_u*x*(1-x);
% end
% start_point = floor(mod(x*100,50))+2; %��ʼ�������е�2����51��Ԫ�������ѡȡ
% 
% %�õ���Ƕ�����ݵ�����
% if length(Tail_e) > 50
%     Tail_s = Tail_e(start_point:end); 
% else
%     display('β�����г��Ȳ���');
% end

%���Ƕ�����ݵ�����Tail_s��Ƕ������
[Tail_marked,L_embeded_Tail] = sequence_watermark_embed(Tail_s,watermark,P,Z);
L_embeded_Tail
%��Kp����L_embeded_Tail
bin_L_embeded_Tail = dec2bin(L_embeded_Tail); %��ȡL_embeded_Tail�Ķ���������
s_bin_L_embeded_Tail = zeros(1,length(bin_L_embeded_Tail)); %���������L_embeded_Tail��double����
for i = 1:length(bin_L_embeded_Tail)
    s_bin_L_embeded_Tail(i) = str2double(bin_L_embeded_Tail(i)); %��ԭchar����ת��Ϊdouble����
end
[s_bin_L_embeded_Tail_encrypted,~,~,~] = Logistic_position_encryption(s_bin_L_embeded_Tail,Kp_x0,Kp_u,Kp_n) %�Զ�����L_embeded_Tail����Logistic���Ҽ���
bin_L_embeded_Tail_encrypted = '';%���������L_embeded_Tail_encrypted���ַ�������
for i = 1:length(s_bin_L_embeded_Tail_encrypted)
    bin_L_embeded_Tail_encrypted(i) = num2str(s_bin_L_embeded_Tail_encrypted(i)); %�ٽ����ܵõ���double����ת��Ϊchar����
end
    

%��Ƕ�����ݺ������Tail_marked��ֵ�����Ӧλ�õ�Tail_e,�õ�Ƕ�����ݺ��β������Tail_m
Tail_m = Tail_e;
for i = 1:length(A)
    Tail_m(A(i)) = Tail_marked(i);
end

%�ع��Իָ����ܺ��ͼ�����
S_marked_encrypted_image = [S_encrypted_image(1:(dec_k+L_M1_2+L_M4)) Tail_m]; %�õ�Ƕ�����ݺ�ļ�������
M_marked_encrypted_image = reshape(S_marked_encrypted_image,h,w); %������ת��Ϊ����
M_marked_encrypted_image = M_marked_encrypted_image'; %����ת�õõ�ˮӡǶ���ļ���ͼ�����

%��ʾǶ�����ݺ��ͼ��
% imshow(M_marked_encrypted_image);


