clear;close all;clc

pulse = 36 ;
i = 549 ;

%%
input_layer_size  = 784;
num_labels = 10;

accuracy = [];

[~, ~, ~, ~, min_conductance, max_conductance] = parameter();

%%
fprintf('Loading Data ...\n')

load('mnist_test.mat')
X_test = X;
y_test = y;

load('mnist_train.mat')

m = size(X, 1);

rand_indices = randperm(m);
sel = X(rand_indices(1:100), :);
figure(1)
displayData(sel);

% fprintf('Program paused. Press enter to continue.\n');
% pause

%%
G_plus = rand_weight(min_conductance, max_conductance, num_labels, input_layer_size + 1);
G_minus = rand_weight(min_conductance, max_conductance, num_labels, input_layer_size + 1);
% G_minus = G_plus;
G_plus_i = G_plus;
G_minus_i = G_plus;

%%
Xi = X(i, :);
w = G_plus- G_minus;
theta_i = w(label(y(i, :)) + 1, :);

%%
% yk = label(y)== 6 ;
% Xi = sum(X(yk,:));
Xi = (Xi-min(min(Xi)))/(max(max(Xi))-min(min(Xi)));
iteration = 1;
while 1
    %%
    fprintf('\nSample: %d  Iteration: %d\n', i, iteration);
    %%
    delta = y(i, :);
    %%
    [G_plus, G_minus] = updata_new_3(G_plus, G_minus, Xi, delta, min_conductance, max_conductance);
    iteration = iteration + 1;
    w = G_plus(label(y(i, :)) + 1, :) - G_minus(label(y(i, :)) + 1, :);
    indx_initial = abs(w) == max_conductance - min_conductance;
    G_plus(label(y(i, :)) + 1, indx_initial) = min_conductance;
    G_minus(label(y(i, :)) + 1, indx_initial) = min_conductance;

    subplot(2, 3, 1)
    displayData2(Xi);
    subplot(2, 3, 2)
    displayData2(G_plus(label(y(i, :)) + 1, 2:end));
    subplot(2, 3, 5)
    displayData2(G_minus(label(y(i, :)) + 1, 2:end));
    subplot(2, 3, 3)
    displayData2(theta_i(:, 2:end));
    subplot(2, 3, 6)
    displayData2(w(:, 2:end));

%         pause

    if iteration == pulse 
        save('theta_i.mat','theta_i');
        save('w.mat', 'w');
        break
    end
    

end


