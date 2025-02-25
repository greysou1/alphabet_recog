%% Machine Learning Online Class - Exercise 4 Neural Network Learning

%  Instructions
%  ------------
% 
%  This file contains code that helps you get started on the
%  linear exercise. You will need to complete the following functions 
%  in this exericse:
%
%     sigmoidGradient.m
%     randInitializeWeights.m
%     nnCostFunction.m
%
%  For this exercise, you will not need to change any code in this file,
%  or any other files other than those mentioned above.
%

%% Initialization
clear ; close all; clc

%% Setup the parameters you will use for this exercise
input_layer_size  = 784;  % 28x28 Input Images of Letters
hidden_layer_size = 25;   % 25 hidden units
num_labels = 26;          % 26 balanced labels, from A - Z and a - z   
                          % (note that we have mapped "0" to label 10)

%% =========== Part 1: Loading and Visualizing Data =============
%  We start the exercise by first loading and visualizing the dataset. 
%  You will be working with a dataset that contains handwritten digits.
%

%checking data
disp('Contents of workspace before loading file:')
whos

disp('Contents of emnist-letters.mat:')
whos('-file','emnist-letters.mat')

load('emnist-letters.mat')
disp('Contents of workspace after loading file:')
whos

% Load Training Data
fprintf('Loading and Visualizing Data ...\n')

load emnist-letters.mat;
X = dataset.train.images;
y = dataset.train.labels;

X = double(X);

m = size(X, 1);

% Randomly select 100 data points to display
sel = randperm(size(X, 1));
sel = sel(1:100);

displayData(X(sel, :));

fprintf('Program paused. Press enter to continue.\n');
%pause;


%% ================ Part 2: Loading Parameters ================
% In this part of the exercise, we load some pre-initialized 
% neural network parameters.

%fprintf('\nLoading Saved Neural Network Parameters ...\n')

% Load the weights into variables Theta1 and Theta2
%Theta1 = randInitializeWeights(784, 25);
%Theta2 = randInitializeWeights(25, 26);

% Unroll parameters 
%nn_params = [Theta1(:) ; Theta2(:)];

%% ================ Part 3: Compute Cost (Feedforward) ================
%  To the neural network, you should first start by implementing the
%  feedforward part of the neural network that returns the cost only. You
%  should complete the code in nnCostFunction.m to return cost. After
%  implementing the feedforward to compute the cost, you can verify that
%  your implementation is correct by verifying that you get the same cost
%  as us for the fixed debugging parameters.
%
%  We suggest implementing the feedforward cost *without* regularization
%  first so that it will be easier for you to debug. Later, in part 4, you
%  will get to implement the regularized cost.
%
%fprintf('\nFeedforward Using Neural Network ...\n')

% Weight regularization parameter (we set this to 0 here).
%lambda = 0;

%J = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, ...
                   %num_labels, X, y, lambda);

%fprintf(['Cost at parameters (initialised randomly using randInitialiseWeights function): %f '...
         %'\n(this value should be about 0.287629)\n'], J);

%fprintf('\nProgram paused. Press enter to continue.\n');
%pause;

%% =============== Part 4: Implement Regularization ===============
%  Once your cost function implementation is correct, you should now
%  continue to implement the regularization with the cost.
%

%fprintf('\nChecking Cost Function (w/ Regularization) ... \n')

% Weight regularization parameter (we set this to 1 here).
%lambda = 1;

%J = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, ...
%                   num_labels, X, y, lambda);

%fprintf(['Cost at parameters (loaded from ex4weights): %f '...
         %'\n(this value should be about 0.383770)\n'], J);

%fprintf('Program paused. Press enter to continue.\n');
%pause;


%% ================ Part 5: Sigmoid Gradient  ================
%  Before you start implementing the neural network, you will first
%  implement the gradient for the sigmoid function. You should complete the
%  code in the sigmoidGradient.m file.
%

%fprintf('\nEvaluating sigmoid gradient...\n')

