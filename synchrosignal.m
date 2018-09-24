function [SynchroSignal_X,SynchroSignal_Y] = synchrosignal(Stimulus_Duration,Frequency,Delay,Signal_Output_Rate)
% SYNCHROSIGNAL generate a one second synchro signal to be send trough a Digital
% Output of a multifunction device with a defined frequency.
% The TTL has a duration of 2 [ms] 



OneSecondWaveform_Index = [];
OneSecondWaveform = zeros(Signal_Output_Rate,1);

OneSecondTTL = zeros(Signal_Output_Rate,1);

TTL_Duration = 0.0002; %[s]
TTL_Pulse = true(1,TTL_Duration*Signal_Output_Rate);

    for i = 1:Frequency
        OneSecondWaveform_Index = [1:(length(OneSecondWaveform)/Frequency):length(OneSecondWaveform)];
        OneSecondTTL(OneSecondWaveform_Index(i):OneSecondWaveform_Index(i)+(length(TTL_Pulse))-1) = TTL_Pulse;
    end

SynchroSignal_Y = repmat(OneSecondTTL, Stimulus_Duration, 1);

    if Delay~=0
        
        D = zeros(Delay*Signal_Output_Rate,1);
        Synchro = [D ;SynchroSignal_Y];
        %Waveform(end-(Delay*Signal_Output_Rate)+1:end) = [];
        x = linspace(0,Stimulus_Duration+Delay,length(Synchro));
        SynchroSignal_Y = Synchro;
    else
       
    end 
    
SynchroSignal_X = linspace(0,Stimulus_Duration+Delay,length(SynchroSignal_Y));
end