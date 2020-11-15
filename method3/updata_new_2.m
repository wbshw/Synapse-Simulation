function [G_plus, G_minus] = updata_new_2(G_plus, G_minus, Xi, delta, min, max)
label_potentiate = find(delta == 1);
label_depress = find(delta == -1);

pexel_adjust = find(Xi ~= 0);
%%
%potentiate
G_plus(label_potentiate, pexel_adjust) = increase(G_plus(label_potentiate, pexel_adjust));
G_minus(label_potentiate, pexel_adjust) = decrease(G_minus(label_potentiate, pexel_adjust));

G_plus_potentiate = G_plus(label_potentiate, pexel_adjust);
G_plus_potentiate(find(G_plus_potentiate >= max)) = max;
G_plus(label_potentiate, pexel_adjust) = G_plus_potentiate;

G_minus_potentiate = G_minus(label_potentiate, pexel_adjust);
G_minus_potentiate(find(G_minus_potentiate <= min)) = min;
G_plus(label_potentiate, pexel_adjust) = G_minus_potentiate;

% indx_potentiate = G_plus(label_potentiate, :) == max;
% G_plus(label_potentiate, indx_potentiate) = min;
% G_minus(label_potentiate, indx_potentiate) = min;


%%
%depress
G_plus(label_depress, pexel_adjust) = decrease(G_plus(label_depress, pexel_adjust));
G_minus(label_depress, pexel_adjust) = increase(G_minus(label_depress, pexel_adjust));

G_plus_depress = G_plus(label_depress, pexel_adjust);
G_plus_depress(find(G_plus_depress <= min)) = min;
G_plus(label_depress, pexel_adjust) = G_plus_depress;

G_minus_depress = G_minus(label_depress, pexel_adjust);
G_minus_depress(find(G_minus_depress >= max)) = max;
G_plus(label_depress, pexel_adjust) = G_minus_depress;

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