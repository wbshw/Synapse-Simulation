function [theta] = calculate_weight(G_plus, G_minus)

theta = G_plus - G_minus;

r = size(theta, 1);

theta = [ones(r, 1) theta];

end