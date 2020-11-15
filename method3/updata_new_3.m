function [G_plus, G_minus] = updata_new_3(G_plus, G_minus, Xi, lamba, delta1, delta2, c_min, c_max)
label_potentiate = delta1 == 1;
label_depress = delta1 == -1;

% Xi = [1 Xi];
pexel_adjust = Xi > 0;
pexel_adjust_0 = Xi <= 0;

rng default
% Xi(pexel_adjust_0) = rand;
%%
%potentiate
G_plus(label_potentiate, pexel_adjust) = increase(G_plus(label_potentiate, pexel_adjust));
G_minus(label_potentiate, pexel_adjust) = decrease(G_minus(label_potentiate, pexel_adjust));

G_plus(label_potentiate, pexel_adjust_0) = decrease(G_plus(label_potentiate, pexel_adjust_0));
G_minus(label_potentiate, pexel_adjust_0) = increase(G_minus(label_potentiate, pexel_adjust_0));

% G_plus(label_potentiate, :) = G_plus(label_potentiate, :).*Xi;
% G_minus(label_potentiate, :) = G_minus(label_potentiate, :).*Xi;

% G_plus(label_depress, :) = decrease(G_plus(label_depress, :));
% G_minus(label_potentiate, :) = increase(G_minus(label_potentiate, :));

% indx_potentiate = G_plus(label_potentiate, :) == max;
% G_plus(label_potentiate, indx_potentiate) = min;
% G_minus(label_potentiate, indx_potentiate) = min;


%%
%depress
% G_plus(label_depress, pexel_adjust) = decrease(G_plus(label_depress, pexel_adjust));
% G_minus(label_depress, pexel_adjust) = increase(G_minus(label_depress, pexel_adjust));

% G_plus(label_depress, pexel_adjust_0) = increase(G_plus(label_depress, pexel_adjust_0));
% G_minus(label_depress, pexel_adjust_0) = decrease(G_minus(label_depress, pexel_adjust_0));
% 
% G_plus(label_depress, :) = G_plus(label_depress, :).*Xi;
% G_minus(label_depress, :) = G_minus(label_depress, :).*Xi;

G_plus(label_depress, :) = decrease(G_plus(label_depress, :));
G_minus(label_depress, :) = increase(G_minus(label_depress, :));

%%
% G_plus = G_plus-lamba*delta2/2;
% G_minus = G_minus-lamba*delta2/2;

%%
G_plus(G_plus >= c_max) = c_max;
G_plus(G_plus <= c_min) = c_min;
G_minus(G_minus >= c_max) = c_max;
G_minus(G_minus <= c_min) = c_min;

%%
% indx = G_plus == c_max;
% G_plus(indx) = c_min;
% G_minus(indx) = c_min;
% 
% indx = G_minus == c_max;
% G_plus(indx) = c_min;
% G_minus(indx) = c_min;

%%

end