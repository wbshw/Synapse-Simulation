function [updated_conductance] = increase(present_conductance)

[AP, ~, BP, ~, min_conductance, max_conductance] = parameter();

updated_conductance = present_conductance + ...
    AP* exp(-BP* (present_conductance- min_conductance)/(max_conductance- min_conductance));
end