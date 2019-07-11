%Logistic序列位置置乱加密函数
%输入： 1.要加密的序列
%      2.（可选）加密的初始值x0
%      3.（可选）加密的控制参数u
%      4.（可选）加密的迭代次数n
%输出： 1.加密后的序列
%      2.加密的初始值x0
%      3.加密的控制参数u
%      4.加密的迭代次数n

function[encrypted_sequence,x0,u,n] = Logistic_position_encryption(input_sequence,x0,u,n)

if nargin == 1
    x0 = rand();
    u = 3.59+0.41*rand();
    n = ceil(100+100*rand());
elseif nargin == 2
    u = 3.59+0.41*rand();
    n = ceil(100+100*rand());
elseif nargin == 3
    n = ceil(100+100*rand());
end

%将x0迭代n次，达到充分混沌状态
x = x0;
for i=1:n
    x=u*x*(1-x);
end

%产生一维混沌加密索引序列Index
 L_input_sequence = length(input_sequence);  %输入序列的长度
 A=zeros(1,L_input_sequence); %Logistic混沌序列
 Index = zeros(1,L_input_sequence);    %排序后Logistic混沌序列A的索引序列，用于加密
 sorted_A = zeros(1,L_input_sequence); %排序后的Logistic混沌序列A
 A(1)=x;
 for i = 1:L_input_sequence-1
     A(i+1) = u*A(i)*(1-A(i));
 end
 [sorted_A,Index] = sort(A);
 
 
 
% this_pos = uint8(A(1)*L_input_sequence);
% Index(1) = this_pos;
% i = 2;
% k = 1;
% while i <= L_input_sequence
%     while true
%         A(k+1)=u*A(k)*(1-A(k));
%         this_pos = uint8(A(k+1)*L_input_sequence);
%         if isempty(find(Index == this_pos, 1))
%             break;
%         else
%             k = k + 1;
%             continue;
%         end
%     end
%     Index(i) = this_pos;
%     i = i + 1;
% end

%根据索引序列将输入序列进行置乱，得到加密后的序列
encrypted_sequence = zeros(1,L_input_sequence);
for i = 1:L_input_sequence
    encrypted_sequence(Index(i)) = input_sequence(i);
end
    
    
        
    


