%向序列中嵌入水印信息
%输入：1.要被嵌入信息的序列
%     2.被加密后的水印信息序列
%     3.序列峰值点信息P
%     4.序列零值点信息Z
%输出：1.嵌入水印信息后的序列S
%      2.嵌入信息后被嵌入序列写到的位置i

function[S,i] = sequence_watermark_embed(Tail,watermark,P,Z)

%输入信息
S = Tail;
% watermark = randi([0 1],1,100);
% P = 163;
% Z = 253;

L_S = length(S);
L_W = length(watermark);
p_watermark = 1; %记录写到水印的第几位比特

if P < Z  %当峰值点P的灰度值小于零值点Z时
    for i = 1:L_S
        if P<S(i) && S(i)<Z
            S(i) = S(i)+1;   %位于(P,Z)的灰度值全部向右平移一位
        elseif S(i) == P
            if p_watermark < L_W  %如果还有水印信息没嵌入完，则继续嵌入信息
                if watermark(p_watermark) == 1
                    S(i) = S(i) + 1;
                    p_watermark = p_watermark + 1;
                else
                    p_watermark = p_watermark + 1;
                end
            elseif p_watermark == L_W    %当嵌入到最后一位时，数据嵌入后停止嵌入
                if watermark(p_watermark) == 1
                    S(i) = S(i) + 1;
                end
                break;
            end
        end
    end
elseif P > Z  %当峰值点P的灰度值大于零值点Z时
    for i = 1:L_S
        if P>S(i) && S(i)>Z
            S(i) = S(i)-1;
        elseif S(i) == P
            if p_watermark < L_W
                if watermark(p_watermark) == 1
                    S(i) = S(i) - 1;
                    p_watermark = p_watermark + 1;
                else
                    p_watermark = p_watermark + 1;
                end
            elseif  p_watermark == L_W   %当嵌入到最后一位时，数据嵌入后停止嵌入
                if watermark(p_watermark) == 1
                    S(i) = S(i) - 1;
                end
                break;
            end            
        end
    end
else
    disp('error');
end
%判断信息是否全部嵌入完成
if p_watermark < L_W
    disp('watermark has not been fully embeded');
end