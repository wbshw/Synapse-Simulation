function [h] = softmax(z)

Z = exp(z);
Z_sum = sum(Z, 2);
h = Z./Z_sum;

end
