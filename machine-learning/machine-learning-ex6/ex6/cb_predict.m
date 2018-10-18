%% Coinbase - Support Vector Machines
%
%% Initialization
clear ; close all; clc

%% =============== Loading and Visualizing Data ================

fprintf('Loading and Visualizing Data ...\n')

[X, y, tick] = cb_data()

% Plot training data
plotData(X, y);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ==================== Prediction ====================
[m, n] = size(X);

X = cb_normalize(X)

% Load the model
% You will have model in your environment
load("cb_model.mat");

visualizeBoundaryLinear(X, y, model);

p = svmPredict(model, X);

tp = sum((p == 1) & (y == 1))
fp = sum((p == 1) & (y == 0))
fn = sum((p == 0) & (y == 1))
tn = sum((p == 0) & (y == 0))

accuracy = (tp + tn) / m
precision = tp / (tp + fp)
recall = tp / (tp + fn)

F1 = (2 * precision * recall) / (precision + recall)

fprintf('Prediction Accuracy: %f\n', mean(double(p == y)) * 100);

fprintf('Program paused. Press enter to continue.\n');
pause;
% 