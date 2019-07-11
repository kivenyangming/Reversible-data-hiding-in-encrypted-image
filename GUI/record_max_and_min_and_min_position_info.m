%输入：1.图像低四位平面合并相邻像素后所得序列M2'
%     2.原初始图像高度h
%     3.原初始图像宽度w
%输出：1.最小像素值：Z
%     2.最大像素值：P
%     3.最小像素的位置信息序列：M4
%      3.(1).M4的构成如下：
%                每个数由三个8位二进制像素块表示，即每个数占3字节，设分别为A、B、C，首位A为标记位，有0、1两种标记
%                    当首位A为0时：表示的数由第二位*256+第三位计算而得，即B*256+C
%                    当首位A为1时：此数为加数算子，加数的值为65536*(B*256+C),算子后的数都要加上它之前的算子才为当前数的值
%     4.M4的长度：L_M4（用(log2h+log2w)位二进制序列表示）
%     5.M4的长度：L_M4_dec（用十进制数表示）

function[Z,P,M4,L_M4,L_M4_dec] = record_max_and_min_and_min_position_info(M2_1,h,w)

L_M2_1 = length(M2_1); %M2'序列的长度
M4 = []; %用于记录最小值位置信息的M4

Length_of_L_M4 = ceil(log2(h)+log2(w));
L_M4 = zeros(1,Length_of_L_M4); %用于记录M4长度的序列

%得到M2'的灰度直方图，获取最大、最小值信息
M2_1_hist = hist(M2_1,0:255); %获取M2'的直方图
min_point_hist_value = min(M2_1_hist);
min_point_pos = find(M2_1_hist == min_point_hist_value,1,'last');%找出灰度值最大的最小值点,序列坐标为其对应灰度值+1，将对应灰度值赋值给Z
Z = min_point_pos - 1;
[max_point_hist_value,max_point_pos] = max(M2_1_hist); %从最小值点左侧从头至尾寻找最大值点
P = max_point_pos - 1; %峰值点灰度值为峰值点序列坐标-1；

%判断最小值点是否为0值点
if min_point_hist_value == 0  %若最小值点为零值点
    M4 = [];  %则M4为空序列
    count = 0; %M4的长度为0
else     %否则记录最小值点的位置信息到M4中
    count = 0; %用于记录当前最小值个数
    num_of_65536_to_be_inserted = 0; % 此处应当插入序列M4的65536的个数
    current_addend = 0; %当前最小值点位置序号之前的加数算子之和，为65536的整数倍
    this_pos_info = [0 0 0]; %表示当前最小值点位置序号的三字节序列
    this_addend = [1 0 0]; %表示当前要插入的三字节加数算子
    %this_pos_number = 0;%表示当前加数算子的十进制数（当前点序号减去其之前加数算子之和）
    this_pos_number = 0; %表示当前最小值点位置序号的十进制数（当前点序号减去其之前加数算子之和）
    min_pos_info_list = find(M2_1 == Z);
    for i = 1:length(min_pos_info_list)
        this_pos_number = min_pos_info_list(i);
        %先添加加数算子
        this_pos_number = this_pos_number - current_addend;%计算当前位置序号减去当前加法算子之和的差
        if this_pos_number > 65535 %当这个差值大于65535时，需要插入加法算子
            num_of_65536_to_be_inserted = floor(this_pos_number/65536);  %计算要插入的加法算子含65536的个数
            while num_of_65536_to_be_inserted > 65535  %如果这个个数比65535大,循环插入最大的加法算子，含有65535个65536，直到要插入的加法算子含65536的个数小于65535
                  this_addend = [1 255 255];
                  M4 = [M4 this_addend];
                  count = count + 3;
                  current_addend = current_addend + 65535*65536;
                  num_of_65536_to_be_inserted = num_of_65536_to_be_inserted - 65535;
                  %this_addend_number = i - current_addend; %计算插入后当前位置序号
            end
            %接下来继续插入一个加法算子，含有num_of_65536_to_be_inserted个65536
            if num_of_65536_to_be_inserted > 0
                this_addend(1) = 1;
                this_addend(2) = floor(num_of_65536_to_be_inserted/256);
                this_addend(3) = rem(num_of_65536_to_be_inserted,256);
                M4 = [M4 this_addend];
                count = count + 3;
                current_addend = current_addend + num_of_65536_to_be_inserted*65536;
                this_pos_number = this_pos_number - current_addend; %计算此时还剩需要记录的值
            end
        end
        %接下来记录当前剩余值this_pos_number
        if this_pos_number == rem(min_pos_info_list(i),65536); %校验之前的计算是否正确，若正确，当前剩余值应该与当前序号除以65536的余数相同
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

% count = 0; %用于记录当前最小值个数
% num_of_inserted_zeros = 0; % 插入序列M4的0的个数
% current_addend = 0; %用于记录当前最小值的位置信息的前一个加数的变量，为256的整数倍
% this_pos_info = 0; %当前最小值的位置信息的后一个加数变量，为0-255的整数，该位置由current_addend+this_pos_info得到
% %找到序列中的全部最小值Z所在的位置,并记录下其位置信息M4
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

%记录M4的长度
%binary_L_M4 = dec2bin(count,Length_of_L_M4);
count = double(count);
L_M4_dec = count;
for i = 1:Length_of_L_M4
    L_M4(i) = bitget(count,Length_of_L_M4+1-i);
end



