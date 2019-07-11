%Logistic序列解密
%输入：1.加密后的序列
%      2.解密的初始值x0
%      3.解密的控制参数u
%      4.解密的迭代次数n
%输出： 1.解密后的序列

function[decrypted_sequence] = Logistic_position_decryption(input_sequence,x0,u,n)

%将x0迭代n次，达到充分混沌状态
x = x0;
for i=1:n
    x=u*x*(1-x);
end

%产生一维混沌加密索引序列Index
 L_input_sequence = length(input_sequence);  %输入序列的长度
 A=zeros(1,L_input_sequence); %Logistic混沌序列
 %Index = zeros(1,L_input_sequence);    %排序后Logistic混沌序列A的索引序列，用于加密
 %sorted_A = zeros(1,L_input_sequence); %排序后的Logistic混沌序列A
 A(1)=x;
 for i = 1:L_input_sequence-1
     A(i+1) = u*A(i)*(1-A(i));
 end
 [sorted_A,Index] = sort(A);

%根据索引序列将输入序列进行置乱，得到加密后的序列
decrypted_sequence = zeros(1,L_input_sequence);
for i = 1:L_input_sequence
    decrypted_sequence(i) = input_sequence(Index(i));
end