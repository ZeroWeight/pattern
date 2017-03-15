

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%     logisticRegressionWeights.m
%     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [w] = logisticRegressionWeights( XTrain, yTrain, w0, maxIter, learningRate)

    [nSamples, nFeature] = size(XTrain);
    w = w0;
    precost = 0;
    for j = 1:maxIter
        temp = zeros(nFeature + 1,1);
        for k = 1:nSamples
            temp = temp + (sigmoid([1.0 XTrain(k,:)] * w) - yTrain(k)) * [1.0 XTrain(k,:)]';
        end
        w = w - learningRate * temp;
        cost = CostFunc(XTrain, yTrain, w);
        if j~=0 && abs(cost - precost) / cost <= 0.0001
            break;
        end
        precost = cost;
    end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%     logisticRegressionClassify.m
%     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ res ] = logisticRegressionClassify( XTest, w )

    nTest = size(XTest,1);
    res = zeros(nTest,1);
    for i = 1:nTest
        sigm = sigmoid([1.0 XTest(i,:)] * w);
        if sigm >= 0.5
            res(i) = 1;
        else
            res(i) = 0;
        end
    end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%     sigmoid.m
%     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ output ] = sigmoid( input )

    %output = tanh(input);
    output = 1 / (1 + exp(- input));

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%     CostFunc.m
%     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ J ] = CostFunc( XTrain, yTrain, w )

    [nSamples, nFeature] = size(XTrain);
    temp = 0.0;
    for m = 1:nSamples
        hx = sigmoid([1.0 XTrain(m,:)] * w);
        if yTrain(m) == 1
            temp = temp + log(hx);
        else
            temp = temp + log(1 - hx);
        end
    end
    J = temp / (-nSamples);

end


