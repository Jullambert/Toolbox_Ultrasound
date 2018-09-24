function [BurstWaveform_X,BurstWaveform_Y] = burst(Duration,Frequency,Magnitude,Signal_Output_Rate)
% Burst : This function generate a sinusoidal burst based on the input
% arguments.
% The Signal_Output_Rate is related to the output rate of the multifunction
% device connected to the computer.
%
% Units
% ------
% Duration in Second
% Frequency in Hertz
% Magnitude in Volt 
% Signal_Output_Rate in Samples/second

 Burst_Number_Cycle =  Frequency * Duration;  %Burst_Frequency * Burst_Duration /Burst_Repetition ; %20 ;
 Burst_Number_Of_Point_Cycle_Sinewave =  Duration * Signal_Output_Rate ;


BurstWaveform_X = linspace(0, 2*pi*Burst_Number_Cycle, Burst_Number_Of_Point_Cycle_Sinewave+1);
BurstWaveform_Y = Magnitude*sin(BurstWaveform_X)';

BurstWaveform_X(end) = [];
BurstWaveform_Y(end) = [];

BurstWaveform_X = linspace(0,Duration,Burst_Number_Of_Point_Cycle_Sinewave);
BurstWaveform_X = BurstWaveform_X';



end