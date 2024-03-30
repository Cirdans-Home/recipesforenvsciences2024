%% TEST WITH SOME FACES

clear; clc; close all;

% Read data
p = 100;
data = cell(p,1);
index = 1;
for i=1:5:5*p
    data{index} = imread(sprintf("face.train/train/face/face%05d.pgm",i));
    index = index+1;
end

% Visualize data
figure(1)
for i=1:20
    subplot(4,5,i)
    imshow(data{i});
end

% We can try to use PCA to analyze the data, we need to build the
% data matrix X
n = size(data{1},1);
X = zeros(n^2,p);
for i=1:p
    X(:,i) = data{i}(:);
end

[coeff,score,latent] = pca(double(X));

% Characters
for i=1:20
 figure(2)
 subplot(4,5,i)
 imshow(reshape(int8(score(:,i)),n,n));
end

% There are negative entries!
[W,H,D] = nnmf(double(X),10,"replicates",10);
for i=1:size(W,2)
 figure(3)
 subplot(2,5,i)
 imshow(reshape(int8(W(:,i)),n,n));
end
