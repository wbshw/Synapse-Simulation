function [G_plus, G_minus] = updata(G_plus, G_minus, Xi, delta, min, max)

pexel_adjust = find(Xi ~= 0);

label_potentiate = find(delta == 1);
label_depress = find(delta == -1);

%%
%potentiate
G_plus(label_potentiate, pexel_adjust) = increase(G_plus(label_potentiate, pexel_adjust));
G_minus(label_potentiate, pexel_adjust) = decrease(G_minus(label_potentiate, pexel_adjust));
% indx_potentiate = G_plus(label_potentiate, :) == max;
% G_plus(label_potentiate, indx_potentiate) = min;
% G_minus(label_potentiate, indx_potentiate) = min;


%%
%depress
G_plus(label_depress, pexel_adjust) = decrease(G_plus(label_depress, pexel_adjust));
G_minus(label_depress, pexel_adjust) = increase(G_minus(label_depress, pexel_adjust));
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