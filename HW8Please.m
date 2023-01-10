clc
clear

MW1 = 4.003;
MW2 = 32;
MW3 = 16.04;

X1 = 0.333;
X2 = X1;
X3 = X1;

MWmix = X1*MW1 + X2*MW2 + X3*MW3;

D12 = 1.75;
D13 = 1.636;
D21 = D12;
D23 = 0.5488;
D32 = D23;
D31 = D13;

L11 = 0;
L22 = 0;
L33 = 0;
L12 = X2*(MW2*X2 + MW1*X1)/(MW1*D12) + X3*(MW2*X2)/(MW1*D13);
L13 = X2*(MW3*X3)/(MW1*D12) + X3*(MW3*X3 + MW1*X1)/(MW1*D13);
L21 = X1*(MW1*X1 + MW2*X2)/(MW2*D21) + X3*(MW1*X1)/(MW2*D23);
L23 = X1*(MW3*X3)/(MW2*D21) + X3*(MW3*X3 + MW2*X2)/(MW2*D23);
L31 = X1*(MW1*X1 + MW3*X3)/(MW3*D31) + X2*(MW1*X1)/(MW3*D32);
L32 = X1*(MW2*X2)/(MW3*D31) + X2*(MW2*X2 + MW3*X3)/(MW3*D32);




[L] = [L11 L12 L13; L21 L22 L23; L31 L32 L33];
[F] = [L]^-1

Diff12 = X1*(MWmix/MW2)*(F(1,2)-F(1,1));
Diff13 = X1*(MWmix/MW3)*(F(1,3)-F(1,1));
Diff21 = X2*(MWmix/MW1)*(F(2,1)-F(2,2));
Diff23 = X2*(MWmix/MW3)*(F(2,3)-F(2,2));
Diff31 = X3*(MWmix/MW1)*(F(3,1)-F(3,3));
Diff32 = X3*(MWmix/MW2)*(F(3,2)-F(3,3));

[DiffCo] = [0 Diff12 Diff13; Diff21 0 Diff23; Diff31 Diff32 0]