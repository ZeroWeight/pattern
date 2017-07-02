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


