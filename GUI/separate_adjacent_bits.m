%���룺Ҫ��������λ�ϲ�����������У�sequence_to_separate
%�������ϲ���ɺ�����У�separated_sequence

function[separated_sequence] = separate_adjacent_bits(sequence_to_separate)

separated_sequence = zeros; %�����ϲ����������
count = 1;
L = length(sequence_to_separate);

for i = 1:L
    separated_sequence(count) = floor(sequence_to_separate(i)/16);
    separated_sequence(count+1) = mod(sequence_to_separate(i),16);
    count = count+2;
end
    
