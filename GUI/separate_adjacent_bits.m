%输入：要进行相邻位合并逆操作的序列：sequence_to_separate
%输出：逆合并完成后的序列：separated_sequence

function[separated_sequence] = separate_adjacent_bits(sequence_to_separate)

separated_sequence = zeros; %存放逆合并结果的序列
count = 1;
L = length(sequence_to_separate);

for i = 1:L
    separated_sequence(count) = floor(sequence_to_separate(i)/16);
    separated_sequence(count+1) = mod(sequence_to_separate(i),16);
    count = count+2;
end
    
