function varargout = image_rebuild_and_encrypt(varargin)
% IMAGE_REBUILD_AND_ENCRYPT MATLAB code for image_rebuild_and_encrypt.fig
%      IMAGE_REBUILD_AND_ENCRYPT, by itself, creates a new IMAGE_REBUILD_AND_ENCRYPT or raises the existing
%      singleton*.
%
%      H = IMAGE_REBUILD_AND_ENCRYPT returns the handle to a new IMAGE_REBUILD_AND_ENCRYPT or the handle to
%      the existing singleton*.
%
%      IMAGE_REBUILD_AND_ENCRYPT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGE_REBUILD_AND_ENCRYPT.M with the given input arguments.
%
%      IMAGE_REBUILD_AND_ENCRYPT('Property','Value',...) creates a new IMAGE_REBUILD_AND_ENCRYPT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before image_rebuild_and_encrypt_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to image_rebuild_and_encrypt_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help image_rebuild_and_encrypt

% Last Modified by GUIDE v2.5 28-Feb-2019 10:24:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @image_rebuild_and_encrypt_OpeningFcn, ...
                   'gui_OutputFcn',  @image_rebuild_and_encrypt_OutputFcn, ...
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


% --- Executes just before image_rebuild_and_encrypt is made visible.
function image_rebuild_and_encrypt_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to image_rebuild_and_encrypt (see VARARGIN)

% Choose default command line output for image_rebuild_and_encrypt
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes image_rebuild_and_encrypt wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = image_rebuild_and_encrypt_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in pushbutton_open_image.
function pushbutton_open_image_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_open_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image_directory = get(handles.edit_image_directory,'String');
M = imread(image_directory);
imshow(M);

% --- Executes on button press in pushbutton_browse.
function pushbutton_browse_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%[filename,filepath] = uigetfile({'所有文件(*.*)';'图像文件(*.jpg,*.jpge,*.bmp,*.png)'},'选择图像文件');
[filename,filepath] = uigetfile('*.*','选择图像文件');
set(handles.edit_image_directory,'String',strcat(filepath,filename));


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



function edit_ken_x0_Callback(hObject, eventdata, handles)
% hObject    handle to edit_ken_x0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_ken_x0 as text
%        str2double(get(hObject,'String')) returns contents of edit_ken_x0 as a double


% --- Executes during object creation, after setting all properties.
function edit_ken_x0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_ken_x0 (see GCBO)
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



function edit_ken_u_Callback(hObject, eventdata, handles)
% hObject    handle to edit_ken_u (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_ken_u as text
%        str2double(get(hObject,'String')) returns contents of edit_ken_u as a double


% --- Executes during object creation, after setting all properties.
function edit_ken_u_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_ken_u (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_ken_n_Callback(hObject, eventdata, handles)
% hObject    handle to edit_ken_n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_ken_n as text
%        str2double(get(hObject,'String')) returns contents of edit_ken_n as a double


% --- Executes during object creation, after setting all properties.
function edit_ken_n_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_ken_n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%先判断密钥文本框是否有值,若没有，生成随机值
Kse_x0 = str2double(get(handles.edit_kse_x0,'String'));
if isnan(Kse_x0) || Kse_x0 > 1 || Kse_x0 < 0
    Kse_x0 = roundn(rand(),-5);
    set(handles.edit_kse_x0,'String',Kse_x0);
end

Kse_u = str2double(get(handles.edit_kse_u,'String'));
if isnan(Kse_u) || Kse_u <= 3.59 || Kse_u > 4
    Kse_u = roundn(3.59+0.41*rand(),-5);
    set(handles.edit_kse_u,'String',Kse_u);
end

Kse_n = str2double(get(handles.edit_kse_n,'String'));
if isnan(Kse_n)
    Kse_n = ceil(100+200*rand());
    set(handles.edit_kse_n,'String',Kse_n);
end

Ken_x0 = str2double(get(handles.edit_ken_x0,'String'));
if isnan(Ken_x0) || Ken_x0 > 1 || Ken_x0 < 0
    Ken_x0 = roundn(rand(),-5);
    set(handles.edit_ken_x0,'String',Ken_x0);
end

Ken_u = str2double(get(handles.edit_ken_u,'String'));
if isnan(Ken_u) || Ken_u <= 3.59 || Ken_u > 4
    Ken_u = roundn(3.59+0.41*rand(),-5);
    set(handles.edit_ken_u,'String',Ken_u);
end

Ken_n = str2double(get(handles.edit_ken_n,'String'));
if isnan(Ken_n)
    Ken_n = ceil(100+200*rand());
    set(handles.edit_ken_n,'String',Ken_n);
end

%进行图像的加密和重构操作
 image_directory = get(handles.edit_image_directory,'String');
 [M_encrypted_image] = image_compression_rebuild_and_encryption(image_directory,Kse_x0,Kse_u,Kse_n,Ken_x0,Ken_u,Ken_n);
 
 %创建密钥文本
 %图像完全解密密钥(含Kse、Ken)
 fid = fopen('Key.txt','w');
 fprintf(fid,'Kse_x0 = %f  Kse_u = %f  Kse_n = %d \r\n',Kse_x0,Kse_u,Kse_n);
 fprintf(fid,'Ken_x0 = %f  Ken_u = %f  Ken_n = %d ',Ken_x0,Ken_u,Ken_n);
 %图像头部解密密钥（只含Kse）
 fid = fopen('Key_head.txt','w');
 fprintf(fid,'Kse_x0 = %f  Kse_u = %f  Kse_n = %d \r\n',Kse_x0,Kse_u,Kse_n);
 



    
