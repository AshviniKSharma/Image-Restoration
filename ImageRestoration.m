function varargout = ImageRestoration(varargin)
% IMAGERESTORATION MATLAB code for ImageRestoration.fig
%      IMAGERESTORATION, by itself, creates a new IMAGERESTORATION or raises the existing
%      singleton*.
%
%      H = IMAGERESTORATION returns the handle to a new IMAGERESTORATION or the handle to
%      the existing singleton*.
%
%      IMAGERESTORATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGERESTORATION.M with the given input arguments.
%
%      IMAGERESTORATION('Property','Value',...) creates a new IMAGERESTORATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ImageRestoration_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ImageRestoration_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ImageRestoration

% Last Modified by GUIDE v2.5 15-Oct-2018 04:56:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ImageRestoration_OpeningFcn, ...
                   'gui_OutputFcn',  @ImageRestoration_OutputFcn, ...
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


% --- Executes just before ImageRestoration is made visible.
function ImageRestoration_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ImageRestoration (see VARARGIN)

% Choose default command line output for ImageRestoration
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ImageRestoration wait for user response (see UIRESUME)
% uiwait(handles.Restoration);


% --- Outputs from this function are returned to the command line.
function varargout = ImageRestoration_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%CODE START%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- Executes on button press in kernel3.
function kernel3_Callback(hObject, eventdata, handles)
% hObject    handle to kernel3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global kernel3
%load kernel3 as double
load ('kernel3.mat');
%show kernel3 when push button is clicked
axes(handles.kernelaxes);
imshow(kernel3);
%four lines below are check for which kernel button is clicked
%this is used to display and obtain correct kernel.
handles.first=0;
handles.second=0;
handles.third=1;
handles.fourth=0;
guidata(hObject, handles);

% --- Executes on button press in kernel2.
function kernel2_Callback(hObject, eventdata, handles)
% hObject    handle to kernel2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global kernel2
%load kernel2 as double
load ('kernel2.mat');
%show kernel2 when push button is clicked
axes(handles.kernelaxes);
imshow(kernel2);
%four lines below are check for which kernel button is clicked
%this is used to display and obtain correct kernel.
handles.first=0;
handles.second=1;
handles.third=0;
handles.fourth=0;
guidata(hObject, handles);

% --- Executes on button press in kernel1.
function kernel1_Callback(hObject, eventdata, handles)
% hObject    handle to kernel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global kernel1
%load kernel1 as double
load ('kernel1.mat');
%show kernel1 when push button is clicked
axes(handles.kernelaxes);
imshow(kernel1);
%four lines below are check for which kernel button is clicked
%this is used to display and obtain correct kernel.
handles.first=1;
handles.second=0;
handles.third=0;
handles.fourth=0;
guidata(hObject, handles);

% --- Executes on button press in kernel4.
function kernel4_Callback(hObject, eventdata, handles)
% hObject    handle to kernel4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global kernel4
%load kernel4 as double
load ('kernel4.mat');
%show kernel4 when push button is clicked
axes(handles.kernelaxes);
imshow(kernel4);
%four lines below are check for which kernel button is clicked
%this is used to display and obtain correct kernel.
handles.first=0;
handles.second=0;
handles.third=0;
handles.fourth=1;
guidata(hObject, handles);

