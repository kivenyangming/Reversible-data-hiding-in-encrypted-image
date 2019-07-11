%RLC解压缩
%输入：压缩后的序列：S_RLC
%输出：解压缩后的序列：S_deRLC

function[S_deRLC] = RLC_decompress(S_RLC)

%求得压缩后序列的长度
L_S_RLC = length(S_RLC);
%初始化解压后的序列
S_deRLC = zeros; 

%对压缩后的序列进行逐位复原
count = 1; %解压后序列位置计数变量
for i = 1:2:(L_S_RLC-1)
    for j = 1:S_RLC(i)
        S_deRLC(count) = S_RLC(i+1);
        count = count + 1;
    end
end

    