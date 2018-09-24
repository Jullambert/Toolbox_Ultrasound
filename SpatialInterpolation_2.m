%%
% Idea of the script :
% We observed variation in Isppa from one measurement session to another
% one. There are 2 possibilities that may explain those variations:
% 1)Those variations are related to the incertainties related to the
% devices ! They are not systematic errors but random!! --> Creating a
% Statistical model/distribution based on the data

% 2) Lack of mechanical position reproductibility (we know that there are
% thens of mm of variation from one session to another for the distance
% between hydrophone to transducer) --> we observed with André that there 
% no mechanical problem!
% Still we will create a way to interpolate, based on the interpolation
% of the spatial position, the amplitude and phase of the pressure signal and then
% recreate the pressure signal in the time domain in order to calculate
% correctly the Isppa. Then we will compare those new plane with X,Y-
% interpolation to another plan of reference.
%

% Ideas about algorithm to use:
% 1) Interp2
%Vq = interp2(X,Y,V,Xq,Yq) returns interpolated values of a function of 
% two variables at specific query points using linear interpolation. 
% The results always pass through the original sampling of the function. 
%X and Y contain the coordinates of the sample points. 
%V contains the corresponding function values at each sample point. 
%Xq and Yq contain the coordinates of the query points.

% 2) griddata
% vq = griddata(x,y,v,xq,yq) fits a surface of the form v = f(x,y) to the scattered data in the vectors (x,y,v). 
% The griddata function interpolates the surface at the query points 
% specified by (xq,yq) and returns the interpolated values, vq. 
% The surface always passes through the data points defined by x and y.
clc
clear all
%% 1. Constant for the analysis
XTABLEinit = -40; %[mm]
XTABLEstep = 2; %[mm]
XTABLEend = 60; %[mm]
YTABLEinit = -25; %[mm]
YTABLEstep = 2; %[mm]
YTABLEend = 25; %[mm]
[X,Y] = meshgrid(XTABLEinit:XTABLEstep:XTABLEend,YTABLEinit:YTABLEstep:YTABLEend);
NSamples = 2^14;
SamplingFrequency = 60000000;
T= [0:(NSamples-1)]/SamplingFrequency;
UltrasoundBurstFrequency = 350000;
Index_Freq_Interest = round(UltrasoundBurstFrequency/SamplingFrequency*NSamples+NSamples/2+1);


% load('FFTAnalysis_SessionAttenuation_SansCrane_1Vpp_200Cycles_6Freq_Sans_1_300kHz.mat'); % Should be AMplitude and phasis of pressure 
filename_FFTsignal_to_extrapolate = 'FFTAnalysis_SessionJuin2016_SansCrane_1Vpp_5Cyc_3Freq_Verif_350kHz.mat';
load(filename_FFTsignal_to_extrapolate)
filename_Paramsignal_to_extrapolate = 'ParamAnalysis_SessionJuin2016_SansCrane_1Vpp_5Cyc_3Freq_Verif_350kHz.mat';
load(filename_Paramsignal_to_extrapolate,'DistanceTransducteurHydrophone')
Transmittance = FFT_vecteur_Burst_Tension_Hydro(:,:,Index_Freq_Interest)./FFT_vecteur_Burst_Tension_FunGen(:,:,Index_Freq_Interest);

% Plot the coarse sampling.
% figure
% surf(X,Y,AMP)
% title('Original spatial sampling - Amplitude');
% figure
% surf(X,Y,DEPH)
% title('Original spatial sampling - Dephasage');
% 
% plot(Freq_Axis,squeeze(abs(FFT_vecteur_Burst_Tension_Hydro(x,y,:))))
clear FFT_vecteur_Burst_Tension_Hydro FFT_vecteur_Burst_Tension_FunGen

Dx = (length(X)-1)*XTABLEstep:-XTABLEstep:0;
for i=1:length(X)
    for j=1:size(Y,1)
       R(j,i) = sqrt(((Dx(i)+DistanceTransducteurHydrophone)^2) + (Y(j,1)^2)); 
    end
end

disp('1. Initialisation done!')
%% 2. Amplitude and Phasis interpolation according to the a spatial shift
Xq_step = 0.1;
Xq_delta = -0.9:Xq_step:0.9;
Yq_step = 0.1;
Yq_delta = -0.9:Yq_step:0.9;

