% principle component analysis (pca)


% Sample data
data = randn(100, 3); % Example 100 samples with 3 features

% Perform PCA
[coeff, score, latent, ~, explained] = pca(data);

% coeff: Principal component coefficients (eigenvectors)
% score: Principal component scores (transformed data)
% latent: Eigenvalues of the covariance matrix
% explained: Percentage of variance explained by each principal component

close all

figure

% Plot percentage of variance explained
pareto(explained);
xlabel('Principal Component');
ylabel('Variance Explained (%)');

figure

% Plot first two principal components
scatter(score(:,1), score(:,2));
xlabel('PC1');
ylabel('PC2');