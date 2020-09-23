function varargout = untitled_fig2(varargin)
% UNTITLED_FIG2 MATLAB code for untitled_fig2.fig
%      UNTITLED_FIG2, by itself, creates a new UNTITLED_FIG2 or raises the existing
%      singleton*.
%
%      H = UNTITLED_FIG2 returns the handle to a new UNTITLED_FIG2 or the handle to
%      the existing singleton*.
%
%      UNTITLED_FIG2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED_FIG2.M with the given input arguments.
%
%      UNTITLED_FIG2('Property','Value',...) creates a new UNTITLED_FIG2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_fig2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_fig2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled_fig2

% Last Modified by GUIDE v2.5 17-Sep-2020 16:27:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_fig2_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_fig2_OutputFcn, ...
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


% --- Executes just before untitled_fig2 is made visible.
function untitled_fig2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled_fig2 (see VARARGIN)

% Choose default command line output for untitled_fig2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled_fig2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_fig2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
idxv = 1
vars{idxv} = str2num(get(handles.editTerrain,'string')); idxv = idxv + 1;
vars{idxv} = str2num(get(handles.editArea,'string')); idxv = idxv + 1;
vars{idxv} = str2num(get(handles.editDensity,'string')); idxv = idxv + 1;
vars{idxv} = str2num(get(handles.editPenetration,'string'))/100; idxv = idxv + 1;
vars{idxv} = str2num(get(handles.editCarriers900,'string')); idxv = idxv + 1;
vars{idxv} = str2num(get(handles.editCarriers1800,'string')); idxv = idxv + 1;
vars{idxv} = str2num(get(handles.editSignalling,'string')); idxv = idxv + 1;
vars{idxv} = str2num(get(handles.editPb,'string'))/100; idxv = idxv + 1;
vars{idxv} = str2num(get(handles.editCI,'string')); idxv = idxv + 1;
vars{idxv} = str2num(get(handles.editFading,'string')); idxv = idxv + 1;
vars{idxv} = str2num(get(handles.editExtra,'string'))/100; idxv = idxv + 1;
vars{idxv} = str2num(get(handles.editCapacity3G,'string'))*1e6; idxv = idxv + 1;
vars{idxv} = str2num(get(handles.editCapacityLTE,'string'))*1e6; idxv = idxv + 1;
vars{idxv} = str2num(get(handles.editVoiceDataConversion,'string'))*1e3; idxv = idxv + 1;
ant_type = get(handles.listBSAntenna,'value');
if ant_type == 1
    vars{idxv} = 0; idxv = idxv + 1;
else
    vars{idxv} = 1; idxv = idxv + 1;
