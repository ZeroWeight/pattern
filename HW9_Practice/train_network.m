function [net,e] = train_network(X,Y)
    x = X';
    t = Y';
    % Choose a Training Function
    % For a list of all training functions type: help nntrain
    % 'trainlm' is usually fastest.
    % 'trainbr' takes longer but may be better for challenging problems.
    % 'trainscg' uses less memory. Suitable in low memory situations.
    net = patternnet(80);
    scg = 1;
    if scg == 1
        net.trainFcn = 'trainscg';
        net.performFcn = 'crossentropy';  % Cross-Entropy
        net.trainParam.showWindow = 0;
    else
        net.trainFcn = 'trainbr';
        net.performFcn = 'mse';  % MSE
        net.trainParam.showWindow = 1;
    end
    net.input.processFcns = {'removeconstantrows','mapminmax'};
    net.output.processFcns = {'removeconstantrows','mapminmax'};
    net.divideFcn = 'dividerand';  % Divide data randomly
    net.divideMode = 'sample';  % Divide up every sample
    net.divideParam.trainRatio = 70/100;
    net.divideParam.valRatio = 15/100;
    net.divideParam.testRatio = 15/100;
    [net,tr] = train(net,x,t);
    x_test = x(:,tr.testMask{1}(1,:) == 1);
    t_test = t(:,tr.testMask{1}(1,:) == 1);
    t_out = net(x_test);
    tind = vec2ind(t_out);
    yind = vec2ind(t_test);
    e = sum(tind ~= yind)/numel(tind);
end