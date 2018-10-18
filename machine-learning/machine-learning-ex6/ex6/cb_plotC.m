function cb_plotC(C, v, accuracy, errors)

% plot accuracy vs C parameters

% figure;
plot(v, accuracy, '-bd', 'markerfacecolor', 'red', 'MarkerSize', 10);
ylabel('Training Accuracy');
xlabel('C Parameter');

end