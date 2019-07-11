function varargout = reversible_data_hiding_in_encrypted_medical_image(varargin)
% REVERSIBLE_DATA_HIDING_IN_ENCRYPTED_MEDICAL_IMAGE MATLAB code for reversible_data_hiding_in_encrypted_medical_image.fig
%      REVERSIBLE_DATA_HIDING_IN_ENCRYPTED_MEDICAL_IMAGE, by itself, creates a new REVERSIBLE_DATA_HIDING_IN_ENCRYPTED_MEDICAL_IMAGE or raises the existing
%      singleton*.
%
%      H = REVERSIBLE_DATA_HIDING_IN_ENCRYPTED_MEDICAL_IMAGE returns the handle to a new REVERSIBLE_DATA_HIDING_IN_ENCRYPTED_MEDICAL_IMAGE or the handle to
%      the existing singleton*.
%
%      REVERSIBLE_DATA_HIDING_IN_ENCRYPTED_MEDICAL_IMAGE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REVERSIBLE_DATA_HIDING_IN_ENCRYPTED_MEDICAL_IMAGE.M with the given input arguments.
%
%      REVERSIBLE_DATA_HIDING_IN_ENCRYPTED_MEDICAL_IMAGE('Property','Value',...) creates a new REVERSIBLE_DATA_HIDING_IN_ENCRYPTED_MEDICAL_IMAGE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before reversible_data_hiding_in_encrypted_medical_image_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to reversible_data_hiding_in_encrypted_medical_image_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help reversible_data_hiding_in_encrypted_medical_image

% Last Modified by GUIDE v2.5 30-Jun-2019 18:49:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @reversible_data_hiding_in_encrypted_medical_image_OpeningFcn, ...
                   'gui_OutputFcn',  @reversible_data_hiding_in_encrypted_medical_image_OutputFcn, ...
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


% --- Executes just before reversible_data_hiding_in_encrypted_medical_image is made visible.
function reversible_data_hiding_in_encrypted_medical_image_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to reversible_data_hiding_in_encrypted_medical_image (see VARARGIN)

% Choose default command line output for reversible_data_hiding_in_encrypted_medical_image
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes reversible_data_hiding_in_encrypted_medical_image wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = reversible_data_hiding_in_encrypted_medical_image_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton_image_rebuild_and_encrypt.
function pushbutton_image_rebuild_and_encrypt_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_image_rebuild_and_encrypt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    image_rebuild_and_encrypt;
catch
    h=warndlg('error','少御','modal');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    image_data_hiding;
catch
    h=warndlg('error','少御','modal');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    watermark_reader_and_extractor;
catch
    h=warndlg('error','少御','modal');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    gui_image_decrypt_and_recover;
catch
    h=warndlg('error','少御','modal');
end
