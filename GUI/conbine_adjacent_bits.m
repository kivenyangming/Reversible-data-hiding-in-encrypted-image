%输入：要进行相邻位合并的矩阵：M
%输出：合并完成后的序列：converted_sequence
function[converted_sequence] = conbine_adjacent_bits(Matrix_to_be_converted)

M = Matrix_to_be_converted; %输入要进行相邻位合并的矩阵
[h,w] = size(M);

converted_sequence = zeros; %存放转换结果的序列
%temp = zeros(1,8);
count = 1;


% for i=1:h
%     for j = 1:2:w
%         for k = 1:4
%             temp(k) = bitget(M(i,j),(5-k));
%         end
%         for k = 5:8
%             temp(k) = bitget(M(i,j+1),(9-k));
%         end
%         converted_sequence(count) = bin2dec(num2str(temp));
%         count = count + 1;
%     end
% end

for i=1:h
    for j = 1:2:w
        converted_sequence(count) = 16*M(i,j)+M(i,j+1); %二进制左移4位=十进制*2^4
        count = count + 1;
    end
end


% for i=1:h
%     for j = 1:2:w
%         str_temp = strcat(num2str(dec2bin(M(i,j)),'%04d'),num2str(dec2bin(M(i,j+1)),'%04d'));
%         converted_sequence(count) = bin2dec(str_temp);
%         count = count + 1;
%     end
% end


