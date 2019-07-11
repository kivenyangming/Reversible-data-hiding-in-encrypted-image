function varargout = image_data_hiding(varargin)
% IMAGE_DATA_HIDING MATLAB code for image_data_hiding.fig
%      IMAGE_DATA_HIDING, by itself, creates a new IMAGE_DATA_HIDING or raises the existing
%      singleton*.
%
%      H = IMAGE_DATA_HIDING returns the handle to a new IMAGE_DATA_HIDING or the handle to
%      the existing singleton*.
%
%      IMAGE_DATA_HIDING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGE_DATA_HIDING.M with the given input arguments.
%
%      IMAGE_DATA_HIDING('Property','Value',...) creates a new IMAGE_DATA_HIDING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before image_data_hiding_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to image_data_hiding_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help image_data_hiding

% Last Modified by GUIDE v2.5 15-Apr-2019 01:13:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @image_data_hiding_OpeningFcn, ...
                   'gui_OutputFcn',  @image_data_hiding_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before image_data_hiding is made visible.
function image_data_hiding_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to image_data_hiding (see VARARGIN)

% Choose default command line output for image_data_hiding
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes image_data_hiding wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = image_data_hiding_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit_image_directory_Callback(hObject, eventdata, handles)
% hObject    handle to edit_image_directory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_image_directory as text
%        str2double(get(hObject,'String')) returns contents of edit_image_directory as a double


% --- Executes during object creation, after setting all properties.
function edit_image_directory_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_image_directory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_image_browse.
function pushbutton_image_browse_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_image_browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,filepath] = uigetfile('*.*','选择图像文件');
set(handles.edit_image_directory,'String',strcat(filepath,filename));

% --- Executes on button press in pushbutton_open_image.
function pushbutton_open_image_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_open_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image_directory = get(handles.edit_image_directory,'String');
M = imread(image_directory);
imshow(M);


function edit_kse_x0_Callback(hObject, eventdata, handles)
% hObject    handle to edit_kse_x0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_kse_x0 as text
%        str2double(get(hObject,'String')) returns contents of edit_kse_x0 as a double


