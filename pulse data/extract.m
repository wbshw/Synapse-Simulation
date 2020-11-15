clear;close all;clc;
load('LTP STP.mat')

p = 1:200;

increase = abs(cp40);
decrease = abs(cd40);
c_max = max([increase; decrease]);
c_min = min([increase; decrease]);
save('c 40.mat','increase','decrease', 'c_max', 'c_min');
plot(p(61:140),[increase;decrease]);
hold on

increase = abs(cp100);
decrease = abs(cd100);
c_max = max([increase; decrease]);
c_min = min([increase; decrease]);
save('c 100.mat','increase','decrease', 'c_max', 'c_min');
plot(p,[increase;decrease]);
hold on

increase = abs(pp40);
decrease = abs(pd40);
c_max = max([increase; decrease]);
c_min = min([increase; decrease]);
save('p 40.mat','increase','decrease', 'c_max', 'c_min');
plot(p(61:140),[increase;decrease]);
hold on

increase = abs(pp100);
decrease = abs(pd100);
c_max = max([increase; decrease]);
c_min = min([increase; decrease]);
save('p 100.mat','increase','decrease', 'c_max', 'c_min');
plot(p,[increase;decrease]);
hold on
