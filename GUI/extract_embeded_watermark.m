%��ȡͼƬ�еļ��ܹ���ˮӡ��Ϣ
%���룺1.Ƕ��ˮӡ���ͼƬ��M_marked_encrypted_image
%      2.ͷ�����ܵĳ�ʼֵKse_x0
%      3.ͷ�����ܵĿ��Ʋ���Kse_u
%      4.ͷ�����ܵĵ�������Kse_n
%      5.����Ƕ����Կ�ĳ�ʼֵKp_x0
%      6.����Ƕ����Կ�Ŀ��Ʋ���Kp_u
%      7.����Ƕ����Կ�ĵ�������Kp_n
%      8.ʵ������Ƕ�볤�ȣ�L_embeded_Tail
%�����1.��ȡ���ļ��ܺ��ˮӡ��Ϣ���У�encrypted_wartermark_sequence
%     2.��ȡˮӡ���ͼƬ��M_extracted_encrypted_image

function[M_extracted_encrypted_image,encrypted_wartermark_sequence] = extract_embeded_watermark(M_embeded_encrypted_image,Kse_x0,Kse_u,Kse_n,Kp_x0,Kp_u,Kp_n,Kp_l)

%���йر�����ֵ
bin_L_embeded_Tail_encrypted = char(Kp_l);
M = M_embeded_encrypted_image;

%��Kp���ܳ�L_embeded_Tail
s_bin_L_embeded_Tail_encrypted = zeros(1,length(bin_L_embeded_Tail_encrypted)); %���������L_embeded_Tail_encrypted��double����
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
    if mod(n,5) ~= 0 %��n��Ϊ5�ı���    %����ͨ���޸ı����Ļ�ֵ�����Ƽ����Ժ�Ƕ������֮��Ĺ�ϵ�����罫2��Ϊ5�����������ص����٣��������Ի���֮���ͣ�
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
            Tail_m(i) = Tail_m(i)+1;    %�����õ�����ֵ+1
            j = j + 1;
        elseif (Z-1)<Tail_m(i) && Tail_m(i) < P-1 %������������ֵ��P��Z֮��ʱ
            Tail_m(i) = Tail_m(i)+1;    %���õ�����ֵ+1
        else
            continue; %������������ֵΪ��������ֵʱ��������
        end
    end
elseif P<Z   %��P<Zʱ
    for i = 1:L_embeded_Tail     %ֻ���ȡʵ�ʼ��ܹ������м���
        if Tail_m(i) == P
            encrypted_wartermark_sequence(j) = 0; %����������ֵ��ΪPʱ����ȡ0
            j = j + 1;
        elseif Tail_m(i) == P+1
            encrypted_wartermark_sequence(j) = 1; %����������ֵ��ΪP+1ʱ����ȡ1
            Tail_m(i) = Tail_m(i)-1;    %�����õ�����ֵ-1
            j = j + 1;
        elseif (P+1)<Tail_m(i) && Tail_m(i) < (Z+1) %������������ֵ��P��Z(����Z������P)֮��ʱ %modified
            Tail_m(i) = Tail_m(i)-1;    %���õ�����ֵ-1
        else
            continue;     %������������ֵΪ��������ֵʱ��������
        end
    end
else
    disp('error');
end

%����ȡ�����ݵĸ���ѡȡ�ĵ�ͼ����A�ڼ��ܺ��β������Tail_m�ָ���ͼ����
Tail_ex = Tail_e;
for i = 1:length(A)
    Tail_ex(A(i)) = Tail_m(i);
end

%�ٽ�M4�д������Сֵ��ָ���ԭ��λ��--δ���
if L_M4 ~= 0 %�ж��Ƿ����M4
    if mod(L_M4,3) == 0 %�ж�M4�ĸ�ʽ�Ƿ���ȷ
    M4 = S_encrypted_image((dec_k+L_M1_2+1):(dec_k+L_M1_2+L_M4));  %��ȡ��M4
    this_addend_or_pos_info = [0 0 0]; %���ڴ��浱ǰ��������λ����
    current_addend = 0; %���ڴ��浱ǰ����֮��
    this_addend = 0; %���ڴ��浱ǰ����
    this_pos = 0;%���ڴ��浱ǰλ����Ϣ(����֮ǰ����)
    min_pos_info_list = zeros; %���ڴ���λ����Ϣ���б�
    k = 1; %��������,��־λ����Ϣ�ĸ���
    for i = 1:3:L_M4-2
        for j = 1:3
            this_addend_or_pos_info(1) = M4(i); %��ȡM4�е�ǰ��λ���еĵ�һλ
            this_addend_or_pos_info(2) = M4(i+1);
            this_addend_or_pos_info(3) = M4(i+2);
            if this_addend_or_pos_info(1) == 1 %�����ǰ��λ���еĵ�һλΪ1�������λ����Ϊ����,����λΪ256���ƣ���ʾ���ж��ٸ�65536
                this_addend = (this_addend_or_pos_info(2)*256+this_addend_or_pos_info(3))*65536; %���㵱ǰ��λ���ӱ�ʾ����
                cuurent_addend = current_addend + this_addend; %����֮��Ϊ��ǰ���Ӽ���֮ǰ������֮��
            elseif this_addend_or_pos_info(1) == 0 %�����ǰ��λ���еĵ�һλΪ0�������λ����Ϊλ����Ϣ
                this_pos = (this_addend_or_pos_info(2)*256+this_addend_or_pos_info(3));
                min_pos_info_list(k) = this_pos + current_addend;
                k = k+1;
            end
        end
    end
    %����M4�м�¼����Сֵλ�õ���Ϣ��M2'��ԭ�ȵ���Сֵ����л�ԭ
    M3_end_point = length(Tail_ex)-((h*w)/2);  %�ҵ�β��M3�Ľ�����
    absolute_min_pos_info_list = min_pos_info_list+M3_end_point; %��min_pos_info_list������Ԫ�ؼ���M3_end_point���õ�����Сֵ��ľ���λ��
    for i =1:length(min_pos_info_list)
        Tail_ex(absolute_min_pos_info_list(i)) = Z; %��Сֵ���ֵ��ԭΪZ
    end
    else
        disp('M4 format error');
    end
end
    

%�ع��Իָ����ܺ��ͼ�����
Head_and_Body = S_encrypted_image(1:(dec_k+L_M1_2+L_M4));
%S_extracted_encrypted_image = [S_encrypted_image(1:(dec_k+L_M1_2+L_M4)) Tail_ex]; %�õ�Ƕ�����ݺ�ļ�������
S_extracted_encrypted_image = [Head_and_Body Tail_ex]; %�õ�Ƕ�����ݺ�ļ�������
M_extracted_encrypted_image = reshape(S_extracted_encrypted_image,h,w); %������ת��Ϊ����
M_extracted_encrypted_image = M_extracted_encrypted_image'; %����ת�õõ�ˮӡǶ���ļ���ͼ�����


