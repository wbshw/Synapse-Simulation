function [G_plus, G_minus] = updata_new_4(G_plus, G_minus, delta_normal, delta_range, c_min, c_max)

theta = G_plus - G_minus;


% P = (delta_normal ~= 0).*(theta <= delta_range);
[Pr, Pc] = find(delta_normal ~= 0);
%%
%potentiate
G_plus(Pr, Pc) = increase(G_plus(Pr, Pc));
G_minus(Pr, Pc) = decrease(G_minus(Pr, Pc));


% D = (delta_normal == 0).*(theta >= delta_range);
[Dr, Dc] = find(delta_normal == 0);
%%
%depress
G_plus(Dr, Dc) = decrease(G_plus(Dr, Dc));
G_minus(Dr, Dc) = increase(G_minus(Dr, Dc));



%%
G_plus(G_plus >= c_max) = c_max;
G_plus(G_plus <= c_min) = c_min;
G_minus(G_minus >= c_max) = c_max;
G_minus(G_minus <= c_min) = c_min;

end