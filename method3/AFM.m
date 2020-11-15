clear;close all;clc

%%
load('bais.mat')
input_layer_size  = 784;
num_labels = 10;
lamba = 1;
% rng default

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
% figure(1)
% displayData(sel);

% fprintf('Program paused. Press enter to continue.\n');
% pause

%%
G_plus = rand_weight(min_conductance, max_conductance, num_labels, input_layer_size);
G_minus = G_plus;
% G_minus = rand_weight(min_conductance, max_conductance, num_labels, input_layer_size);
G_plus_i = G_plus;
G_minus_i = G_plus;
theta_i = [bais G_plus-G_minus];

% % figure(2)
% subplot(2, 3, [2, 3])
% displayData(G_plus_i(:, 2:end));
% displayData(theta_i(:, 2:end));

%%
for i = 1:m
    iteration = 1;
    Xi = X(i, :);
    %%
    theta = [bais G_plus- G_minus];
%     theta(theta == theta_i) = 0;
%     subplot(2, 3, [5, 6])
    displayData(theta(:, 2:end));

%     if mod(i-1, 100) == 0
%         close
%         displayData(theta(9, 2:end));
%         pause
%     end
    
    %%
    [~, ~, ~, y_pred] = fp(theta, X_test);
    Acc = mean(double(label(y_pred) == label(y_test))) * 100;
    
    %%
    while 1
        %%
        [~, probability, yi, yi_onehot] = fp(theta, Xi);
        fprintf('\nSample: %d Iteration: %d Probability: %f Pred: %d Real: %d Test Set Accuracy: %f\n',...
            i, iteration, probability, yi, label(y(i, :)), Acc);
        %%
        delta1 = y(i, :) - yi_onehot;
        [delta3,delta2] = bp(theta, Xi, y(i, :), yi_onehot);
        
        %%
%         [G_plus_sample, G_minus_sample] = updata_new_5(G_plus_i, G_minus_i, Xi, lamba,...
%                                                 delta1, delta2, min_conductance, max_conductance);
%         w = G_plus_sample(label(y(i, :)) + 1, :) - G_minus_sample(label(y(i, :)) + 1, :);
%         w = (G_plus_sample(label(y(i, :)) + 1, :) - G_minus_sample(label(y(i, :)) + 1, :) )+lamba*delta2(label(y(i, :)) + 1, :);
%         if sum(w) ~= 0
%             subplot(2, 3, 1)
%             displayData(Xi);
%             subplot(2, 3, 4)
%             displayData(w(:, 2:end));

%             %                         pause
%             if i == 16
%                 save('sample_16.mat','Xi');
%                 save('learning_sample_16.mat','w');
%                 pause
%             end

%         end
        
        %%
%         if yi == label(y(i, :)) || iteration >= 50
        if yi == label(y(i, :)) && iteration == 1
            accuracy = [accuracy; Acc];
            break
        elseif yi == label(y(i, :)) && probability >= 0.9
            accuracy = [accuracy; Acc];
            break
        else
            %3 by sample,5 by delta
            if iteration == 1
                delta_sgn = delta2(:,2:end);
            end
            [G_plus, G_minus] = updata_new_5(G_plus, G_minus, Xi, lamba,...
                                        delta1, delta_sgn, min_conductance, max_conductance);

            iteration = iteration + 1;
            theta = [bais G_plus- G_minus];
%             theta = (G_plus- G_minus)+lamba*delta2;
            
            indx_min  = G_plus == G_minus;
            G_plus(indx_min) = min_conductance;
            G_minus(indx_min) = min_conductance;
            

%             indx_initial = abs(theta) == max_conductance - min_conductance;
%             G_plus(indx_initial) = min_conductance;
%             G_minus(indx_initial) = min_conductance;
            
            
            
        end
        %%
        
    end
    
    
end

if i == m
    save('method5 accuracy p 100.mat', 'G_minus', 'G_minus_i', 'G_plus', 'G_plus_i', 'accuracy', 'theta_i','theta');
end