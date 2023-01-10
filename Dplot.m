clc
clear
close all

D0 = 50E-6;
k1 = 6.869E-8;
k2 = 3.319E-8
k3 = 6.62E-9

fplot(@(t) (D0^2)-k1*t,[0 0.0363],'Linewidth',2);
hold on
fplot(@(t) (D0^2)-k2*t,[0 0.0753],'--or');
fplot(@(t) (D0^2)-k3*t,[0 0.3776],'-.*c');
hold off
legend('X1','X2','X3')
xlabel('Time (s)')
ylabel('Diameter (m)')
title('Transient Diameter vs. Time')