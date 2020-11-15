function [updated_conductance] = decrease(present_conductance)

[~, AD, ~, BD, min_conductance, max_conductance] = parameter();

updated_conductance = present_conductance - ...
    AD* exp(-BD* (max_conductance- present_conductance)/(max_conductance- min_conductance));
end