end
vars{idxv} = str2num(get(handles.editLTEEnabled,'string'))/100; idxv = idxv + 1;
vars{idxv} = str2num(get(handles.editStreetWidth,'string')); idxv = idxv + 1;
vars{idxv} = str2num(get(handles.editBuildingsDistance,'string')); idxv = idxv + 1;
vars{idxv} = str2num(get(handles.editMacroBSHeight,'string')); idxv = idxv + 1;
vars{idxv} = str2num(get(handles.editMicroBSHeight,'string')); idxv = idxv + 1;
vars{idxv} = str2num(get(handles.editRoofsHeight,'string')); idxv = idxv + 1;
vars{idxv} = str2num(get(handles.editMSHeight,'string')); idxv = idxv + 1;
vars{idxv} = str2num(get(handles.editGrx,'string')); idxv = idxv + 1;
vars{idxv} = str2num(get(handles.editSrx,'string')); idxv = idxv + 1;
vars{idxv} = ant_type; idxv = idxv + 1;
vars{idxv} = get(handles.uitable1,'Data'); idxv = idxv + 1;
vars{idxv} = get(handles.uitable2,'Data');
vars{idxv}(:,2) = vars{idxv}(:,2).*1e6; idxv = idxv + 1;
vars{idxv} = get(handles.uitableCarriers,'Data');
[total_pop, network_pop, network_density, ...
 pedestrians, Aped, Aped_km2, Cped_km2, ...
 vehicular, Aveh, Aveh_km2, Cveh_km2, ...
 in_buildings, Abui, Abui_km2, Cbui_km2, ...
 Dpedestrians, Dpedestrians_vol, Dped_km2, ...
 Dvehicles, Dvehicles_vol, Dveh_km2, ...
 Din_buildings, Din_buildings_vol, Dbui_km2, ...
 AGSM900, AGSM1800, A3G_cell, Ncc, Ncc_real, ...
 channels_GSM900, channels_GSM1800,...
 channels_cell_GSM900, channels_cell_GSM1800, channels_cell_3G, AGSM900_cell, AGSM1800_cell, ...
 clusters_macro_gsm900_km2, cells_macro_gsm900_km2, clusters_macro_gsm900, cells_macro_gsm900, ...
 cells_macro_3g_km2, cells_macro_3g, cells_macro_lte_km2, cells_macro_lte, ...
 Area_macrocell_gsm900, Area_macrocell_3g, Area_macrocell_lte, Radius_macrocell_gsm900, Radius_macrocell_3g, Radius_macrocell_lte, ...
 clusters_micro_gsm1800_km2, cells_micro_gsm1800_km2, clusters_micro_gsm1800, cells_micro_gsm1800, ...
 cells_micro_3g_km2, cells_micro_3g, cells_micro_lte_km2, cells_micro_lte, ...
 Area_microcell_gsm1800, Area_microcell_3g, Area_microcell_lte, Radius_microcell_gsm1800, Radius_microcell_3g, Radius_microcell_lte, ...
 Lfs_macro_gsm900, Lfs_macro_3g, Lfs_macro_lte, Lfs_micro_gsm1800, Lfs_micro_3g, Lfs_micro_lte, ...
 Lb_macro_gsm900, Lb_macro_3g, Lb_macro_lte, Lb_micro_gsm1800, Lb_micro_3g, Lb_micro_lte, ...
 Ptx_macro_gsm900, Ptx_macro_3g, Ptx_macro_lte, Ptx_micro_gsm1800, Ptx_micro_3g, Ptx_micro_lte, Gtx] = untitled(vars{:})

idx = 1
output{idx,1} = sprintf(''); idx = idx +1;
output{idx,1} = sprintf('############### General parameters #############################################'); idx = idx +1;
output{idx,1} = sprintf('Terrain type|area: %d|%d km2', vars{1}, vars{2}); idx = idx +1;
output{idx,1} = sprintf('Population total|density: %d users|%d users/km2, Network total|density: %d users|%d users/km2', total_pop, vars{3}, network_pop, network_density); idx = idx +1;
output{idx,1} = sprintf('Pb: %d %%, C/I: %d dB, Ncc: %d', vars{8}, vars{9}, Ncc_real); idx = idx +1;
output{idx,1} = sprintf('carriers GSM900|GSM1800|3G (5 MHz)|LTE (20 MHz): %d|%d|%d|%d', vars{5}, vars{6}, 3, 4); idx = idx +1;
output{idx,1} = sprintf('voice/data conversion factor: %d kbps', vars{14}/1e3); idx = idx +1;
output{idx,1} = sprintf('LTE-enabled users: %d %%', vars{16}*100); idx = idx +1;
output{idx,1} = sprintf('Signalling channels: %d', vars{7}); idx = idx +1;
output{idx,1} = sprintf('Extra traffic: %d %%', vars{11}*100); idx = idx +1;

output{idx,1} = sprintf(''); idx = idx +1;
output{idx,1} = sprintf('############### Voice service ##################################################'); idx = idx +1;
output{idx,1} = sprintf('Pedestrians: %d Erl/km2', Aped_km2); idx = idx +1;
output{idx,1} = sprintf('In-Vehicles: %d Erl/km2', Aveh_km2); idx = idx +1;
output{idx,1} = sprintf('In-buildings: %d Erl/km2', Abui_km2); idx = idx +1;
output{idx,1} = sprintf('voice channels per cluster GSM900|GSM1800: %d|%d, voice channels per cell 3G: %d', channels_GSM900, channels_GSM1800, channels_cell_3G); idx = idx +1;
output{idx,1} = sprintf('voice capacity per cluster GSM900|GSM1800: %d|%d Erl/cluster', AGSM900, AGSM1800); idx = idx +1;
output{idx,1} = sprintf('voice capacity per cell GSM900|GSM1800|3G: %d|%d|%d Erl/cell', AGSM900_cell, AGSM1800_cell, A3G_cell); idx = idx +1;