% --------------------------------------------------------------------
function file_Callback(hObject, eventdata, handles)
% hObject    handle to file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function loadBlur_Callback(hObject, eventdata, handles)
% hObject    handle to loadBlur (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
%load file from filemenu
[path,cancel]=imgetfile();
%check if no file loaded(supresses the error)
if cancel                  
    return                 
end
%read file as uint8 matrix image
img=imread(path);
%show image in the first axes
axes(handles.blurryaxes);
imshow(img);



% --------------------------------------------------------------------
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%open file browser for saving file
[filename,user_canceled] = imsave(handles.mainaxes);
%if cancel button clicked do nothing(supresses error)
if user_canceled     
    return
end


% --------------------------------------------------------------------
function quit_Callback(hObject, eventdata, handles)
% hObject    handle to quit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%quit and close the GUI
close all;
close(handles.Assignment2);

% --------------------------------------------------------------------
function groundTruth_Callback(hObject, eventdata, handles)
% hObject    handle to groundTruth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global imgTrue;
%load true/original image from file menu(for PSNR and SSIM)
[path,cancel]=imgetfile();
%check if no file is loaded(supresses error)
if cancel                  
    return                 
end
%read file as uint8 matrix image
imgTrue=imread(path);
%show orignal image in third axes 
axes(handles.originalaxes);
imshow(imgTrue);


% --- Executes on button press in InverseFilter.
function InverseFilter_Callback(hObject, eventdata, handles)
% hObject    handle to InverseFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img kernel1 kernel2 kernel3 kernel4 imgTrue
%check for which kernel is selected
if(handles.first==1 && handles.second==0 && handles.third==0 && handles.fourth==0)
    kernel=kernel1;
elseif(handles.first==0 && handles.second==1 && handles.third==0 && handles.fourth==0)
    kernel=kernel2;
elseif(handles.first==0 && handles.second==0 && handles.third==1 && handles.fourth==0)
    kernel=kernel3;
elseif(handles.first==0 && handles.second==0 && handles.third==0 && handles.fourth==1)
    kernel=kernel4;
end
%applying inverse filtering technique
outputImage=invfilter(img,kernel);
%display result of inverse filtering in first axes
axes(handles.mainaxes)
imshow(outputImage);
%calculate PSNR of resulting image w.r.t. ground truth
%and display it in PSNR text box 
psnrImg=psnr(outputImage,im2double(imgTrue));
set(handles.psnr,'String',psnrImg);
%calculate SSIM of resulting image w.r.t. ground truth
%and display reuslt in SSIM text box
ssimval = ssim(outputImage,im2double(imgTrue));
set(handles.ssim,'String',ssimval);

% --- Executes on button press in butterTruncation.
function butterTruncation_Callback(hObject, eventdata, handles)
% hObject    handle to butterTruncation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img kernel1 kernel2 kernel3 kernel4 imgTrue
%check for which kernel is selected
if(handles.first==1 && handles.second==0 && handles.third==0 && handles.fourth==0)
    kernel=kernel1;
elseif(handles.first==0 && handles.second==1 && handles.third==0 && handles.fourth==0)
    kernel=kernel2;
elseif(handles.first==0 && handles.second==0 && handles.third==1 && handles.fourth==0)
    kernel=kernel3;
elseif(handles.first==0 && handles.second==0 && handles.third==0 && handles.fourth==1)
    kernel=kernel4;
end
%fetching radius from radius text box
D0 = str2double(get(handles.radius,'String'));
%fetching order from order text box
n= str2double(get(handles.order,'String'));
%applying truncated inverse filtering technique
outputImage=butterInv(img,kernel,D0,n);
%display result of truncated inverse filtering in first axes
axes(handles.mainaxes)
imshow(outputImage);
%calculate PSNR of resulting image w.r.t. ground truth
%and display it in PSNR text box 
psnrImg=psnr(outputImage,im2double(imgTrue));
set(handles.psnr,'String',psnrImg);
%calculate SSIM of resulting image w.r.t. ground truth
%and display it in SSIM text box 
ssimval = ssim(outputImage,im2double(imgTrue));
set(handles.ssim,'String',ssimval);

% --- Executes on button press in Weiner.
function Weiner_Callback(hObject, eventdata, handles)
% hObject    handle to Weiner (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img kernel1 kernel2 kernel3 kernel4 imgTrue
%check for which kernel is selected
if(handles.first==1 && handles.second==0 && handles.third==0 && handles.fourth==0)
    kernel=kernel1;
elseif(handles.first==0 && handles.second==1 && handles.third==0 && handles.fourth==0)
    kernel=kernel2;
elseif(handles.first==0 && handles.second==0 && handles.third==1 && handles.fourth==0)
    kernel=kernel3;
elseif(handles.first==0 && handles.second==0 && handles.third==0 && handles.fourth==1)
    kernel=kernel4;
end
%fetching value of K from K text box
K = str2double(get(handles.K,'String'));
%appplying wiener filtering technique
outputImage=wienerFilter(img,kernel,K);
%display result of wiener filtering in first axes
axes(handles.mainaxes)
imshow(outputImage);
%calculate PSNR of resulting image w.r.t. ground truth
%and display it in PSNR text box 
psnrImg=psnr(outputImage,im2double(imgTrue));
set(handles.psnr,'String',psnrImg);
%calculate SSIM of resulting image w.r.t. ground truth
%and display it in SSIM text box 
ssimval = ssim(outputImage,im2double(imgTrue));
set(handles.ssim,'String',ssimval);

% --- Executes on button press in CLS.
function CLS_Callback(hObject, eventdata, handles)
% hObject    handle to CLS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img kernel1 kernel2 kernel3 kernel4 imgTrue
%check for which kernel is selected
if(handles.first==1 && handles.second==0 && handles.third==0 && handles.fourth==0)
    kernel=kernel1;
elseif(handles.first==0 && handles.second==1 && handles.third==0 && handles.fourth==0)
    kernel=kernel2;
elseif(handles.first==0 && handles.second==0 && handles.third==1 && handles.fourth==0)
    kernel=kernel3;
elseif(handles.first==0 && handles.second==0 && handles.third==0 && handles.fourth==1)
    kernel=kernel4;
end
%fetching value of gamma from gamma text box
gamma = str2double(get(handles.gamma,'String'));
%applying CLS filtering technique
outputImage=CLSfilter(img,kernel,gamma);
%display resulting image in main axes
axes(handles.mainaxes)
imshow(outputImage);
%calculate PSNR of resulting image w.r.t. ground truth
%and display it in PSNR text box 
psnrImg=psnr(outputImage,im2double(imgTrue));
set(handles.psnr,'String',psnrImg);
%calculate SSIM of resulting image w.r.t. ground truth
%and display it in SSIM text box 
ssimval = ssim(outputImage,im2double(imgTrue));
set(handles.ssim,'String',ssimval);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%CODE END%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%callback function added for error supression

function radius_Callback(hObject, eventdata, handles)
% hObject    handle to staticradius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of staticradius as text
%        str2double(get(hObject,'String')) returns contents of staticradius as a double

% --- Executes during object creation, after setting all properties.
function radius_CreateFcn(hObject, eventdata, handles)
% hObject    handle to radius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function order_Callback(hObject, eventdata, handles)
% hObject    handle to order (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of order as text
%        str2double(get(hObject,'String')) returns contents of order as a double


% --- Executes during object creation, after setting all properties.
function order_CreateFcn(hObject, eventdata, handles)
% hObject    handle to order (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function K_Callback(hObject, eventdata, handles)
% hObject    handle to K (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of K as text
%        str2double(get(hObject,'String')) returns contents of K as a double


% --- Executes during object creation, after setting all properties.
function K_CreateFcn(hObject, eventdata, handles)
% hObject    handle to K (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function gamma_Callback(hObject, eventdata, handles)
% hObject    handle to gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of gamma as text
%        str2double(get(hObject,'String')) returns contents of gamma as a double


% --- Executes during object creation, after setting all properties.
function gamma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function psnr_Callback(hObject, eventdata, handles)
% hObject    handle to psnr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of psnr as text
%        str2double(get(hObject,'String')) returns contents of psnr as a double


% --- Executes during object creation, after setting all properties.
function psnr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to psnr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ssim_Callback(hObject, eventdata, handles)
% hObject    handle to ssim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ssim as text
%        str2double(get(hObject,'String')) returns contents of ssim as a double


% --- Executes during object creation, after setting all properties.
function ssim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ssim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
