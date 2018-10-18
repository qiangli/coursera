function [C, v, accuracy, errors] = cb_params(X, y, Xval, yval)
%CBPARAMS returns your choice of optimal (C) learning parameters to use for SVM
%with RBF kernel. You should complete this function to return the optimal C 
%based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C 
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

v = [0.01:0.005:30](:)
% v = [0.01; 0.03; 0.10; 0.30; 1; 3; 10; 30; 100; 300];

errors = [];
accuracy = [];

for i = 1:size(v)
    % kernel = @(x1, x2) gaussianKernel(x1, x2, v(j));
    kernel = @linearKernel;
    % kernel = @(x1, x2) linearKernel(x1, x2);
    model= svmTrain(X, y, v(i), kernel); 
    predictions = svmPredict(model, Xval);
    errors(i) = mean(double(predictions ~= yval)) * 100.00;
    accuracy(i) = mean(double(predictions == yval)) * 100.00;
    fprintf('Training C: %f accuracy: %f  error: %f\n', v(i), accuracy(i), errors(i));
    if errors(i) == 0.0 
        break;
    end
end

[~, idx] = max(accuracy);
C = v(idx);
v = v(1:length(accuracy));
fprintf('Returning cb_params C: %f accuracy: %f  error: %f\n', C, accuracy(idx), errors(idx));

% =========================================================================

end
