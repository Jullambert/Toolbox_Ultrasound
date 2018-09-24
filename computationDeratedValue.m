function [DeratedValue] = computationDeratedValue(ValueToBeDerated,Coeff_dB,SkullThickness)

DeratedValue = ValueToBeDerated/(10^((Coeff_dB*SkullThickness)/10));
