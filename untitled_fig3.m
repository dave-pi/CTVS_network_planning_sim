function varargout = untitled_fig3(varargin)
% UNTITLED_FIG3 MATLAB code for untitled_fig3.fig
%      UNTITLED_FIG3, by itself, creates a new UNTITLED_FIG3 or raises the existing
%      singleton*.
%
%      H = UNTITLED_FIG3 returns the handle to a new UNTITLED_FIG3 or the handle to
%      the existing singleton*.
%
%      UNTITLED_FIG3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED_FIG3.M with the given input arguments.
%
%      UNTITLED_FIG3('Property','Value',...) creates a new UNTITLED_FIG3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_fig3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_fig3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled_fig3

% Last Modified by GUIDE v2.5 17-Sep-2020 15:27:56

% Begin initialization code - DO NOT EDIT

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_fig3_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_fig3_OutputFcn, ...
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


% --- Executes just before untitled_fig3 is made visible.
function untitled_fig3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled_fig3 (see VARARGIN)

% Choose default command line output for untitled_fig3
handles.output = hObject;
set(handles.editResults, 'string', varargin{1})
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled_fig3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_fig3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function editResults_Callback(hObject, eventdata, handles)
% hObject    handle to editResults (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editResults as text
%        str2double(get(hObject,'String')) returns contents of editResults as a double


% --- Executes during object creation, after setting all properties.
function editResults_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editResults (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
