function [StimulusWaveform_X,StimulusWaveform_Y] = stimulus(Duration,Frequency,Delay,BurstWaveform,Signal_Output_Rate,NumberOfAOChannel)
% STIMULUS create a burst (BurstWaveform) repetition at a specified frequency for a precise
% Duration.
% The Signal_Output_Rate is related to the output rate of the multifunction
% device connected to the computer.
%
% Units
% -----
% Duration in Second
% Frequency in Hertz
% Signal_Output_Rate in Samples/second


 OneSecondWaveform = zeros(Signal_Output_Rate,1);
 OneSecondWaveform_Index = [];
 
    for i = 1:Frequency
        OneSecondWaveform_Index = [1:(length(OneSecondWaveform)/Frequency):length(OneSecondWaveform)];
        OneSecondWaveform(OneSecondWaveform_Index(i):OneSecondWaveform_Index(i)+(length(BurstWaveform))-1) = BurstWaveform;
    end

 

StimulusWaveform_Y = repmat(OneSecondWaveform,Duration, 1); 

    if Delay~=0
        
        D = zeros(Delay*Signal_Output_Rate,1);
        Waveform = [D ;StimulusWaveform_Y];
        %Waveform(end-(Delay*Signal_Output_Rate)+1:end) = [];
        x = linspace(0,Duration+Delay,length(Waveform));
        StimulusWaveform_Y = Waveform;
        
    else
       
    end 

StimulusWaveform_X = linspace(0,Duration+Delay,length(StimulusWaveform_Y));
    for j=1:NumberOfAOChannel

        StimulusWaveform_Y(:,j) = StimulusWaveform_Y(:);
    end

end



