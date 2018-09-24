function [s, ch] = nipxie6368connexion(Signal_Output_Rate,NumberOfAIChannel,NumberOfAOChannel,NumberOfDIChannel,NumberOfDOChannel)
% This function establish a connexion to the NI PXIe 6368 multifunctional
% card. The different analog input/output and digital input/output are set

ch = {};
di = {};
do = {};
daq.reset
daq.HardwareInfo.getInstance('DisableReferenceClockSynchronization',true);

s = daq.createSession('ni');
s.Rate = Signal_Output_Rate ;


    for i=1:NumberOfAIChannel
       ch{i} = ['ch' num2str(i)] ;
       ch{i} = addAnalogInputChannel(s,'Dev1',i-1,'Voltage');
       ch{1,i}.Range = [-10,10];
    end

    
    for j=1:NumberOfAOChannel
       ch{i+j} = ['ch' num2str(j+i)] ;
       ch{i+j} = addAnalogOutputChannel(s,'Dev1',j-1,'Voltage');
    end
    
    for k=1:NumberOfDIChannel
       ch{i+j+k} = ['ch' num2str(k+j+i)] ;
       di{k} = ['Port0/Line' num2str(k-1)];
       ch{i+j+k} = addDigitalChannel(s,'Dev1',di,'InputOnly');
    end
    
    for l=1:NumberOfDOChannel
       ch{i+j+k+l} = ['ch' num2str(l+k+j+i)] ;
       do{l} = ['Port0/Line' num2str(l-1+k)];
       ch{i+j+k+l} = addDigitalChannel(s,'Dev1',do,'OutputOnly');
    end
    

end


