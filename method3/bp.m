function [delta_delta,delta_sample] = bp(theta, X, y, yi)

X = [1 X];

delta = y - yi;
delta_sample = delta'*X;
delta_delta = delta'.*theta;

idx_in = find(delta > 0);
idx_de = find(delta < 0);

end