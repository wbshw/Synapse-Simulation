%%
%subplot index
% r = 2;
% c = 3;
% a = 1:r*c;
% a = reshape(a, [c, r])'

%%
% mean average
clear;close all;clc;

path = 'C:\Users\我不是后卫\Desktop\matlab\机器学习例子\苏州大学-李敏_3.1.1\结果2';
list = dir(path);

b = [];
for j = 3:length(list)-1
    load(fullfile(path, list(j).name))
    
    a = [];
    for i = 1:length(accuracy)
        m = mean(accuracy(1:i));
        a = [a; m];
    end
    plot(a)
    
    b = [b a];
    hold on
    drawnow
    
end

i = 4;
a1 = b(:, i);
a2 = b(:, i+4);
plot(a1)
hold on
plot(a2)
idx = find(abs(a1 - a2) <= 0.0015);
a = [a2(1:idx); a1(idx+1:end)];
plot(a)

%%
% for i = 1:10
%     a = 0;
%     j = 1;
%     i
%     while 1
%         a
%         if a == i
%             while 1
%                 if j == 5
%                     break
%                 end
%             end
%             break
%         else
%             a = a+1;
%             j = j+1;
%         end
%     end
% end
%%