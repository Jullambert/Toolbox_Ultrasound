function varargout = GUI_US_Stimulation(varargin)
% GUI_US_STIMULATION MATLAB code for GUI_US_Stimulation.fig
%      GUI_US_STIMULATION, by itself, creates a new GUI_US_STIMULATION or raises the existing
%      singleton*.
%
%      H = GUI_US_STIMULATION returns the handle to a new GUI_US_STIMULATION or the handle to
%      the existing singleton*.
%
%      GUI_US_STIMULATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_US_STIMULATION.M with the given input arguments.
%
%      GUI_US_STIMULATION('Property','Value',...) creates a new GUI_US_STIMULATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_US_Stimulation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_US_Stimulation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_US_Stimulation

% Last Modified by GUIDE v2.5 17-Mar-2015 10:56:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_US_Stimulation_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_US_Stimulation_OutputFcn, ...
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


% --- Executes just before GUI_US_Stimulation is made visible.
function GUI_US_Stimulation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_US_Stimulation (see VARARGIN)

% Choose default command line output for GUI_US_Stimulation
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_US_Stimulation wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_US_Stimulation_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function Burst_Duration_Callback(hObject, eventdata, handles)
% hObject    handle to Burst_Duration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Burst_Duration as text
%        str2double(get(hObject,'String')) returns contents of Burst_Duration as a double


% --- Executes during object creation, after setting all properties.
function Burst_Duration_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Burst_Duration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Burst_Frequency_Callback(hObject, eventdata, handles)
% hObject    handle to Burst_Frequency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Burst_Frequency as text
%        str2double(get(hObject,'String')) returns contents of Burst_Frequency as a double


