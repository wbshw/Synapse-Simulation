function [G_plus, G_minus] = updata_new(G_plus, G_minus, Xi, delta, min, max)
label_potentiate = find(delta == 1);
label_depress = find(delta == -1);

pexel_adjust = find(Xi ~= 0);
%%
adjust_G_plus = G_plus(label_potentiate, pexel_adjust);
indx_max_G_plus = find(adjust_G_plus >= max);
indx_nonmax_G_plus = find(adjust_G_plus < max);

adjust_G_minus = G_plus(label_depress, pexel_adjust);
indx_max_G_minus = find(adjust_G_minus >= max);
indx_nonmax_G_minus = find(adjust_G_minus <= max);

%%
%potentiate
G_plus(label_potentiate, indx_max_G_plus) = max;
G_minus(label_potentiate, indx_max_G_plus) = decrease(G_minus(label_potentiate, indx_max_G_plus));
G_plus(label_potentiate, indx_nonmax_G_plus) = increase(G_plus(label_potentiate, indx_nonmax_G_plus));
G_minus(label_potentiate, indx_nonmax_G_plus) = decrease(G_minus(label_potentiate, indx_nonmax_G_plus));

% indx_potentiate = G_plus(label_potentiate, :) == max;
% G_plus(label_potentiate, indx_potentiate) = min;
% G_minus(label_potentiate, indx_potentiate) = min;


%%
%depress
G_plus(label_depress, indx_max_G_minus) = decrease(G_plus(label_depress, indx_max_G_minus));
G_minus(label_depress, indx_max_G_minus) = max;
G_plus(label_depress, indx_nonmax_G_minus) = decrease(G_plus(label_depress, indx_nonmax_G_minus));
G_minus(label_depress, indx_nonmax_G_minus) = increase(G_minus(label_depress, indx_nonmax_G_minus));

% indx_depress = G_minus(label_potentiate, :) == max;
% G_plus(label_potentiate, indx_depress) = min;
% G_minus(label_potentiate, indx_depress) = min;


%%
indx_G_plus_max = G_plus == max;
indx_G_minus_max = G_plus == max;
indx_initial = indx_G_plus_max .* indx_G_minus_max;
G_plus(indx_initial == 1) = min;
G_minus(indx_initial == 1) = min;

end