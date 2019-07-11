%ͼ���ѹ�����ع���ͼ�������������ϳ���

function[M_encrypted_image] = image_compression_rebuild_and_encryption(image_directory,Kse_x0,Kse_u,Kse_n,Ken_x0,Ken_u,Ken_n)

%image_directory = 'brain2.bmp';  %ͼ��·��

%��ͼ�����ѹ�����ع������õ��������ع�ͼ���������
[M_Rebuild_image,Head,Body,Tail] = image_compression_and_rebuild(image_directory);

%��ͼ���ͷ���С�β���ֱ���м���
[encrypted_sequence_Head,x0_Head,u_Head,n_Head] = Logistic_position_encryption(Head,Kse_x0,Kse_u,Kse_n);
[encrypted_sequence_Body,x0_Body,u_Body,n_Body] = Logistic_position_encryption(Body,Ken_x0,Ken_u,Ken_n);
[encrypted_sequence_Tail,x0_Tail,u_Tail,n_Tail] = Logistic_position_encryption(Tail,Ken_x0,Ken_u,Ken_n);

%�����ܺ������ع�Ϊͼ�����
[h,w]=size(M_Rebuild_image);
M_encrypted_image = reshape([encrypted_sequence_Head encrypted_sequence_Body encrypted_sequence_Tail],h,w);
M_encrypted_image = M_encrypted_image';

%��ʾ���ܺ�ͼ��
imshow(M_encrypted_image,[]);

%���ͼ��
File_name = strsplit(image_directory,'.');
out_put_name = strcat(File_name(1:length(File_name)-1),'_encrypted.',File_name(length(File_name)));
M_encrypted_image = uint8(M_encrypted_image);
imwrite(M_encrypted_image,char(out_put_name));