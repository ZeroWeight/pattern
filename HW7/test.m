disp('Simple Tree(4)');
disp(mean(CY==simpleTree.predictFcn(CX)));
disp('medium Tree(20)')
disp(mean(CY==mediumTree.predictFcn(CX)));
disp('complex Tree(100)');
disp(mean(CY==complexTree.predictFcn(CX)));
disp('Bagged Tree(30)');
disp(mean(CY==Bag30.predictFcn(CX)));
disp('Bagged Tree(100)');
disp(mean(CY==Bag100.predictFcn(CX)));
disp('Bagged Tree(300)');
disp(mean(CY==Bag300.predictFcn(CX)));