output{idx,1} = sprintf(''); idx = idx +1;
output{idx,1} = sprintf('############### Data service ###################################################'); idx=idx+1;
output{idx,1} = sprintf('Pedestrians: %d Mbps/km2', Aped_km2); idx = idx +1;
output{idx,1} = sprintf('In-Vehicles: %d Mbps/km2', Aveh_km2); idx = idx +1;
output{idx,1} = sprintf('In-buildings: %d Mbps/km2', Abui_km2); idx = idx +1;
output{idx,1} = sprintf('data capacity per cell 3G/LTE: %d/%d Mbps/cell', vars{12}/1e6, vars{13}/1e6); idx = idx +1;

output{idx,1} = sprintf(''); idx = idx +1;
output{idx,1} = sprintf('############### Macro cells (In-vehicles traffic) ##############################'); idx = idx +1;
output{idx,1} = sprintf('GSM900 macro-(clusters|cells) density: (%d|%d)/km2', clusters_macro_gsm900_km2, cells_macro_gsm900_km2); idx = idx +1;
output{idx,1} = sprintf('GSM900 total macro-(clusters|cells): %d|%d', clusters_macro_gsm900, cells_macro_gsm900); idx = idx +1;
output{idx,1} = sprintf('3G|LTE macro-cells density: %d|%d cells/km2', cells_macro_3g_km2, cells_macro_lte_km2); idx = idx +1;
output{idx,1} = sprintf('3G|LTE macro-cells: %d|%d cells', cells_macro_3g, cells_macro_lte); idx = idx +1;
output{idx,1} = sprintf('GSM900|3G|LTE macro-cell (radius|area): (%d|%d)|(%d|%d)|(d%|%d) (km/km2)', Radius_macrocell_gsm900, Area_macrocell_gsm900, Radius_macrocell_3g, Area_macrocell_3g, Radius_macrocell_lte, Area_macrocell_lte); idx = idx +1;

output{idx,1} = sprintf(''); idx = idx +1;
output{idx,1} = sprintf('############### Micro cells (Pedestrians + In-buildings traffic) ###############'); idx = idx +1;
output{idx,1} = sprintf('GSM1800 micro-clusters|cells per km2: %d|%d clusters/km2', clusters_micro_gsm1800_km2, cells_micro_gsm1800_km2); idx = idx +1;
output{idx,1} = sprintf('GSM1800 total micro-clusters|cells: %d|%d clusters', cells_micro_gsm1800, cells_micro_gsm1800); idx = idx +1;
output{idx,1} = sprintf('3G|LTE micro-cells per km2: %d|%d', cells_micro_3g_km2, cells_micro_lte_km2); idx = idx +1;
output{idx,1} = sprintf('3G|LTE micro-cells: %d|%d', cells_micro_3g, cells_micro_lte); idx = idx +1;
output{idx,1} = sprintf('GSM1800|3G|LTE micro-cell (radius|area): (%d|%d)|(%d|%d)|(d%|%d) (km/km2)', Radius_microcell_gsm1800, Area_microcell_gsm1800, Radius_microcell_3g, Area_microcell_3g, Radius_microcell_lte, Area_microcell_lte); idx = idx +1;

output{idx,1} = sprintf(''); idx = idx +1;
output{idx,1} = sprintf('############### Propagation Model (Walfisch-Ikegami) ###########################'); idx = idx +1;
output{idx,1} = sprintf('Fading margin: %d dB', vars{10}); idx = idx +1;
output{idx,1} = sprintf('Street width|buildings distance: %d|%d m', vars{17}, vars{18}); idx = idx +1;
output{idx,1} = sprintf('Macro BS|Micro BS|roof|MS height: %d|%d|%d|%d m', vars{19}, vars{20}, vars{21}, vars{22}); idx = idx +1;
output{idx,1} = sprintf('Lfs macro-cell GSM900|3G|LTE: %d|%d|%d dB', Lfs_macro_gsm900, Lfs_macro_3g, Lfs_macro_lte); idx = idx +1;
output{idx,1} = sprintf('Lfs micro-cell GSM900|3G|LTE: %d|%d|%d dB', Lfs_micro_gsm1800, Lfs_micro_3g, Lfs_micro_lte); idx = idx +1;
output{idx,1} = sprintf('Ltotal (Lfs + Lrts + Lmsd) macro-cell GSM900|3G|LTE: %d|%d|%d dB', Lb_macro_gsm900, Lb_macro_3g, Lb_macro_lte); idx = idx +1;
output{idx,1} = sprintf('Ltotal (Lfs + Lrts + Lmsd) micro-cell GSM1800|3G|LTE: %d|%d|%d dB', Lb_micro_gsm1800, Lb_micro_3g, Lb_micro_lte); idx = idx +1;

