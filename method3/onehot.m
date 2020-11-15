%%%%%对标签归类功能%%%%    one_hot_coder
function [y_onehot] = onehot(y,num_labels)

if ~exist('num_labels', 'var') || isempty(num_labels) 
	num_labels = y;
end

I = eye(max(num_labels));
y_onehot = I(y, :);

end
