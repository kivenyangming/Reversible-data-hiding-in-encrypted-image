%输入：图片路径
%输出：1.高四位平面矩阵high_bit_plane
%     2.低四位平面矩阵low_bit_plane
%     3.原图像矩阵的高度h
%     4.原图像矩阵的宽度w

function[high_bit_plane,low_bit_plane,height,width] = image_bit_plane_sep_high_and_low(image_directory)

X=double(imread(image_directory));%将原始图像转换为灰度图像，如果本身就是灰度图可以去掉rgb2gray函数
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
%       bit_temp = bitget(X(i,j),k);%bitget函数首先将X(i,j)处灰度值分解为二进制串，然后取第k位
%       low_bit_plane(i,j) = low_bit_plane(i,j)+bit_temp.*(2^(k-1));%将该位转化为十进制相应数值后与此前计算的数值相加
%      end
%  end
% end
% 
% for k=5:8
%  for i=1:h
%      for j=1:w
%       bit_temp = bitget(X(i,j),k);%bitget函数首先将X(i,j)处灰度值分解为二进制串，然后取第k位
%       high_bit_plane(i,j) = high_bit_plane(i,j)+bit_temp.*(2^(k-5));%将该位转化为十进制相应数值后与此前计算的数值相加（高四位每位的幂值-5使像素值分布于0-15）
%      end
%  end
% end

% subplot(1,3,1);
% imshow(X,[]);
% title('原始图像');
% 
% subplot(1,3,2);
% imshow(low_bit_plane,[]);
% imti = '低四位位平面';
% title(imti);
% 
% subplot(1,3,3);
% imshow(high_bit_plane,[]);
% imti = '高四位位平面';
% title(imti);

height = h;
width = w;

