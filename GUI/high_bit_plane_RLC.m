%输入：要进行RLC压缩的图片矩阵：M
%输出：压缩后的序列：M_RLC
function[compressed_Matrix] = high_bit_plane_RLC(Matrix_to_be_compress)

M = Matrix_to_be_compress;  %要压缩高四位位平面，若第一次运行时需首先计算出高四位平面的矩阵值
[h, w] = size(M);
compressed_Matrix = zeros;  %编码所得的编码向量

L = M(1,1); %初始化当前值变量，该变量用于记录当前编码的灰度级值，初始值为高四位平面矩阵的第一行第一列的值
R = 0;%初始化游程长度变量，该变量用于记录当前编码的游程长度值,初始值为0(为1的话第一行第一列的值被计数了两遍)
round_count = 0;%初始化游程计数变量，该变量用于记录当前编码共编码了几段游程,初始值为0
for i=1:h
    for j=1:w
        if R==15          %如果此时R已经到了15，则重新开始一段游程的编码
            round_count = round_count + 1; %游程段数+1
            compressed_Matrix(2*round_count-1) = R; %写入游程长度到编码向量
            compressed_Matrix(2*round_count) = L; %写入灰度值到编码向量
            R=1;          %重新设置R=1
            L = M(i,j);   %重新将当前灰度值设为当前游程编码的灰度值
            continue;
        else              %如果此时R没到15
            if M(i,j) == L    %如果当前灰度值与当前游程编码的灰度值相同
                R=R+1;            %游程+1                 
            else               %如果当前灰度值与当前游程编码的灰度值不同
                round_count = round_count + 1; %游程段数+1
                compressed_Matrix(2*round_count-1) = R; %写入游程长度到编码向量
                compressed_Matrix(2*round_count) = L; %写入灰度值到编码向量
                L = M(i,j); %重新将当前灰度值设为当前游程编码的灰度值
                R=1; %重新设置R=1
            end
        end
    end
end

%最后对最后一个游程的数据进行补录
round_count = round_count + 1; %游程段数+1
compressed_Matrix(2*round_count-1) = R; %写入游程长度到编码向量
compressed_Matrix(2*round_count) = L; %写入灰度值到编码向量
            
            
        
