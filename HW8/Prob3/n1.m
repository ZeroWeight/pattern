x = X';
t = Y';
trainFcn = 'trainscg';
hiddenLayerSize = 10;
net = patternnet(hiddenLayerSize);
net.input.processFcns = {'removeconstantrows','mapminmax'};
net.output.processFcns = {'removeconstantrows','mapminmax'};
net.divideFcn = 'dividerand';  % Divide data randomly
net.divideMode = 'sample';  % Divide up every sample
net.divideParam.trainRatio = 85/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 0/100;
net.performFcn = 'crossentropy';  % Cross-Entropy
% Train the Network
[net,tr] = train(net,x,t);
TY_ = net(TX);
