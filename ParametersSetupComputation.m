%%
% Script to calcultae de values to setup in order to get the desired
% derated Ispta value

clear all
clc
%% Params
% Params used as reference
Isppa_1Vpp = [54692.2913 55816.6308 10113.5099]./10000; % [W/cm²]    /10000 to have W/cm² and not W/m²
MI_1Vpp = [0.89168 0.72931 0.29245];
Deration_Factor = [0.183411375 0.126534122 0.094797707]./0.78; %/0.78 to get attenuation factor per cm of skull bone
VppFactor_1Vpp = [0.427216588 0.734547289 1 1.107835435;0.441697373 0.740347957 1 1.119518129; 0.429940984 0.738978789 1 1.174018666];  % raw = freq , col = Vpp

% Params used for the sonication that will not change for the computation
PRF = 1; %[kHz]
SD = 300; %[ms]
FF = 350; %[kHz]
NoC = 200; % number of cycles for a burst
SkullThickness = 0.78;
% Params computed with the previous parameters set
TBD = NoC/FF ; % [ms]
DC = TBD*PRF; 

%% In situ target values (so derated value at the focal distance)

Ispta_Targeted = 0.8072; %[W/cm²] in situ

switch FF
    case 250
        Ispta_NonDerated = Ispta_Targeted/(Deration_Factor(1)*SkullThickness);
        FunctionGeneratorVpp =  Ispta_NonDerated/(Isppa_1Vpp(1)*DC);
        disp('Params to use :')
        disp('Function Generator :')
        disp(['----- Voltage : ' num2str(FunctionGeneratorVpp) ' Vpp'])
        disp(['----- Number of cycles : ' num2str(NoC)])
        disp(['----- Frequency : ' num2str(FF)])
        disp('Master 8 :')
        disp(['----- Number of pulses per train (M) : ' num2str(SD*PRF)])
        disp('----- Length pulse : 1 1e-3')       
        disp(['----- Interval pulse : ' num2str(1/PRF) ' * 1e-3']) 
    
    case 350
        Ispta_NonDerated = Ispta_Targeted/(Deration_Factor(2)*SkullThickness);
        FunctionGeneratorVpp =  Ispta_NonDerated/(Isppa_1Vpp(2)*DC);
        disp('Params to use :')
        disp('Function Generator :')
        disp(['----- Voltage : ' num2str(FunctionGeneratorVpp) ' Vpp'])
        disp(['----- Number of cycles : ' num2str(NoC)])
        disp(['----- Frequency : ' num2str(FF)])
        disp('Master 8 :')
        disp(['----- Number of pulses per train (M) : ' num2str(SD*PRF)])
        disp('----- Length pulse : 1 1e-3')
        
    case 500
        Ispta_NonDerated = Ispta_Targeted/(Deration_Factor(3)*SkullThickness);
        FunctionGeneratorVpp =  Ispta_NonDerated/(Isppa_1Vpp(3)*DC);
        disp('Params to use :')
        disp('Function Generator :')
        disp(['----- Voltage : ' num2str(FunctionGeneratorVpp) ' Vpp'])
        disp(['----- Number of cycles : ' num2str(NoC)])
        disp(['----- Frequency : ' num2str(FF)])
        disp('Master 8 :')
        disp(['----- Number of pulses per train (M) : ' num2str(SD*PRF)])
        disp('----- Length pulse : 1 1e-3')
end

%% A vzerifier sur base des mesures 5 Cycles avec Ispta target, Ispta /attenuation