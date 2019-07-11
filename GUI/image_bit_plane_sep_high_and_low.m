%���룺ͼƬ·��
%�����1.����λƽ�����high_bit_plane
%     2.����λƽ�����low_bit_plane
%     3.ԭͼ�����ĸ߶�h
%     4.ԭͼ�����Ŀ��w

function[high_bit_plane,low_bit_plane,height,width] = image_bit_plane_sep_high_and_low(image_directory)

X=double(imread(image_directory));%��ԭʼͼ��ת��Ϊ�Ҷ�ͼ�����������ǻҶ�ͼ����ȥ��rgb2gray����
[h w] = size(X);
high_bit_plane = zeros(h,w);
low_bit_plane = zeros(h,w);

for i =1:h
    for j = 1:w
        high_bit_plane(i,j) = floor(X(i,j)/16);
        low_bit_plane(i,j) = mod(X(i,j),16);
    end
end

% for k=1:4
%  for i=1:h
%      for j=1:w
%       bit_temp = bitget(X(i,j),k);%bitget�������Ƚ�X(i,j)���Ҷ�ֵ�ֽ�Ϊ�����ƴ���Ȼ��ȡ��kλ
%       low_bit_plane(i,j) = low_bit_plane(i,j)+bit_temp.*(2^(k-1));%����λת��Ϊʮ������Ӧ��ֵ�����ǰ�������ֵ���
%      end
%  end
% end
% 
% for k=5:8
%  for i=1:h
%      for j=1:w
%       bit_temp = bitget(X(i,j),k);%bitget�������Ƚ�X(i,j)���Ҷ�ֵ�ֽ�Ϊ�����ƴ���Ȼ��ȡ��kλ
%       high_bit_plane(i,j) = high_bit_plane(i,j)+bit_temp.*(2^(k-5));%����λת��Ϊʮ������Ӧ��ֵ�����ǰ�������ֵ��ӣ�����λÿλ����ֵ-5ʹ����ֵ�ֲ���0-15��
%      end
%  end
% end

% subplot(1,3,1);
% imshow(X,[]);
% title('ԭʼͼ��');
% 
% subplot(1,3,2);
% imshow(low_bit_plane,[]);
% imti = '����λλƽ��';
% title(imti);
% 
% subplot(1,3,3);
% imshow(high_bit_plane,[]);
% imti = '����λλƽ��';
% title(imti);

height = h;
width = w;

