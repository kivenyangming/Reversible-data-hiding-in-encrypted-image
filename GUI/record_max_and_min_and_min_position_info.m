%���룺1.ͼ�����λƽ��ϲ��������غ���������M2'
%     2.ԭ��ʼͼ��߶�h
%     3.ԭ��ʼͼ����w
%�����1.��С����ֵ��Z
%     2.�������ֵ��P
%     3.��С���ص�λ����Ϣ���У�M4
%      3.(1).M4�Ĺ������£�
%                ÿ����������8λ���������ؿ��ʾ����ÿ����ռ3�ֽڣ���ֱ�ΪA��B��C����λAΪ���λ����0��1���ֱ��
%                    ����λAΪ0ʱ����ʾ�����ɵڶ�λ*256+����λ������ã���B*256+C
%                    ����λAΪ1ʱ������Ϊ�������ӣ�������ֵΪ65536*(B*256+C),���Ӻ������Ҫ������֮ǰ�����Ӳ�Ϊ��ǰ����ֵ
%     4.M4�ĳ��ȣ�L_M4����(log2h+log2w)λ���������б�ʾ��
%     5.M4�ĳ��ȣ�L_M4_dec����ʮ��������ʾ��

function[Z,P,M4,L_M4,L_M4_dec] = record_max_and_min_and_min_position_info(M2_1,h,w)

L_M2_1 = length(M2_1); %M2'���еĳ���
M4 = []; %���ڼ�¼��Сֵλ����Ϣ��M4

Length_of_L_M4 = ceil(log2(h)+log2(w));
L_M4 = zeros(1,Length_of_L_M4); %���ڼ�¼M4���ȵ�����

%�õ�M2'�ĻҶ�ֱ��ͼ����ȡ�����Сֵ��Ϣ
M2_1_hist = hist(M2_1,0:255); %��ȡM2'��ֱ��ͼ
min_point_hist_value = min(M2_1_hist);
min_point_pos = find(M2_1_hist == min_point_hist_value,1,'last');%�ҳ��Ҷ�ֵ������Сֵ��,��������Ϊ���Ӧ�Ҷ�ֵ+1������Ӧ�Ҷ�ֵ��ֵ��Z
Z = min_point_pos - 1;
[max_point_hist_value,max_point_pos] = max(M2_1_hist); %����Сֵ������ͷ��βѰ�����ֵ��
P = max_point_pos - 1; %��ֵ��Ҷ�ֵΪ��ֵ����������-1��

%�ж���Сֵ���Ƿ�Ϊ0ֵ��
if min_point_hist_value == 0  %����Сֵ��Ϊ��ֵ��
    M4 = [];  %��M4Ϊ������
    count = 0; %M4�ĳ���Ϊ0
