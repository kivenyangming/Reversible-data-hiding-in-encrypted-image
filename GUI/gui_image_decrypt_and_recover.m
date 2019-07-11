function varargout = gui_image_decrypt_and_recover(varargin)
% GUI_IMAGE_DECRYPT_AND_RECOVER MATLAB code for gui_image_decrypt_and_recover.fig
%      GUI_IMAGE_DECRYPT_AND_RECOVER, by itself, creates a new GUI_IMAGE_DECRYPT_AND_RECOVER or raises the existing
%      singleton*.
%
%      H = GUI_IMAGE_DECRYPT_AND_RECOVER returns the handle to a new GUI_IMAGE_DECRYPT_AND_RECOVER or the handle to
%      the existing singleton*.
%
%      GUI_IMAGE_DECRYPT_AND_RECOVER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_IMAGE_DECRYPT_AND_RECOVER.M with the given input arguments.
%
%      GUI_IMAGE_DECRYPT_AND_RECOVER('Property','Value',...) creates a new GUI_IMAGE_DECRYPT_AND_RECOVER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_image_decrypt_and_recover_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_image_decrypt_and_recover_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_image_decrypt_and_recover

% Last Modified by GUIDE v2.5 11-Mar-2019 21:07:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_image_decrypt_and_recover_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_image_decrypt_and_recover_OutputFcn, ...
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


% --- Executes just before gui_image_decrypt_and_recover is made visible.
function gui_image_decrypt_and_recover_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_image_decrypt_and_recover (see VARARGIN)

% Choose default command line output for gui_image_decrypt_and_recover
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_image_decrypt_and_recover wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_image_decrypt_and_recover_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in pushbutton_browser.
function pushbutton_browser_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_browser (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,filepath] = uigetfile('*.*','选择图像文件');
set(handles.edit_image_directory,'String',strcat(filepath,filename));

% --- Executes on button press in pushbutton_open.
function pushbutton_open_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image_directory = get(handles.edit_image_directory,'String');
M = imread(image_directory);
imshow(M);


function edit_Kse_x0_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Kse_x0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Kse_x0 as text
%        str2double(get(hObject,'String')) returns contents of edit_Kse_x0 as a double


% --- Executes during object creation, after setting all properties.
function edit_Kse_x0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Kse_x0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Kse_u_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Kse_u (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Kse_u as text
%        str2double(get(hObject,'String')) returns contents of edit_Kse_u as a double


% --- Executes during object creation, after setting all properties.
function edit_Kse_u_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Kse_u (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Kse_n_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Kse_n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Kse_n as text
%        str2double(get(hObject,'String')) returns contents of edit_Kse_n as a double


% --- Executes during object creation, after setting all properties.
function edit_Kse_n_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Kse_n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Ken_x0_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Ken_x0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Ken_x0 as text
%        str2double(get(hObject,'String')) returns contents of edit_Ken_x0 as a double


% --- Executes during object creation, after setting all properties.
function edit_Ken_x0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Ken_x0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Ken_u_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Ken_u (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Ken_u as text
%        str2double(get(hObject,'String')) returns contents of edit_Ken_u as a double


% --- Executes during object creation, after setting all properties.
function edit_Ken_u_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Ken_u (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Ken_n_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Ken_n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Ken_n as text
%        str2double(get(hObject,'String')) returns contents of edit_Ken_n as a double


% --- Executes during object creation, after setting all properties.
function edit_Ken_n_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Ken_n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_decrypt_and_recover.
function pushbutton_decrypt_and_recover_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_decrypt_and_recover (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Kse_x0 = str2double(get(handles.edit_Kse_x0,'String'));
if isnan(Kse_x0) || Kse_x0 > 1 || Kse_x0 < 0
    display('请输入正确的密钥Kse_x0');
end

Kse_u = str2double(get(handles.edit_Kse_u,'String'));
if isnan(Kse_u) || Kse_u <= 3.59 || Kse_u > 4
    display('请输入正确的密钥Kse_u');
end

Kse_n = str2double(get(handles.edit_Kse_n,'String'));
if isnan(Kse_n)
    display('请输入正确的密钥Kse_n');
end

Ken_x0 = str2double(get(handles.edit_Ken_x0,'String'));
if isnan(Ken_x0) || Ken_x0 > 1 || Ken_x0 < 0
    display('请输入正确的密钥Ken_x0');
end

Ken_u = str2double(get(handles.edit_Ken_u,'String'));
if isnan(Ken_u) || Ken_u <= 3.59 || Ken_u > 4
    display('请输入正确的密钥Ken_u');
end

Ken_n = str2double(get(handles.edit_Ken_n,'String'));
if isnan(Ken_n)
    display('请输入正确的密钥Ken_n');
end
encrypted_image_directory = get(handles.edit_image_directory,'String');
[M] = image_decrypt_and_recover(encrypted_image_directory,Kse_x0,Kse_u,Kse_n,Ken_x0,Ken_u,Ken_n);

%输出图像
File_name = strsplit(encrypted_image_directory,'.');
out_put_name = strcat(File_name(1:length(File_name)-1),'_decrypted.',File_name(length(File_name)));
M_decrypted_image = uint8(M);
imwrite(M_decrypted_image,char(out_put_name));


% --- Executes on button press in pushbutton_read_key.
function pushbutton_read_key_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_read_key (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%先读取密钥文件
[keyfilename,keyfilepath] = uigetfile('*.*','选择密钥文件');
key_file_directory = strcat(keyfilepath,keyfilename);

%读取密钥信息
fileID = fopen(key_file_directory);
Keys = textscan(fileID,'%s = %8.6f');
fclose(fileID);
Kse_x0 = Keys{2}(1);
Kse_u = Keys{2}(2);
Kse_n = Keys{2}(3);
Ken_x0 = Keys{2}(4);
Ken_u = Keys{2}(5);
Ken_n = Keys{2}(6);
set(handles.edit_Kse_x0,'String',Kse_x0);
set(handles.edit_Kse_u,'String',Kse_u);
set(handles.edit_Kse_n,'String',Kse_n);
set(handles.edit_Ken_x0,'String',Ken_x0);
set(handles.edit_Ken_u,'String',Ken_u);
set(handles.edit_Ken_n,'String',Ken_n);



