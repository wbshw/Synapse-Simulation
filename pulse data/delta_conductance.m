clc;clear;close all

load('p 100.mat')

figure(1)
x = increase(1:end-1);
a =   1.698e-08      ;
b =      -0.5934 ;
y = x+a*exp(-b*(x-c_min)/(c_max-c_min));
% y = [c_min; y(1:end-1)];
AP = a;
BP = b;
plot(y)
hold on 
plot(increase(2:end),'.')

figure(2)
x = decrease(1:end-1);
a =  1.554e-06    ;
b =       6.647     ;
y = x-a*exp(-b*(c_max-x)/(c_max-c_min));
AD = a;
BD = b;
plot(y)
hold on 
plot(decrease(2:end),'.')

% c_in = [c_min; increase];
% c_de = [c_max; decrease];
% G_in = c_in(1:end-1);
% G_de = c_de(1:end-1);
% Gn_in = c_in(2:end);
% Gn_de = c_de(2:end);

c_in = increase;
c_de = decrease;
G_in = c_in(1:end-1);
G_de = c_de(1:end-1);
Gn_in = c_in(2:end);
Gn_de = c_de(2:end);

