function [y_label] = label(y)

[~,y_label] = max(y,[],2);
y_label = y_label -1 ;

end