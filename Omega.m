clc
clear

epsilon1 = 106.7
epsilon2 = 148.6

A = 1.06036;
B = 0.193;
C = 1.03587;
D = 1.76474;

FinalEp = (epsilon1*epsilon2)^0.5
Tstar = 500/FinalEp;

OmegaD = (A/(Tstar)^0.1561) + B/(exp(0.47635*Tstar)) + C/(exp(1.52996*Tstar)) + D/exp(3.89411*Tstar)
