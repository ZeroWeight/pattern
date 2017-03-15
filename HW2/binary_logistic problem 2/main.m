clear all; close all; clc;
% %%%%%
load('XTrainWBC.mat');
load('yTrainWBC.mat');
load('XTestWBC.mat');
load('yTestWBC.mat');
%%%%%

% 

[nsamples, nfeatures] = size(XTrain)
w0 = rand(nfeatures + 1, 1);
weight = logisticRegressionWeights( XTrain, yTrain, w0, 1000, 0.1);
res = logisticRegressionClassify( XTest, weight );

errors = abs(yTest - res);
err = sum(errors)
percentage = 1 - err / size(XTest, 1)