for i = 1:length(Xq_delta)
    for j = 1:length(Yq_delta)

        if ((XTABLEinit+Xq_delta(i)) < XTABLEinit) && ((YTABLEinit+Yq_delta(j)) < YTABLEinit)
            Xinit = XTABLEinit;
            Xend = XTABLEend+Xq_delta(i);
            Yinit = YTABLEinit;
            Yend = YTABLEend+Yq_delta(j);
        elseif ((XTABLEinit+Xq_delta(i)) < XTABLEinit) && ((YTABLEend+Yq_delta(j)) > YTABLEend)
            Xinit = XTABLEinit;
            Xend = XTABLEend+Xq_delta(i);
            Yinit = YTABLEinit+Yq_delta(j);
            Yend = YTABLEend;
        elseif ((XTABLEend+Xq_delta(i)) > XTABLEend) && ((YTABLEinit+Yq_delta(j)) < YTABLEinit)
            Xinit = XTABLEinit+Xq_delta(i);
            Xend = XTABLEend;
            Yinit = YTABLEinit;
            Yend = YTABLEend+Yq_delta(j);
        elseif ((XTABLEend+Xq_delta(i)) > XTABLEend) && ((YTABLEend+Yq_delta(j)) > YTABLEend)
            Xinit = XTABLEinit+Xq_delta(i);
            Xend = XTABLEend;
            Yinit = YTABLEinit+Yq_delta(j);
            Yend = YTABLEend;
        elseif (XTABLEinit+Xq_delta(i)) < XTABLEinit  
            Xinit = XTABLEinit;
            Xend = XTABLEend+Xq_delta(i);
            Yinit = YTABLEinit+Yq_delta(j);
            Yend = YTABLEend+Yq_delta(j);
        elseif (XTABLEend+Xq_delta(i)) > XTABLEend
            Xinit = XTABLEinit+Xq_delta(i);
            Xend = XTABLEend;
            Yinit = YTABLEinit+Yq_delta(j);
            Yend = YTABLEend+Yq_delta(j);
        elseif (YTABLEinit+Yq_delta(j)) < YTABLEinit  
            Xinit = XTABLEinit+Xq_delta(i);
            Xend = XTABLEend+Xq_delta(i);
            Yinit = YTABLEinit;
            Yend = YTABLEend+Yq_delta(j);
        elseif(YTABLEend+Yq_delta(j)) > YTABLEend
            Xinit = XTABLEinit+Xq_delta(i);
            Xend = XTABLEend+Xq_delta(i);
            Yinit = YTABLEinit+Yq_delta(j);
            Yend = YTABLEend;
        else
            Xinit = XTABLEinit;
            Xend = XTABLEend;
            Yinit = YTABLEinit;
            Yend = YTABLEend;
        end
               
        [Xinterpol,Yinterpol] = meshgrid(Xinit:Xq_step:Xend,Yinit:Yq_step:Yend);
        Transmittance_interpol = interp2(X,Y,Transmittance,Xinterpol,Yinterpol,'spline',0);
        
        
        
        
        
        
        
        
        
        
        name = ['Trabnsmittance_interpolation_Xinit_' num2str(Xinit) '_Xend_' num2str(Xend) '_DeltaX_' num2str(Xq_delta(i)) '_Yinit_' num2str(Yinit) '_Yend_' num2str(Yend) '_DeltaY_' num2str(Yq_delta(j)) '.mat']; 
        save(name,'Xinterpol','Yinterpol','Transmittance','Transmittance_interpol','Xinit','Xend','Yinit','Yend','Xq_delta','Xq_step','Yq_delta','Yq_step','XTABLEinit','XTABLEend','YTABLEinit','YTABLEend')

        clear Xinterpol Yinterpol PHASORinterpol

    end
end

disp('2. Interpolation according to spatial displacement done!')


