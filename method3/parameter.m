function [AP, AD, BP, BD, min_conductance, max_conductance] = parameter()

% zfilepath = ('C:\Users\我不是后卫\Desktop\matlab\机器学习例子\苏州大学-李敏_3.1.1\parameter\');
zfilepath = ('C:\Users\我不是后卫\Desktop\matlab\机器学习例子\苏州大学-李敏_3.1.1\parameter_normalize\');
% zfilename = ('c 40.mat');
% zfilename = ('c 100.mat');
% zfilename = ('p 40.mat');
zfilename = ('p 100.mat');


load([zfilepath,zfilename]);

min_conductance = c_min;
max_conductance = c_max;
% max_conductance = 1e-07;


end