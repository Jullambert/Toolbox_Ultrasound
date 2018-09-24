function [captured_data,time] = startstimulation(s,StimulusWaveform_Y, SynchroSignal)


queueOutputData(s,[StimulusWaveform_Y SynchroSignal]);
duration = s.DurationInSeconds;

[captured_data,time] = startForeground(s);


end