output{idx,1} = sprintf('Grx: %d dBi, Srx: %d dBm, Gtx: %d dBi', vars{23}, vars{24}, Gtx); idx = idx +1;
output{idx,1} = sprintf('Ptx (Srx + Ltotal - Gtx - Grx) macro-cell GSM900|3G|LTE: %d|%d|%d dBm', Ptx_macro_gsm900, Ptx_macro_3g, Ptx_macro_lte); idx = idx +1;
output{idx,1} = sprintf('Ptx (Srx + Ltotal - Gtx - Grx) micro-cell GSM1800|3G|LTE: %d|%d|%d dBm', Ptx_micro_gsm1800, Ptx_micro_3g, Ptx_micro_lte); idx = idx +1;
untitled_fig3(output)
% set(handles.editResults, 'string', output)

function editTerrain_Callback(hObject, eventdata, handles)
% hObject    handle to editTerrain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editTerrain as text
%        str2double(get(hObject,'String')) returns contents of editTerrain as a double


% --- Executes during object creation, after setting all properties.
function editTerrain_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editTerrain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editArea_Callback(hObject, eventdata, handles)
% hObject    handle to editArea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editArea as text
%        str2double(get(hObject,'String')) returns contents of editArea as a double


% --- Executes during object creation, after setting all properties.
function editArea_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editArea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editDensity_Callback(hObject, eventdata, handles)
% hObject    handle to editDensity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editDensity as text
%        str2double(get(hObject,'String')) returns contents of editDensity as a double


% --- Executes during object creation, after setting all properties.
function editDensity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editDensity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editPenetration_Callback(hObject, eventdata, handles)
% hObject    handle to editPenetration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editPenetration as text
%        str2double(get(hObject,'String')) returns contents of editPenetration as a double


% --- Executes during object creation, after setting all properties.
function editPenetration_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editPenetration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editCarriers900_Callback(hObject, eventdata, handles)
% hObject    handle to editCarriers900 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editCarriers900 as text
%        str2double(get(hObject,'String')) returns contents of editCarriers900 as a double


% --- Executes during object creation, after setting all properties.
function editCarriers900_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editCarriers900 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editCarriers1800_Callback(hObject, eventdata, handles)
% hObject    handle to editCarriers1800 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editCarriers1800 as text
%        str2double(get(hObject,'String')) returns contents of editCarriers1800 as a double


