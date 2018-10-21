function [X, y, tick, mbid, mask] = cb_data()
%CBDATA returns Coinbase data

%% Load data
%  The first two columns contains the price and amount and third column
%  contains number of persons.

bids = load('bid.csv');
asks = load('ask.csv');

% combine bids and asks and extract column1 and column2/column3
X = [bids(:,1) bids(:,2) ./ bids(:,3); asks(:,1) asks(:,2) ./ asks(:,3)];

% label bid y=1 and ask y=0
y = [ones(size(bids, 1), 1); zeros(size(asks, 1), 1)];

% 
% prices (spot, bid, ask) amount=1
t = load('tick.csv');
tick = [t(2) 1; t(3) 0];

mbid = size(bids, 1);
mask = size(asks, 1);

end