%% 3. Computing the coeff Alpha
filename_ref = 'FFTAnalysis_SessionAttenuation_SansCrane_1Vpp_200Cycles_6Freq_Sans_2_350kHz.mat';
load(filename_ref,'FFT_vecteur_Burst_Tension_Hydro','FFT_vecteur_Burst_Tension_FunGen')
SamplingFrequency_Ref = 10000000;
T_Ref= [0:(NSamples-1)]/SamplingFrequency_Ref;
UltrasoundBurstFrequency_Ref = 350000;
Index_Freq_Interest_Ref = round(UltrasoundBurstFrequency/SamplingFrequency_Ref*NSamples+NSamples/2+1);
Phasor_Ref = FFT_vecteur_Burst_Tension_Hydro(:,:,Index_Freq_Interest_Ref)./FFT_vecteur_Burst_Tension_FunGen(:,:,Index_Freq_Interest_Ref);
Phasor_Ref = Phasor_Ref([2:end],[1:end-1]);   
Phasor_Ref_r = reshape(Phasor_Ref,[size(Phasor_Ref,1)*size(Phasor_Ref,2),1]);

filename_data_interpolated = 'PHASORinterpolation_Xinit_-39.9_Xend_60_DeltaX_0.1_Yinit_-25_Yend_24.4_DeltaY_-0.6.mat';
load(filename_data_interpolated,'PHASORinterpol')
% PhasorInterp = PHASORinterpol([1:10:end],[1:10:end]); 
PhasorInterp = Transmittance_interpol([2:10:end],[1:10:end]); %Phasor interpolated coming from
% a grid of 2 mm spatial resolution to a 0.1 mm spatial resolution 
% Taking every 10 steps keep values for only the 1 mm grid 
PhasorInterp_r = reshape(PhasorInterp,[size(PhasorInterp,1)*size( PhasorInterp,2),1]);
alpha= (Phasor_Ref_r'*Phasor_Ref_r)./(Phasor_Ref_r'* PhasorInterp_r);


% for l = 1:length(NameFile2)
%     load(NameFile2{l},'PHASORinterpol')
%     
%     PhasorInterp_r = reshape(PhasorInterp,[size(PhasorInterp,1)*size( PhasorInterp,2),1]);
%     alpha(l)= (Phasor_Ref_r'*Phasor_Ref_r)./(Phasor_Ref_r'* PhasorInterp_r);
% end 
%  
% Nécessaire de redimensionner la matrice PHASOR afin d'avoir le même
% espace de comparaison par rapport à PHASORinterpol. Problème : nombre non
% entier...
        
disp('3. Computation of alpha done!')    
%% Plot amplitude and phasis of the PHASOR and the PHASOR interpolated
[X_Ref,Y_Ref] = meshgrid(-39:1:60,-25:1:24);

Phasor_Ref_amp = abs(Phasor_Ref);
Phasor_Ref_phasis = angle(Phasor_Ref);
PHASOR_amp = abs(Transmittance);
PHASOR_phasis = angle(Transmittance);
PhasorInterp_amp = abs(PhasorInterp);
PhasorInterp_phasis = angle(PhasorInterp);

title1 = ['Amplitude for the signal used as a reference' filename_ref];
title2 = ['Phasis for the signal used as a reference' filename_ref];
title3 = ['Amplitude for the signal named' filename_data_interpolated 'interpolated from' filename_FFTsignal_to_extrapolate ];
title4 = ['Phasis for the signal named' filename_data_interpolated 'interpolated from' filename_FFTsignal_to_extrapolate ];
title5 = ['Amplitude for the signal to be interpolated' filename_FFTsignal_to_extrapolate];
title6 = ['Phasis for the signal to be interpolated named' filename_FFTsignal_to_extrapolate ];


figure()
subplot(2,1,1)
surf(X_Ref,Y_Ref,Phasor_Ref_amp)
title(title1)
subplot(2,1,2)
surf(X_Ref,Y_Ref,PhasorInterp_amp)
title(title3)
figure()
subplot(2,1,1)
surf(X_Ref,Y_Ref,Phasor_Ref_phasis)
title(title2)
subplot(2,1,2)
surf(X_Ref,Y_Ref,PhasorInterp_phasis)
title(title4)

figure()
subplot(2,1,1)
surf(X,Y,PHASOR_amp)
title(title5)
subplot(2,1,2)
surf(X_Ref,Y_Ref,PhasorInterp_amp)
title(title3)
figure()
subplot(2,1,1)
surf(X,Y,PHASOR_phasis)
title(title6)
subplot(2,1,2)
surf(X_Ref,Y_Ref,PhasorInterp_phasis)
title(title4)
%%
% angle à ne pas utiliser !!!