% --- Executes during object creation, after setting all properties.
function editCarriers1800_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editCarriers1800 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editSignalling_Callback(hObject, eventdata, handles)
% hObject    handle to editSignalling (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editSignalling as text
%        str2double(get(hObject,'String')) returns contents of editSignalling as a double


% --- Executes during object creation, after setting all properties.
function editSignalling_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editSignalling (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editPb_Callback(hObject, eventdata, handles)
% hObject    handle to editPb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editPb as text
%        str2double(get(hObject,'String')) returns contents of editPb as a double


% --- Executes during object creation, after setting all properties.
function editPb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editPb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editCI_Callback(hObject, eventdata, handles)
% hObject    handle to editCI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editCI as text
%        str2double(get(hObject,'String')) returns contents of editCI as a double


% --- Executes during object creation, after setting all properties.
function editCI_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editCI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editFading_Callback(hObject, eventdata, handles)
% hObject    handle to editFading (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editFading as text
%        str2double(get(hObject,'String')) returns contents of editFading as a double


% --- Executes during object creation, after setting all properties.
function editFading_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editFading (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editExtra_Callback(hObject, eventdata, handles)
% hObject    handle to editExtra (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editExtra as text
%        str2double(get(hObject,'String')) returns contents of editExtra as a double


% --- Executes during object creation, after setting all properties.
function editExtra_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editExtra (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editCapacity3G_Callback(hObject, eventdata, handles)
% hObject    handle to editCapacity3G (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editCapacity3G as text
%        str2double(get(hObject,'String')) returns contents of editCapacity3G as a double


% --- Executes during object creation, after setting all properties.
function editCapacity3G_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editCapacity3G (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editCapacityLTE_Callback(hObject, eventdata, handles)
% hObject    handle to editCapacityLTE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editCapacityLTE as text
%        str2double(get(hObject,'String')) returns contents of editCapacityLTE as a double


% --- Executes during object creation, after setting all properties.
function editCapacityLTE_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editCapacityLTE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editVoiceDataConversion_Callback(hObject, eventdata, handles)
% hObject    handle to editVoiceDataConversion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editVoiceDataConversion as text
%        str2double(get(hObject,'String')) returns contents of editVoiceDataConversion as a double


% --- Executes during object creation, after setting all properties.
function editVoiceDataConversion_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editVoiceDataConversion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editLTEEnabled_Callback(hObject, eventdata, handles)
% hObject    handle to editLTEEnabled (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editLTEEnabled as text
%        str2double(get(hObject,'String')) returns contents of editLTEEnabled as a double


% --- Executes during object creation, after setting all properties.
function editLTEEnabled_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editLTEEnabled (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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



function editStreetWidth_Callback(hObject, eventdata, handles)
% hObject    handle to editStreetWidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editStreetWidth as text
%        str2double(get(hObject,'String')) returns contents of editStreetWidth as a double


% --- Executes during object creation, after setting all properties.
function editStreetWidth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editStreetWidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editBuildingsDistance_Callback(hObject, eventdata, handles)
% hObject    handle to editBuildingsDistance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editBuildingsDistance as text
%        str2double(get(hObject,'String')) returns contents of editBuildingsDistance as a double


% --- Executes during object creation, after setting all properties.
function editBuildingsDistance_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editBuildingsDistance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editMacroBSHeight_Callback(hObject, eventdata, handles)
% hObject    handle to editMacroBSHeight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editMacroBSHeight as text
%        str2double(get(hObject,'String')) returns contents of editMacroBSHeight as a double


% --- Executes during object creation, after setting all properties.
function editMacroBSHeight_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editMacroBSHeight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editMicroBSHeight_Callback(hObject, eventdata, handles)
% hObject    handle to editMicroBSHeight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editMicroBSHeight as text
%        str2double(get(hObject,'String')) returns contents of editMicroBSHeight as a double


% --- Executes during object creation, after setting all properties.
function editMicroBSHeight_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editMicroBSHeight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editRoofsHeight_Callback(hObject, eventdata, handles)
% hObject    handle to editRoofsHeight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editRoofsHeight as text
%        str2double(get(hObject,'String')) returns contents of editRoofsHeight as a double


% --- Executes during object creation, after setting all properties.
function editRoofsHeight_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editRoofsHeight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editMSHeight_Callback(hObject, eventdata, handles)
% hObject    handle to editMSHeight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editMSHeight as text
%        str2double(get(hObject,'String')) returns contents of editMSHeight as a double


% --- Executes during object creation, after setting all properties.
function editMSHeight_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editMSHeight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editGrx_Callback(hObject, eventdata, handles)
% hObject    handle to editGrx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editGrx as text
%        str2double(get(hObject,'String')) returns contents of editGrx as a double


% --- Executes during object creation, after setting all properties.
function editGrx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editGrx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editSrx_Callback(hObject, eventdata, handles)
% hObject    handle to editSrx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editSrx as text
%        str2double(get(hObject,'String')) returns contents of editSrx as a double


% --- Executes during object creation, after setting all properties.
function editSrx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editSrx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listBSAntenna.
function listBSAntenna_Callback(hObject, eventdata, handles)
% hObject    handle to listBSAntenna (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listBSAntenna contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listBSAntenna


% --- Executes during object creation, after setting all properties.
function listBSAntenna_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listBSAntenna (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit44_Callback(hObject, eventdata, handles)
% hObject    handle to editResults (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editResults as text
%        str2double(get(hObject,'String')) returns contents of editResults as a double


% --- Executes during object creation, after setting all properties.
function edit44_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editResults (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit46_Callback(hObject, eventdata, handles)
% hObject    handle to edit46 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit46 as text
%        str2double(get(hObject,'String')) returns contents of edit46 as a double


% --- Executes during object creation, after setting all properties.
function edit46_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit46 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit47_Callback(hObject, eventdata, handles)
% hObject    handle to edit47 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit47 as text
%        str2double(get(hObject,'String')) returns contents of edit47 as a double


% --- Executes during object creation, after setting all properties.
function edit47_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit47 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
