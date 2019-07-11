%����ͼƬ�еļ��ܹ���ˮӡ��Ϣ
%���룺1.Ƕ��ˮӡ���ͼƬ��M_marked_encrypted_image
%      2.ͷ�����ܵĳ�ʼֵKse_x0
%      3.ͷ�����ܵĿ��Ʋ���Kse_u
%      4.ͷ�����ܵĵ�������Kse_n
%      5.����Ƕ����Կ�ĳ�ʼֵKp_x0
%      6.����Ƕ����Կ�Ŀ��Ʋ���Kp_u
%      7.����Ƕ����Կ�ĵ�������Kp_n
%      8.ʵ������Ƕ�볤�ȣ�Kp_l
%�����1.��ȡ���ļ��ܺ��ˮӡ��Ϣ���У�encrypted_wartermark_sequence

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

%���йر�����ֵ
bin_L_embeded_Tail_encrypted = char(Kp_l);
M = M_marked_encrypted_image;

%��Kp���ܳ�L_embeded_Tail
s_bin_L_embeded_Tail_encrypted = zeros(1,length(bin_L_embeded_Tail_encrypted));%���������L_embeded_Tail_encrypted��double����
for i = 1:length(bin_L_embeded_Tail_encrypted)
    s_bin_L_embeded_Tail_encrypted(i) = str2double(bin_L_embeded_Tail_encrypted(i)); %��ԭchar����ת��Ϊdouble����
end
[s_bin_L_embeded_Tail] = Logistic_position_decryption(s_bin_L_embeded_Tail_encrypted,Kp_x0,Kp_u,Kp_n); %�Զ�����L_embeded_Tail_encrypted����Logistic���ҽ���
L_embeded_Tail = 0; %��ʼ��L_embeded_Tail
L_s_bin_L_embeded_Tail = length(s_bin_L_embeded_Tail); %s_bin_L_embeded_Tail�ĳ���
for i = 1:L_s_bin_L_embeded_Tail
    L_embeded_Tail = L_embeded_Tail + s_bin_L_embeded_Tail(L_s_bin_L_embeded_Tail+1-i) * (2^(i-1)); %��������ת��Ϊʮ������
end

%���ȸ���ͷ����Կ������ͷ����Ϣ
[L_M1_2,L_M4,P,Z,dec_k] = head_parser(M,Kse_x0,Kse_u,Kse_n);

%������ȡ��β������
[h,w] = size(M);
M = M';  %��������ת����reshape����֮ǰreshape�������ת�ò�����
S_encrypted_image = reshape(M,1,h*w);
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
    if mod(n,5) ~= 0 %��n��Ϊ2�ı���    %����ͨ���޸ı����Ļ�ֵ�����Ƽ����Ժ�Ƕ������֮��Ĺ�ϵ�����罫2��Ϊ5�����������ص����٣��������Ի���֮���ͣ�
        A(j) = i; %��ǰ��һλ������������
        j = j + 1;
    else     %��nΪż��
        continue; %��ǰ��һλ��������������
    end
end

%����ѡȡ�ĵ�ͼ����A�ڼ��ܺ��β������Tail_e��ѡ��Ƕ�������ݵ�����Tail_m
Tail_m = zeros;
for i = 1:length(A)
    Tail_m(i) = Tail_e(A(i));
end

%��ȡǶ�������
encrypted_wartermark_sequence = zeros;
j = 1; %����encrypted_wartermark_sequence��λ�ü���
if P>Z   %��P>Zʱ
    for i = 1:L_embeded_Tail    %ֻ���ȡʵ�ʼ��ܹ������м���
        if Tail_m(i) == P
            encrypted_wartermark_sequence(j) = 0; %����������ֵ��ΪPʱ����ȡ0
            j = j + 1;
        elseif Tail_m(i) == P-1
            encrypted_wartermark_sequence(j) = 1; %����������ֵ��ΪP-1ʱ����ȡ1
            j = j + 1;
        else
            continue;      %������������ֵΪ��������ֵʱ��������
        end
    end
elseif P<Z   %��P<Zʱ
    for i = 1:L_embeded_Tail    %ֻ���ȡʵ�ʼ��ܹ������м���
        if Tail_m(i) == P
            encrypted_wartermark_sequence(j) = 0; %����������ֵ��ΪPʱ����ȡ0
            j = j + 1;
        elseif Tail_m(i) == P+1
            encrypted_wartermark_sequence(j) = 1; %����������ֵ��ΪP+1ʱ����ȡ1
            j = j + 1;
        else
            continue;     %������������ֵΪ��������ֵʱ��������
        end
    end
else
    disp('error');
end





