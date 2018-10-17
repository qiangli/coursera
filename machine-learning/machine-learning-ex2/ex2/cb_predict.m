%% Coinbase -  Logistic Regression
%
%% Initialization
clear ; close all; clc

%% Load Data
%  The first two columns contains the price and amount and third column
%  contains number of persons.

bids = load('bid.csv');
asks = load('ask.csv');

% combine bids and asks and extract column1 and column2/column3
X = [bids(:,1) bids(:,2) ./ bids(:,3); asks(:,1) asks(:,2) ./ asks(:,3)];

% label bid y=1 and ask y=0
y = [ones(size(bids, 1), 1); zeros(size(asks, 1), 1)];

theta = csvread('theta.csv')

% 
[X mu sigma] = cb_normalize(X);

%  Setup the data matrix appropriately, and add ones for the intercept term
[m, n] = size(X);

% Add intercept term to x and X_test
X = [ones(m, 1) X];

% prob = sigmoid([1 45 85] * theta);

% prob = sigmoid(X * theta);

% fprintf(['For new X, we predict bid/ask ' ...
%          'probability of %f\n'], prob);


% p = predict(theta, X)

% Accuracy = (true positives + true negatives) / (total examples)
% Precision = (true positives) / (true positives + false positives)
% Recall = (true positives) / (true positives + false negatives)
% F1 score = (2 * precision * recall) / (precision + recall)

p = predict(theta, X);

tp = sum((p == 1) & (y == 1))
fp = sum((p == 1) & (y == 0))
fn = sum((p == 0) & (y == 1))
tn = sum((p == 0) & (y == 0))

accuracy = (tp + tn) / m
precision = tp / (tp + fp)
recall = tp / (tp + fn)

F1 = (2 * precision * recall) / (precision + recall)

% fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);
% fprintf('Expected accuracy (approx): 89.0\n');
fprintf('\n');