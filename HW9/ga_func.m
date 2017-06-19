function [x,fval,exitflag,output,population,score] = ga_func(nvars)
    options = gaoptimset;
    options = gaoptimset(options,'PopulationType', 'bitstring');
    options = gaoptimset(options,'MutationFcn', {  @mutationuniform [] });
    options = gaoptimset(options,'Display', 'iter');
    [x,fval,exitflag,output,population,score] = ...
    ga(@ga_score,nvars,[],[],[],[],[],[],[],[],options);
end
