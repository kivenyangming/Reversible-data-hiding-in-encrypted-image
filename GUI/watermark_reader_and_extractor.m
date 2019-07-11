function varargout = watermark_reader_and_extractor(varargin)
% WATERMARK_READER_AND_EXTRACTOR MATLAB code for watermark_reader_and_extractor.fig
%      WATERMARK_READER_AND_EXTRACTOR, by itself, creates a new WATERMARK_READER_AND_EXTRACTOR or raises the existing
%      singleton*.
%
%      H = WATERMARK_READER_AND_EXTRACTOR returns the handle to a new WATERMARK_READER_AND_EXTRACTOR or the handle to
%      the existing singleton*.
%
%      WATERMARK_READER_AND_EXTRACTOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WATERMARK_READER_AND_EXTRACTOR.M with the given input arguments.
%
%      WATERMARK_READER_AND_EXTRACTOR('Property','Value',...) creates a new WATERMARK_READER_AND_EXTRACTOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before watermark_reader_and_extractor_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to watermark_reader_and_extractor_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help watermark_reader_and_extractor

% Last Modified by GUIDE v2.5 27-May-2019 03:36:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @watermark_reader_and_extractor_OpeningFcn, ...
                   'gui_OutputFcn',  @watermark_reader_and_extractor_OutputFcn, ...
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


% --- Executes just before watermark_reader_and_extractor is made visible.
function watermark_reader_and_extractor_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to watermark_reader_and_extractor (see VARARGIN)

% Choose default command line output for watermark_reader_and_extractor
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes watermark_reader_and_extractor wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = watermark_reader_and_extractor_OutputFcn(hObject, eventdata, handles) 
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
%显示图片显示框,关闭文本框
set(handles.axes1,'Visible','on');
set(handles.edit_text_display,'Visible','off');

image_directory = get(handles.edit_image_directory,'String');
M = imread(image_directory);
imshow(M);



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


