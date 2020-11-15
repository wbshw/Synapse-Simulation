function [x] = rotate(x)

[m, n] = size(x);

example_height = round(sqrt(size(x, 2)));
example_width = (n / example_height);

for i = 1:m
    xi = reshape(x(i, :), [example_width, example_height]);
    xi = xi';
    x(i, :) = xi(:);
end
end