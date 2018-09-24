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
XTABLEstep = 1; %[mm]
XTABLEend = 60; %[mm]
YTABLEinit = -25; %[mm]
YTABLEstep = 1; %[mm]
YTABLEend = 25; %[mm]
[X,Y] = meshgrid(XTABLEinit:XTABLEstep:XTABLEend,YTABLEinit:YTABLEstep:YTABLEend);
NSamples = 2^14;
SamplingFrequency = 10000000;
T= [0:(NSamples-1)]/SamplingFrequency;
UltrasoundBurstFrequency = 300000;
Index_Freq_Interest = round(UltrasoundBurstFrequency/SamplingFrequency*NSamples+NSamples/2+1);


load('FFTAnalysis_SessionAttenuation_SansCrane_1Vpp_200Cycles_6Freq_Sans_1_300kHz.mat'); % Should be AMplitude and phasis of pressure 


PHASOR = FFT_vecteur_Burst_Tension_Hydro(:,:,Index_Freq_Interest)./FFT_vecteur_Burst_Tension_FunGen(:,:,Index_Freq_Interest);
% Plot the coarse sampling.
% figure
% surf(X,Y,AMP)
% title('Original spatial sampling - Amplitude');
% figure
% surf(X,Y,DEPH)
% title('Original spatial sampling - Dephasage');
% 
% plot(Freq_Axis,squeeze(abs(FFT_vecteur_Burst_Tension_Hydro(x,y,:))))


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
        end
               
        [Xinterpol,Yinterpol] = meshgrid(Xinit:Xq_step:Xend,Yinit:Yq_step:Yend);
        PHASORinterpol = interp2(X,Y,PHASOR,Xinterpol,Yinterpol,'spline',0);
        
        name = ['PHASORinterpolation_Xinit_' num2str(Xinit) '_Xend_' num2str(Xend) '_DeltaX_' num2str(Xq_delta(i)) '_Yinit_' num2str(Yinit) '_Yend_' num2str(Yend) '_DeltaY_' num2str(Yq_delta(j)) '.mat']; 
        save(name,'Xinterpol','Yinterpol','PHASOR','PHASORinterpol','Xinit','Xend','Yinit','Yend','Xq_delta','Xq_step','Yq_delta','Yq_step','XTABLEinit','XTABLEend','YTABLEinit','YTABLEend')

        clear Xinterpol Yinterpol PHASORinterpol

    end
end

disp('2. Interpolation according to spatial displacement done!')
%% 3. Sorting files names
RootDir = uigetdir;
DataFilesName = dir(RootDir);
DataFilesName(1:2) = []; % delete . and .
cd(RootDir)
NameFile = {};

% Loop to get the full name of each file located in the folder selected
% with the pop up window
for k=1:length(DataFilesName)
    filename = fullfile(RootDir,DataFilesName(k).name);
    NameFile{k,1} = filename;
end;

% Loops to store the name of the files according to 
% the order of the delta x
for kk=1:length(DataFilesName)
    st=NameFile{kk};
    idx=strfind(st,'DeltaX_')+7;
    idx2=strfind(st,'_Yinit')-1;
    stval(kk)=str2num(st(idx:idx2));
    [a,b]=sort(stval);
end;

NameFile2=NameFile(b);
disp('3. Sorting the files names done!')

%% 4. Computation of the pressure signal according to the interpolation
for l = 1:length(NameFile2)
    load(NameFile2{l})
    PHASORr = reshape(PHASOR,[size(PHASOR,1)*size(PHASOR,2),1]);
    PHASORinterpolr = reshape(PHASORinterpol,[size(PHASORinterpol,1)*size(PHASORinterpol,2),1]);
    alpha(l)= (PHASORr'*PHASORr)./(PHASORinterpolr'*PHASORinterpolr);
end
% Nécessaire de redimensionner la matrice PHASOR afin d'avoir le même
% espace de comparaison par rapport à PHASORinterpol. Problème : nombre non
% entier...
        
disp('4. Computation of alpha done!')        
 %%
 
%% Plot amplitude and phasis of the PHASOR and the PHASOR interpolated
PHASORamp = abs(PHASOR);
PHASORphasis = angle(PHASOR);
PHASORinterpolamp = abs(PHASORinterpol);
PHASORinterpolphasis = angle(PHASORinterpol);

figure()
subplot(2,1,1)
surf(X,Y,PHASORamp)
subplot(2,1,2)
surf(Xinterpol,Yinterpol,PHASORinterpolamp)
figure()
subplot(2,1,1)
surf(X,Y,PHASORphasis)
subplot(2,1,2)
surf(Xinterpol,Yinterpol,PHASORinterpolphasis)


%%

