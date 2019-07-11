%图像的压缩与重构、图像加密两部分组合程序

function[M_encrypted_image] = image_compression_rebuild_and_encryption(image_directory,Kse_x0,Kse_u,Kse_n,Ken_x0,Ken_u,Ken_n)

%image_directory = 'brain2.bmp';  %图像路径

%对图像进行压缩、重构处理，得到处理后的重构图像矩阵及序列
[M_Rebuild_image,Head,Body,Tail] = image_compression_and_rebuild(image_directory);

%对图像的头、中、尾部分别进行加密
[encrypted_sequence_Head,x0_Head,u_Head,n_Head] = Logistic_position_encryption(Head,Kse_x0,Kse_u,Kse_n);
[encrypted_sequence_Body,x0_Body,u_Body,n_Body] = Logistic_position_encryption(Body,Ken_x0,Ken_u,Ken_n);
[encrypted_sequence_Tail,x0_Tail,u_Tail,n_Tail] = Logistic_position_encryption(Tail,Ken_x0,Ken_u,Ken_n);

%将加密后序列重构为图像矩阵
[h,w]=size(M_Rebuild_image);
M_encrypted_image = reshape([encrypted_sequence_Head encrypted_sequence_Body encrypted_sequence_Tail],h,w);
M_encrypted_image = M_encrypted_image';

%显示加密后图像
imshow(M_encrypted_image,[]);

%输出图像
File_name = strsplit(image_directory,'.');
out_put_name = strcat(File_name(1:length(File_name)-1),'_encrypted.',File_name(length(File_name)));
M_encrypted_image = uint8(M_encrypted_image);
imwrite(M_encrypted_image,char(out_put_name));