% --- Executes during object creation, after setting all properties.
function Burst_Frequency_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Burst_Frequency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Burst_Magnitude_Callback(hObject, eventdata, handles)
% hObject    handle to Burst_Magnitude (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Burst_Magnitude as text
%        str2double(get(hObject,'String')) returns contents of Burst_Magnitude as a double


% --- Executes during object creation, after setting all properties.
function Burst_Magnitude_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Burst_Magnitude (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Signal_Output_Rate_Callback(hObject, eventdata, handles)
% hObject    handle to Signal_Output_Rate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Signal_Output_Rate as text
%        str2double(get(hObject,'String')) returns contents of Signal_Output_Rate as a double


% --- Executes during object creation, after setting all properties.
function Signal_Output_Rate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Signal_Output_Rate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Stimulus_Duration_Callback(hObject, eventdata, handles)
% hObject    handle to Stimulus_Duration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Stimulus_Duration as text
%        str2double(get(hObject,'String')) returns contents of Stimulus_Duration as a double


% --- Executes during object creation, after setting all properties.
function Stimulus_Duration_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Stimulus_Duration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Burst_Repetition_Frequency_Callback(hObject, eventdata, handles)
% hObject    handle to Burst_Repetition_Frequency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Burst_Repetition_Frequency as text
%        str2double(get(hObject,'String')) returns contents of Burst_Repetition_Frequency as a double


% --- Executes during object creation, after setting all properties.
function Burst_Repetition_Frequency_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Burst_Repetition_Frequency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NumberOfAIChannel_Callback(hObject, eventdata, handles)
% hObject    handle to NumberOfAIChannel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumberOfAIChannel as text
%        str2double(get(hObject,'String')) returns contents of NumberOfAIChannel as a double


% --- Executes during object creation, after setting all properties.
function NumberOfAIChannel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumberOfAIChannel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NumberOfAOChannel_Callback(hObject, eventdata, handles)
% hObject    handle to NumberOfAOChannel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumberOfAOChannel as text
%        str2double(get(hObject,'String')) returns contents of NumberOfAOChannel as a double


% --- Executes during object creation, after setting all properties.
function NumberOfAOChannel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumberOfAOChannel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NumberOfDIChannel_Callback(hObject, eventdata, handles)
% hObject    handle to NumberOfDIChannel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumberOfDIChannel as text
%        str2double(get(hObject,'String')) returns contents of NumberOfDIChannel as a double


% --- Executes during object creation, after setting all properties.
function NumberOfDIChannel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumberOfDIChannel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NumberOfDOChannel_Callback(hObject, eventdata, handles)
% hObject    handle to NumberOfDOChannel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumberOfDOChannel as text
%        str2double(get(hObject,'String')) returns contents of NumberOfDOChannel as a double


% --- Executes during object creation, after setting all properties.
function NumberOfDOChannel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumberOfDOChannel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Create_Burst.
function Create_Burst_Callback(hObject, eventdata, handles)
% hObject    handle to Create_Burst (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global BurstWaveform_Y;
global BurstDuration;
Duration = str2num(get(handles.Burst_Duration,'String'));
Frequency = str2num(get(handles.Burst_Frequency,'String'));
Magnitude = str2num(get(handles.Burst_Magnitude,'String'));
BurstDuration = Duration;
Signal_Output_Rate = str2num(get(handles.Signal_Output_Rate,'String'));

[BurstWaveform_X,BurstWaveform_Y] = burst(Duration,Frequency,Magnitude,Signal_Output_Rate);
save('Burst.mat','Duration','Frequency','Magnitude','Signal_Output_Rate')
if get(handles.Burst_Preview,'Value')==1
    figure()
    plot(BurstWaveform_X,BurstWaveform_Y);
    title('Burst Waveform Preview')
    xlabel('Time[s]')
    ylabel('Burst Magnitude [V]')
end
    

% --- Executes on button press in Create_Stimulus.
function Create_Stimulus_Callback(hObject, eventdata, handles)
% hObject    handle to Create_Stimulus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global BurstWaveform_Y;
global StimulusWaveform_Y;
global SynchroSignal_Y;
global BurstDuration;

Duration = str2num(get(handles.Stimulus_Duration,'String'));
Frequency = str2num(get(handles.Burst_Repetition_Frequency,'String'));
Delay = str2num(get(handles.Stimulus_Onset,'String'));
BurstWaveform = BurstWaveform_Y;
NumberOfAOChannel = str2num(get(handles.NumberOfAOChannel,'String'));
Signal_Output_Rate = str2num(get(handles.Signal_Output_Rate,'String'));

if Frequency >= (1/BurstDuration)
    set(handles.Error_Message,'FontSize',12)
    set(handles.Error_Message,'ForegroundColor','red')
    set(handles.Error_Message,'String','!!! Stimulus non généré car il y a incompatibilité entre la durée du Burst et la fréquence de répétition !!!');
    
else
   [StimulusWaveform_X,StimulusWaveform_Y] = stimulus(Duration,Frequency,Delay,BurstWaveform,Signal_Output_Rate,NumberOfAOChannel);
   [SynchroSignal_X,SynchroSignal_Y] = synchrosignal(Duration,Frequency,Delay,Signal_Output_Rate); 
   save('Stimulus.mat','StimulusWaveform_X','StimulusWaveform_Y','SynchroSignal_X','SynchroSignal_Y','Signal_Output_Rate')
    
end



    if get(handles.Stimulus_Preview,'Value')==1
        figure()
        plot(StimulusWaveform_X,StimulusWaveform_Y);
        hold on
        plot(SynchroSignal_X,SynchroSignal_Y);
    %plot(handles.Stimulus_Plot,StimulusWaveform_X,StimulusWaveform_Y);
        title('Stimulus Waveform and Synchro Signal Preview')
        xlabel('Time[s]')
        ylabel('Stimulus Magnitude [V]')
    end


% --- Executes on button press in Setup_PXIe6368.
function Setup_PXIe6368_Callback(hObject, eventdata, handles)
% hObject    handle to Setup_PXIe6368 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s;
NumberOfAIChannel = str2num(get(handles.NumberOfAIChannel,'String'));
NumberOfAOChannel = str2num(get(handles.NumberOfAOChannel,'String'));

NumberOfDIChannel = str2num(get(handles.NumberOfDIChannel,'String'));
NumberOfDOChannel = str2num(get(handles.NumberOfDOChannel,'String'));

Signal_Output_Rate = str2num(get(handles.Signal_Output_Rate,'String'));

[s, ch] = nipxie6368connexion(Signal_Output_Rate,NumberOfAIChannel,NumberOfAOChannel,NumberOfDIChannel,NumberOfDOChannel);

% --- Executes on button press in Start_Acqui_Stim.
function Start_Acqui_Stim_Callback(hObject, eventdata, handles)
% hObject    handle to Start_Acqui_Stim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global StimulusWaveform_Y;
global SynchroSignal_Y;
global s;

[captured_data,time] = startstimulation(s,StimulusWaveform_Y, SynchroSignal_Y);
plot(handles.DataRecorded_Plot,time,captured_data);



function Stimulus_Onset_Callback(hObject, eventdata, handles)
% hObject    handle to Stimulus_Onset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Stimulus_Onset as text
%        str2double(get(hObject,'String')) returns contents of Stimulus_Onset as a double


% --- Executes during object creation, after setting all properties.
function Stimulus_Onset_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Stimulus_Onset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function Error_Message_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Error_Message (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in Burst_Preview.
function Burst_Preview_Callback(hObject, eventdata, handles)
% hObject    handle to Burst_Preview (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Burst_Preview


% --- Executes on button press in Stimulus_Preview.
function Stimulus_Preview_Callback(hObject, eventdata, handles)
% hObject    handle to Stimulus_Preview (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Stimulus_Preview
