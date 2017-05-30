function [x,fval,exitflag,output,population,score] = generic(nvars)
%% This is an auto generated MATLAB file from Optimization Tool.

%% Start with the default options
options = gaoptimset;
%% Modify options setting
options = gaoptimset(options,'PopulationType', 'bitstring');
options = gaoptimset(options,'FitnessScalingFcn', @fitscalingprop);
options = gaoptimset(options,'SelectionFcn', @selectionroulette);
options = gaoptimset(options,'CrossoverFcn', @crossovertwopoint);
options = gaoptimset(options,'MutationFcn', {  @mutationuniform [] });
options = gaoptimset(options,'Display', 'iter');
options = gaoptimset(options,'Generations', 15);
options = gaoptimset(options,'Vectorized', 'off');
options = gaoptimset(options,'UseParallel', 1 );
[x,fval,exitflag,output,population,score] = ...
ga(@NN_train,nvars,[],[],[],[],[],[],[],[],options);
