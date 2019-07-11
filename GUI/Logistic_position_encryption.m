%Logistic����λ�����Ҽ��ܺ���
%���룺 1.Ҫ���ܵ�����
%      2.����ѡ�����ܵĳ�ʼֵx0
%      3.����ѡ�����ܵĿ��Ʋ���u
%      4.����ѡ�����ܵĵ�������n
%����� 1.���ܺ������
%      2.���ܵĳ�ʼֵx0
%      3.���ܵĿ��Ʋ���u
%      4.���ܵĵ�������n

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

%��x0����n�Σ��ﵽ��ֻ���״̬
x = x0;
for i=1:n
    x=u*x*(1-x);
end

%����һά���������������Index
 L_input_sequence = length(input_sequence);  %�������еĳ���
 A=zeros(1,L_input_sequence); %Logistic��������
 Index = zeros(1,L_input_sequence);    %�����Logistic��������A���������У����ڼ���
 sorted_A = zeros(1,L_input_sequence); %������Logistic��������A
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

%�����������н��������н������ң��õ����ܺ������
encrypted_sequence = zeros(1,L_input_sequence);
for i = 1:L_input_sequence
    encrypted_sequence(Index(i)) = input_sequence(i);
end
    
    
        
    


