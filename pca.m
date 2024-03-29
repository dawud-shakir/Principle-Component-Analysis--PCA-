% from cs429/cs529


% pca 

clc, clearvars, close all

% Load data 

table = readtable("https://raw.githubusercontent.com/dawud-shakir/logistic_regression/main/in/mfcc_13_labels.csv");


X = table2array(table(:,1:13)); % all 900 samples 


size(X) % 900 x 13

% 1. Center columns
X2 = X - mean(X, 1); 


% 2. Build covariance matrix
cov_mat = cov(X2); % 13 x 13

% 3. Eigenvectors and eigenvalues
[eig_vecs, eig_vals] = eig(cov_mat);

% 4. Sort eigenvectors highest to lowest
[~,idx] = sort(diag(eig_vals), 'descend');
eig_vecs_sorted = eig_vecs(:,idx)

% 5. Use the top k eigenvectors
k=3;  % from cumsum >= 0.95
projection_mat = eig_vecs_sorted(:,1:k)

% 6. Project onto centered columns to reduce
X_reduced = X2 * projection_mat;

size(X_reduced) % 900 x 13


disp('original size'), size(X)

disp('reduced size'), size(X_reduced)


hold on;
scatter(X(:,1),X_reduced(:,1))

hold off;