% --- Executes during object creation, after setting all properties.
function edit_kse_x0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_kse_x0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_kse_u_Callback(hObject, eventdata, handles)
% hObject    handle to edit_kse_u (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_kse_u as text
%        str2double(get(hObject,'String')) returns contents of edit_kse_u as a double


% --- Executes during object creation, after setting all properties.
function edit_kse_u_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_kse_u (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_kse_n_Callback(hObject, eventdata, handles)
% hObject    handle to edit_kse_n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_kse_n as text
%        str2double(get(hObject,'String')) returns contents of edit_kse_n as a double


% --- Executes during object creation, after setting all properties.
function edit_kse_n_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_kse_n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_kp_x0_Callback(hObject, eventdata, handles)
% hObject    handle to edit_kp_x0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_kp_x0 as text
%        str2double(get(hObject,'String')) returns contents of edit_kp_x0 as a double


% --- Executes during object creation, after setting all properties.
function edit_kp_x0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_kp_x0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_kp_u_Callback(hObject, eventdata, handles)
% hObject    handle to edit_kp_u (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_kp_u as text
%        str2double(get(hObject,'String')) returns contents of edit_kp_u as a double


% --- Executes during object creation, after setting all properties.
function edit_kp_u_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_kp_u (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_kp_n_Callback(hObject, eventdata, handles)
% hObject    handle to edit_kp_n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_kp_n as text
%        str2double(get(hObject,'String')) returns contents of edit_kp_n as a double


% --- Executes during object creation, after setting all properties.
function edit_kp_n_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_kp_n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_data_embed.
function pushbutton_data_embed_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_data_embed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%首先读取图片
image_directory = get(handles.edit_image_directory,'String');
M_image = imread(image_directory);

%获取头部密钥Kse
Kse_x0 = str2double(get(handles.edit_kse_x0,'String'));
Kse_u = str2double(get(handles.edit_kse_u,'String'));
Kse_n = str2double(get(handles.edit_kse_n,'String'));

%首先判断密钥输入是否合格，不合格随机生成密钥
Kp_x0 = str2double(get(handles.edit_kp_x0,'String'));
if isnan(Kp_x0) || Kp_x0 > 1 || Kp_x0 < 0
    Kp_x0 = roundn(rand(),-5);
    set(handles.edit_kp_x0,'String',Kp_x0);
end

Kp_u = str2double(get(handles.edit_kp_u,'String'));
if isnan(Kp_u) || Kp_u <= 3.59 || Kp_u > 4
    Kp_u = roundn(3.59+0.41*rand(),-5);
    set(handles.edit_kp_u,'String',Kp_u);
end

Kp_n = str2double(get(handles.edit_kp_n,'String'));
if isnan(Kp_n)
    Kp_n = ceil(100+200*rand());
    set(handles.edit_kp_n,'String',Kp_n);
end

Kw_x0 = str2double(get(handles.edit_kw_x0,'String'));
if isnan(Kw_x0) || Kw_x0 > 1 || Kw_x0 < 0
    Kw_x0 = roundn(rand(),-5);
    set(handles.edit_kw_x0,'String',Kw_x0);
end

Kw_u = str2double(get(handles.edit_kw_u,'String'));
if isnan(Kw_u) || Kw_u <= 3.59 || Kw_u > 4
    Kw_u = roundn(3.59+0.41*rand(),-5);
    set(handles.edit_kw_u,'String',Kw_u);
end

Kw_n = str2double(get(handles.edit_kw_n,'String'));
if isnan(Kw_n)
    Kw_n = ceil(100+200*rand());
    set(handles.edit_kw_n,'String',Kw_n);
end

w_text = get(handles.edit_data_text,'String');  %得到文本数据
[watermark] = text_watermark_generate_and_encrypt(w_text,Kw_x0,Kw_u,Kw_n); %生成加密后的水印序列
[M_marked_encrypted_image,Kp_l] = watermark_embed(watermark,M_image,Kse_x0,Kse_u,Kse_n,Kp_x0,Kp_u,Kp_n); %将水印嵌入图片中,Kp_l即用Kp加密后的实际嵌入数据的由地图集合A从尾部选出的序列的长度的二进制序列


%输出图像
File_name = strsplit(image_directory,'.');
out_put_name = strcat(File_name(1:length(File_name)-1),'_marked.',File_name(length(File_name)));
M_marked_encrypted_image = uint8(M_marked_encrypted_image);
imwrite(M_marked_encrypted_image,char(out_put_name));

imshow(M_marked_encrypted_image);
%显示实际嵌入数据的由地图集合A选出的尾部序列的长度
set(handles.edit_kp_l,'String',Kp_l);
 %创建密钥文本
 %水印完全提取解密密钥(含Kp、Kw)
 fid = fopen('Key_data.txt','w');
 fprintf(fid,'Kp_x0 = %f  Kp_u = %f  Kp_n = %d\r\n',Kp_x0,Kp_u,Kp_n);
 fprintf(fid,'Kw_x0 = %f  Kw_u = %f  Kw_n = %d\r\n',Kw_x0,Kw_u,Kw_n);
 %水印提取密钥（只含Kp）
 fid = fopen('Key_extract.txt','w');
 fprintf(fid,'Kp_x0 = %f  Kp_u = %f  Kp_n = %d\r\n',Kp_x0,Kp_u,Kp_n);
 %水印嵌入反馈值(Kp_l)
 fid = fopen('Key_feedback_value.txt','w');
 fprintf(fid,'Kp_l = %s',Kp_l);

% --- Executes on button press in radiobutton_text.
function radiobutton_text_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_text
%取消其他两个按钮的选定
set(handles.radiobutton_picture,'value',0);
set(handles.radiobutton_file,'value',0);


% --- Executes on button press in radiobutton_picture.
function radiobutton_picture_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_picture (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_picture
%取消其他两个按钮的选定
set(handles.radiobutton_text,'value',0);
set(handles.radiobutton_file,'value',0);


% --- Executes on button press in radiobutton_file.
function radiobutton_file_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_file
%取消其他两个按钮的选定
set(handles.radiobutton_text,'value',0);
set(handles.radiobutton_picture,'value',0);



function edit_data_text_Callback(hObject, eventdata, handles)
% hObject    handle to edit_data_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_data_text as text
%        str2double(get(hObject,'String')) returns contents of edit_data_text as a double


% --- Executes during object creation, after setting all properties.
function edit_data_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_data_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_kw_x0_Callback(hObject, eventdata, handles)
% hObject    handle to edit_kw_x0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_kw_x0 as text
%        str2double(get(hObject,'String')) returns contents of edit_kw_x0 as a double


% --- Executes during object creation, after setting all properties.
function edit_kw_x0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_kw_x0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_kw_u_Callback(hObject, eventdata, handles)
% hObject    handle to edit_kw_u (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_kw_u as text
%        str2double(get(hObject,'String')) returns contents of edit_kw_u as a double


% --- Executes during object creation, after setting all properties.
function edit_kw_u_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_kw_u (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_kw_n_Callback(hObject, eventdata, handles)
% hObject    handle to edit_kw_n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_kw_n as text
%        str2double(get(hObject,'String')) returns contents of edit_kw_n as a double


% --- Executes during object creation, after setting all properties.
function edit_kw_n_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_kw_n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_picture_directory_Callback(hObject, eventdata, handles)
% hObject    handle to edit_picture_directory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_picture_directory as text
%        str2double(get(hObject,'String')) returns contents of edit_picture_directory as a double


% --- Executes during object creation, after setting all properties.
function edit_picture_directory_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_picture_directory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_picture_browse.
function pushbutton_picture_browse_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_picture_browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton_open_picture.
function pushbutton_open_picture_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_open_picture (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit_file_directory_Callback(hObject, eventdata, handles)
% hObject    handle to edit_file_directory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_file_directory as text
%        str2double(get(hObject,'String')) returns contents of edit_file_directory as a double


% --- Executes during object creation, after setting all properties.
function edit_file_directory_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_file_directory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_file_browse.
function pushbutton_file_browse_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_file_browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton_import_key.
function pushbutton_import_key_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_import_key (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[keyfilename,keyfilepath] = uigetfile('*.*','选择密钥文件');
key_file_directory = strcat(keyfilepath,keyfilename);

%读取密钥信息
fileID = fopen(key_file_directory);
Keys = textscan(fileID,'%s = %8.6f');
fclose(fileID);
Kse_x0 = Keys{2}(1);
Kse_u = Keys{2}(2);
Kse_n = Keys{2}(3);
set(handles.edit_kse_x0,'String',Kse_x0);
set(handles.edit_kse_u,'String',Kse_u);
set(handles.edit_kse_n,'String',Kse_n);





function edit_kp_l_Callback(hObject, eventdata, handles)
% hObject    handle to edit_kp_l (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_kp_l as text
%        str2double(get(hObject,'String')) returns contents of edit_kp_l as a double


% --- Executes during object creation, after setting all properties.
function edit_kp_l_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_kp_l (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_read_txt.
function pushbutton_read_txt_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_read_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,filepath] = uigetfile('*.*','选择密钥文件');
txt_file_directory = strcat(filepath,filename);

%读取文本
text = importdata(txt_file_directory);

%显示在edit中
set(handles.edit_data_text,'String',text);