% --- Executes on button press in pushbutton_read_watermark.
function pushbutton_read_watermark_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_read_watermark (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%首先设置文本框数据清零
set(handles.edit_text_display,'String','');
%读取图片
image_directory = get(handles.edit_image_directory,'String');
M_marked_encrypted_image = imread(image_directory);

% %判断图像是否已解密
% if get(handles.radiobutton_decrypted,'Value')
%     %先将图像重构并用原密钥加密
    

%获取密钥Kp、Kw、Kse
Kp_x0 = str2double(get(handles.edit_kp_x0,'String'));
Kp_u = str2double(get(handles.edit_kp_u,'String'));
Kp_n = str2double(get(handles.edit_kp_n,'String'));
Kp_l = get(handles.edit_kp_l,'String');
Kw_x0 = str2double(get(handles.edit_kw_x0,'String'));
Kw_u = str2double(get(handles.edit_kw_u,'String'));
Kw_n = str2double(get(handles.edit_kw_n,'String'));
Kse_x0 = str2double(get(handles.edit_kse_x0,'String'));
Kse_u = str2double(get(handles.edit_kse_u,'String'));
Kse_n = str2double(get(handles.edit_kse_n,'String'));

%接着从图片中提取出加密后水印序列encrypted_wartermark_sequence
[encrypted_wartermark_sequence] = read_embeded_watermark(M_marked_encrypted_image,Kse_x0,Kse_u,Kse_n,Kp_x0,Kp_u,Kp_n,Kp_l);

%将提取出的水印序列解密
[watermark_d] = Logistic_position_decryption(encrypted_wartermark_sequence,Kw_x0,Kw_u,Kw_n);

%确定水印序列的类型
v_convert8 = [128;64;32;16;8;4;2;1];
s_watermark_type = watermark_d(1:8);
type_number = s_watermark_type*v_convert8;

%根据类型选取合适的读取方式及相应操作
switch type_number
    case 1 %当为文字时
        [text] = text_watermark_decrypt_and_parse(encrypted_wartermark_sequence,Kw_x0,Kw_u,Kw_n);    %从中读取出文字信息
        set(handles.axes1,'visible','off');    %隐藏图像显示框
        set(handles.edit_text_display,'visible','on');    %显示文字显示框
        set(handles.edit_text_display,'String',text);    %文字框中文字为读取到的水印信息
end
        


function edit_text_display_Callback(hObject, eventdata, handles)
% hObject    handle to edit_text_display (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_text_display as text
%        str2double(get(hObject,'String')) returns contents of edit_text_display as a double


% --- Executes during object creation, after setting all properties.
function edit_text_display_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_text_display (see GCBO)
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


% --- Executes on button press in pushbutton_import_data_key.
function pushbutton_import_data_key_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_import_data_key (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[keyfilename,keyfilepath] = uigetfile('*.*','选择密钥文件');
key_file_directory = strcat(keyfilepath,keyfilename);
%读取密钥信息
fileID = fopen(key_file_directory);
Keys = textscan(fileID,'%s = %8.6f');
fclose(fileID);
%先读取Kp
try
    Kp_x0 = Keys{2}(1);
    Kp_u = Keys{2}(2);
    Kp_n = Keys{2}(3);
    set(handles.edit_kp_x0,'String',Kp_x0);
    set(handles.edit_kp_u,'String',Kp_u);
    set(handles.edit_kp_n,'String',Kp_n);
catch
    warndlg('导入错误','警告');
end
%再读取Kw
try
    Kw_x0 = Keys{2}(4);
    Kw_u = Keys{2}(5);
    Kw_n = Keys{2}(6);
    set(handles.edit_kw_x0,'String',Kw_x0);
    set(handles.edit_kw_u,'String',Kw_u);
    set(handles.edit_kw_n,'String',Kw_n);
catch
    warndlg('导入错误或仅导入部分数据','警告');
end




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


% --- Executes on button press in pushbutton_extract_watermark.
function pushbutton_extract_watermark_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_extract_watermark (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%首先读取图片
image_directory = get(handles.edit_image_directory,'String');
M_embeded_encrypted_image = imread(image_directory);

%获取密钥Kp、Kse
Kp_x0 = str2double(get(handles.edit_kp_x0,'String'));
Kp_u = str2double(get(handles.edit_kp_u,'String'));
Kp_n = str2double(get(handles.edit_kp_n,'String'));
Kp_l = get(handles.edit_kp_l,'String');
Kse_x0 = str2double(get(handles.edit_kse_x0,'String'));
Kse_u = str2double(get(handles.edit_kse_u,'String'));
Kse_n = str2double(get(handles.edit_kse_n,'String'));

%接着从图片中提取出加密后水印序列encrypted_wartermark_sequence
[M_extracted_encrypted_image,encrypted_wartermark_sequence] = extract_embeded_watermark(M_embeded_encrypted_image,Kse_x0,Kse_u,Kse_n,Kp_x0,Kp_u,Kp_n,Kp_l);
%输出图像
File_name = strsplit(image_directory,'.');
out_put_name = strcat(File_name(1:length(File_name)-1),'_extracted.',File_name(length(File_name)));
M_extracted_encrypted_image = uint8(M_extracted_encrypted_image);
imwrite(M_extracted_encrypted_image,char(out_put_name));
%显示图片显示框,关闭文本框
set(handles.axes1,'Visible','on');
set(handles.edit_text_display,'Visible','off');
%显示提取后的图像
imshow(M_extracted_encrypted_image);

%弹出对话框，提示提取成功
warndlg('提取水印成功','注意');

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


% --- Executes on button press in pushbutton_import_head_key.
function pushbutton_import_head_key_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_import_head_key (see GCBO)
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


% --- Executes on button press in radiobutton_decrypted.
function radiobutton_decrypted_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_decrypted (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_decrypted


% --- Executes on button press in pushbutton_import_feedback_value.
function pushbutton_import_feedback_value_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_import_feedback_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[keyfilename,keyfilepath] = uigetfile('*.*','选择密钥文件');
key_file_directory = strcat(keyfilepath,keyfilename);

%读取密钥信息
fileID = fopen(key_file_directory);
Keys = textscan(fileID,'%s = %s');
fclose(fileID);
Kp_l = Keys{2}(1);
set(handles.edit_kp_l,'String',Kp_l);