%g = sigmoidGradient([-1 -0.5 0 0.5 1]);
%fprintf('Sigmoid gradient evaluated at [-1 -0.5 0 0.5 1]:\n  ');
%fprintf('%f ', g);
%fprintf('\n\n');

%fprintf('Program paused. Press enter to continue.\n');
%pause;

%% =========== Actutal implementing of Neural Network ============



%% =============== Part 7: Implement Backpropagation ===============
%  Once your cost matches up with ours, you should proceed to implement the
%  backpropagation algorithm for the neural network. You should add to the
%  code you've written in nnCostFunction.m to return the partial
%  derivatives of the parameters.
%
%fprintf('\nChecking Backpropagation... \n');

%  Check gradients by running checkNNGradients
%checkNNGradients;

%fprintf('\nProgram paused. Press enter to continue.\n');
%pause;

%% =============== Part 8: Implement Regularization ===============
%  Once your backpropagation implementation is correct, you should now
%  continue to implement the regularization with the cost and gradient.
%
%
%fprintf('\nChecking Backpropagation (w/ Regularization) ... \n')

%  Check gradients by running checkNNGradients
%lambda = 3;
%checkNNGradients(lambda);

% Also output the costFunction debugging values
%debug_J  = nnCostFunction(nn_params, input_layer_size, ...
                          %hidden_layer_size, num_labels, X, y, lambda);

%ƒfprintf(['\n\nCost at (fixed) debugging parameters (w/ lambda = %f): %f ' ...
         %'\n(for lambda = 3, this value should be about 0.576051)\n\n'], lambda, debug_J);

%fprintf('Program paused. Press enter to continue.\n');
%pause;

%GRADIENT CHECKING IS TURNED OFF

%% ================ Part 6: Initializing Pameters ================
%  In this part of the exercise, you will be starting to implment a two
%  layer neural network that classifies digits. You will start by
%  implementing a function to initialize the weights of the neural network
%  (randInitializeWeights.m)

fprintf('\nInitializing Neural Network Parameters ...\n')

initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

% Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];


%% =================== Part 8: Training NN ===================
%  You have now implemented all the code necessary to train a neural 
%  network. To train your neural network, we will now use "fmincg", which
%  is a function which works similarly to "fminunc". Recall that these
%  advanced optimizers are able to train our cost functions efficiently as
%  long as we provide them with the gradient computations.
%
fprintf('\nTraining Neural Network... \n')

%  After you have completed the assignment, change the MaxIter to a larger
%  value to see how more training helps.
options = optimset('MaxIter', 50);

%  You should also try different values of lambda
lambda = 0;

% Create "short hand" for the cost function to be minimized
costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y, lambda);

% Now, costFunction is a function that takes in only one argument (the
% neural network parameters)
[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

% Obtain Theta1 and Theta2 back from nn_params
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

fprintf('Program paused. Press enter to continue.\n');
pause;


%% ================= Part 9: Visualize Weights =================
%  You can now "visualize" what the neural network is learning by 
%  displaying the hidden units to see what features they are capturing in 
%  the data.

fprintf('\nVisualizing Neural Network... \n')

displayData(Theta1(:, 2:end));

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%% ================= Part 10: Implement Predict =================
%  After training the neural network, we would like to use it to predict
%  the labels. You will now implement the "predict" function to use the
%  neural network to predict the labels of the training set. This lets
%  you compute the training set accuracy.
Z = dataset.test.images;
Z = double(Z);
O = dataset.test.labels;
pred = predict(Theta1, Theta2, Z);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == O)) * 100);
pause;

%  To give you an idea of the network's output, you can also run
%  through the examples one at the a time to see what it is predicting.

%  Randomly permute examples
rp = randperm(m);
alphabet = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"};
for i = 1:m
    % Display 
    fprintf('\nDisplaying Example Image\n');
    displayData(X(rp(i), :));

    pred = predict(Theta1, Theta2, X(rp(i),:));
    fprintf('\nNeural Network Prediction: %d (alphabet %c)\n', pred, alphabet{pred});
    
    % Pause with quit option
    s = input('Paused - press enter to continue, q to exit:','s');
    if s == 'q'
      break
    end
end