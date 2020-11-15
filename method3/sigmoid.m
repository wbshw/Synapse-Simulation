function [g_probability, max_probability, labels, y_onehot] = sigmoid(theta, X)

m = size(X,1);
unm_labels = size(theta, 1);
y_onehot = zeros(m, unm_labels);

X = [ones(m, 1) X];
h = X * theta';
g_probability = 1.0 ./ (1.0 + exp(-h));

[max_probability, labels] = max(g_probability, [] , 2);
labels = labels - 1;

% y_onehot(h_probability == max_probability) = 1;
y_onehot(:, labels + 1) = 1;

end