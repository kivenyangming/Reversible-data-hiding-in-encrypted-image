%��������Ƕ��ˮӡ��Ϣ
%���룺1.Ҫ��Ƕ����Ϣ������
%     2.�����ܺ��ˮӡ��Ϣ����
%     3.���з�ֵ����ϢP
%     4.������ֵ����ϢZ
%�����1.Ƕ��ˮӡ��Ϣ�������S
%      2.Ƕ����Ϣ��Ƕ������д����λ��i

function[S,i] = sequence_watermark_embed(Tail,watermark,P,Z)

%������Ϣ
S = Tail;
% watermark = randi([0 1],1,100);
% P = 163;
% Z = 253;

L_S = length(S);
L_W = length(watermark);
p_watermark = 1; %��¼д��ˮӡ�ĵڼ�λ����

if P < Z  %����ֵ��P�ĻҶ�ֵС����ֵ��Zʱ
    for i = 1:L_S
        if P<S(i) && S(i)<Z
            S(i) = S(i)+1;   %λ��(P,Z)�ĻҶ�ֵȫ������ƽ��һλ
        elseif S(i) == P
            if p_watermark < L_W  %�������ˮӡ��ϢûǶ���꣬�����Ƕ����Ϣ
                if watermark(p_watermark) == 1
                    S(i) = S(i) + 1;
                    p_watermark = p_watermark + 1;
                else
                    p_watermark = p_watermark + 1;
                end
            elseif p_watermark == L_W    %��Ƕ�뵽���һλʱ������Ƕ���ֹͣǶ��
                if watermark(p_watermark) == 1
                    S(i) = S(i) + 1;
                end
                break;
            end
        end
    end
elseif P > Z  %����ֵ��P�ĻҶ�ֵ������ֵ��Zʱ
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
            elseif  p_watermark == L_W   %��Ƕ�뵽���һλʱ������Ƕ���ֹͣǶ��
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
%�ж���Ϣ�Ƿ�ȫ��Ƕ�����
if p_watermark < L_W
    disp('watermark has not been fully embeded');
end