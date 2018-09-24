function [Phase_Shift] = phaseshiftcomputation(Transducer_Diameter,SpatialResolution,Focal_Distance,Sound_Velocity,Acoustic_Frequency)
% Function computing the phase shift to add to signals while using kwave 
% for the simulation of a focal transducer
% Transducer_Diameter = 0.033 [m] % 1 millimiter more in order to have an odd number of sources...
% Sound_Velocity = 1515 [m/s]
% Focal_Distance = 0.025 [m]
% SPatialResolution = 1e-3 [m]    	grid point spacing in the transducer direction [m]
%%
Number_Sources = Transducer_Diameter/SpatialResolution; % number of grid points
for i = 1:floor(Number_Sources/2)
   Delta_Distance(floor(Number_Sources/2)+1-i,1) = sqrt((i*1e-3)^2+(Focal_Distance)^2)-Focal_Distance;
end
if mod(Number_Sources,2)
    Delta_Distance(end+1)= 0;
    for j = 1:floor(Number_Sources/2)
   Delta_Distance(floor(Number_Sources/2)+1+j,1) = Delta_Distance(floor(Number_Sources/2)+1-j,1);
    end
else
    for j = 1:floor(Number_Sources/2)
   Delta_Distance(floor(Number_Sources/2)+j,1) = Delta_Distance(floor(Number_Sources/2)+1-j,1);
    end
end

%%
Delta_Time = (Delta_Distance*1e3)./Sound_Velocity;
%%
Phase_Shift = (2*pi*Acoustic_Frequency).*Delta_Time;
