function [h, max_probability, labels, y_onehot] = fp(theta, X)

m = size(X,1);
num_labels = size(theta, 1);
y_onehot = zeros(m, num_labels);

a1 = [ones(m, 1) X];
z2 = a1 * theta';
h = softmax(z2);

[max_probability, labels] = max(h, [] , 2);
labels = labels - 1;

y_onehot(h == max_probability) = 1;

end