%Logistic���н���
%���룺1.���ܺ������
%      2.���ܵĳ�ʼֵx0
%      3.���ܵĿ��Ʋ���u
%      4.���ܵĵ�������n
%����� 1.���ܺ������

function[decrypted_sequence] = Logistic_position_decryption(input_sequence,x0,u,n)

%��x0����n�Σ��ﵽ��ֻ���״̬
x = x0;
for i=1:n
    x=u*x*(1-x);
end

%����һά���������������Index
 L_input_sequence = length(input_sequence);  %�������еĳ���
 A=zeros(1,L_input_sequence); %Logistic��������
 %Index = zeros(1,L_input_sequence);    %�����Logistic��������A���������У����ڼ���
 %sorted_A = zeros(1,L_input_sequence); %������Logistic��������A
 A(1)=x;
 for i = 1:L_input_sequence-1
     A(i+1) = u*A(i)*(1-A(i));
 end
 [sorted_A,Index] = sort(A);

%�����������н��������н������ң��õ����ܺ������
decrypted_sequence = zeros(1,L_input_sequence);
for i = 1:L_input_sequence
    decrypted_sequence(i) = input_sequence(Index(i));
end