else     %�����¼��Сֵ���λ����Ϣ��M4��
    count = 0; %���ڼ�¼��ǰ��Сֵ����
    num_of_65536_to_be_inserted = 0; % �˴�Ӧ����������M4��65536�ĸ���
    current_addend = 0; %��ǰ��Сֵ��λ�����֮ǰ�ļ�������֮�ͣ�Ϊ65536��������
    this_pos_info = [0 0 0]; %��ʾ��ǰ��Сֵ��λ����ŵ����ֽ�����
    this_addend = [1 0 0]; %��ʾ��ǰҪ��������ֽڼ�������
    %this_pos_number = 0;%��ʾ��ǰ�������ӵ�ʮ����������ǰ����ż�ȥ��֮ǰ��������֮�ͣ�
    this_pos_number = 0; %��ʾ��ǰ��Сֵ��λ����ŵ�ʮ����������ǰ����ż�ȥ��֮ǰ��������֮�ͣ�
    min_pos_info_list = find(M2_1 == Z);
    for i = 1:length(min_pos_info_list)
        this_pos_number = min_pos_info_list(i);
        %����Ӽ�������
        this_pos_number = this_pos_number - current_addend;%���㵱ǰλ����ż�ȥ��ǰ�ӷ�����֮�͵Ĳ�
        if this_pos_number > 65535 %�������ֵ����65535ʱ����Ҫ����ӷ�����
            num_of_65536_to_be_inserted = floor(this_pos_number/65536);  %����Ҫ����ļӷ����Ӻ�65536�ĸ���
            while num_of_65536_to_be_inserted > 65535  %������������65535��,ѭ���������ļӷ����ӣ�����65535��65536��ֱ��Ҫ����ļӷ����Ӻ�65536�ĸ���С��65535
                  this_addend = [1 255 255];
                  M4 = [M4 this_addend];
                  count = count + 3;
                  current_addend = current_addend + 65535*65536;
                  num_of_65536_to_be_inserted = num_of_65536_to_be_inserted - 65535;
                  %this_addend_number = i - current_addend; %��������ǰλ�����
            end
            %��������������һ���ӷ����ӣ�����num_of_65536_to_be_inserted��65536
            if num_of_65536_to_be_inserted > 0
                this_addend(1) = 1;
                this_addend(2) = floor(num_of_65536_to_be_inserted/256);
                this_addend(3) = rem(num_of_65536_to_be_inserted,256);
                M4 = [M4 this_addend];
                count = count + 3;
                current_addend = current_addend + num_of_65536_to_be_inserted*65536;
                this_pos_number = this_pos_number - current_addend; %�����ʱ��ʣ��Ҫ��¼��ֵ
            end
        end
        %��������¼��ǰʣ��ֵthis_pos_number
        if this_pos_number == rem(min_pos_info_list(i),65536); %У��֮ǰ�ļ����Ƿ���ȷ������ȷ����ǰʣ��ֵӦ���뵱ǰ��ų���65536��������ͬ
            this_pos_info(1) = 0;
            this_pos_info(2) = floor(this_pos_number/256);
            this_pos_info(3) = rem(this_pos_number,256);
            M4 = [M4 this_pos_info];
            count = count + 3;
        else
            disp(['error when this_pos_number =',num2str(this_pos_number),'and current i =',num2str(i)]);
        end
    end
end


%     for i=1:L_M2_1
%         if M2_1(i)==Z
%             this_pos_info = i - current_addend;
%             if this_pos_info <= 255
%                 count = count + 1;
%             M4(count) = this_pos_info;
%             elseif this_pos_info >255
%                 count = count + 1;
%                 M4(count) = 0;
%                 num_of_inserted_zeros = num_of_inserted_zeros + 1;
%                 current_addend = current_addend + 256;
%                 this_pos_info = this_pos_info - 256;
%                 count = count + 1;
%                 M4(count) = this_pos_info;
%             end
%         end            
%     end
% end

% count = 0; %���ڼ�¼��ǰ��Сֵ����
% num_of_inserted_zeros = 0; % ��������M4��0�ĸ���
% current_addend = 0; %���ڼ�¼��ǰ��Сֵ��λ����Ϣ��ǰһ�������ı�����Ϊ256��������
% this_pos_info = 0; %��ǰ��Сֵ��λ����Ϣ�ĺ�һ������������Ϊ0-255����������λ����current_addend+this_pos_info�õ�
% %�ҵ������е�ȫ����СֵZ���ڵ�λ��,����¼����λ����ϢM4
% for i=1:L_M2_1
%     if M2_1(i)==Z
%         this_pos_info = i - current_addend;
%         if this_pos_info <= 255
%             count = count + 1;
%             M4(count) = this_pos_info;
%         elseif this_pos_info >255
%             count = count + 1;
%             M4(count) = 0;
%             num_of_inserted_zeros = num_of_inserted_zeros + 1;
%             current_addend = current_addend + 256;
%             this_pos_info = this_pos_info - 256;
%             count = count + 1;
%             M4(count) = this_pos_info;
%         end            
%     end
% end

%��¼M4�ĳ���
%binary_L_M4 = dec2bin(count,Length_of_L_M4);
count = double(count);
L_M4_dec = count;
for i = 1:Length_of_L_M4
    L_M4(i) = bitget(count,Length_of_L_M4+1-i);
end



