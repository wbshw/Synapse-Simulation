function [G] = rand_weight(min, max, r, c)

G = min + (max - min)*rand(r, c);
% G =  max *rand(r, c);
% G = ((max - min)*0.05+min)*rand(r, c);
% G = zeros(r, c);

end