function [net,e] = train_network(X,Y,TX,TY)
    x = X';
    t = Y';
    trainFcn = 'trainscg';
    hiddenLayerSize = 20;
    net = patternnet(hiddenLayerSize);
    net.trainParam.showWindow = 0;
    net.input.processFcns = {'removeconstantrows','mapminmax'};
    net.output.processFcns = {'removeconstantrows','mapminmax'};
    net.divideFcn = 'dividerand';  % Divide data randomly
    net.divideMode = 'sample';  % Divide up every sample
    net.divideParam.trainRatio = 90/100;
    net.divideParam.valRatio = 10/100;
    net.divideParam.testRatio = 0/100;
    net.performFcn = 'crossentropy';  % Cross-Entropy
    [net,tr] = train(net,x,t);
    TY_prob = net(TX')';
    TY_Pre = zeros(length(TY),2);
    for i = 1:1:length(TY)
        [~,I]=max(TY_prob(i,:));
        TY_Pre(i,I) = 1;
    end
    C = TY_Pre(:,1) == TY(:,1);
    e =mean(C);
end