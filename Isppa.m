function [Isppa] = Isppa(Pressure,Density,soundVelocity)

% Isppa in [W/m^2]
% Pressure in [Pa]
% Density in [kg/m^3]
% soundVelocity in m/s

Isppa = (Pressure^2)/(2*Density*soundVelocity);


end
