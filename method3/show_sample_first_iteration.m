[G_plus_j, G_minus_j] = updata(G_plus_i, G_minus_i, Xi, delta, min_conductance, max_conductance);
w = G_plus_j(label(y(i, :)) + 1, :) - G_minus_j(label(y(i, :)) + 1, :);
if sum(w) ~= 0
    subplot(4, 9, 18)
    displayData(Xi);
    subplot(4, 9, 27)
    displayData(w(:, 2:end));
    pause
end
