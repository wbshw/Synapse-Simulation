% clear;close all;clc;
figure(2)
load('LTP STP.mat')

cp40 = abs(cp40);
cd40 = abs(cd40);
cp100 = abs(cp100);
cd100 = abs(cd100);
pp40 = abs(pp40);
pd40 = abs(pd40);
pp100 = abs(pp100);
pd100 = abs(pd100);

c40 = [cp40; cd40];
c100 = [cp100; cd100];
p40 = [pp40; pd40];
p100 = [pp100; pd100];

c_min = min([c40; c100; p40; p100]);
c_max = max([c40; c100; p40; p100]);

cp40 = (cp40 - c_min)/(c_max - c_min);
cd40 = (cd40 - c_min)/(c_max - c_min);
cp100 = (cp100 - c_min)/(c_max - c_min);
cd100 = (cd100 - c_min)/(c_max - c_min);
pp40 = (pp40 - c_min)/(c_max - c_min);
pd40 = (pd40 - c_min)/(c_max - c_min);
pp100 = (pp100 - c_min)/(c_max - c_min);
pd100 = (pd100 - c_min)/(c_max - c_min);

c40 = [cp40; cd40];
c100 = [cp100; cd100];
p40 = [pp40; pd40];
p100 = [pp100; pd100];

hold on
plot(c40)
plot(c100)
plot(p40)
plot(p100)