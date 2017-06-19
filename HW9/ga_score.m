function err = ga_score(bitmap)
    global X;global Y;
    [sample,feature] = size(X);
    fold = 10;
    batch = floor(sample/fold);
    X_fold = zeros(fold,batch,feature);
    Y_fold = zeros(fold,batch,2);
    train_X = X;
    y2 = Y;
    for i=0:1:fold-1
        Index=randperm(sample-i*batch,batch);
        X_fold(i+1,:,:) = train_X(Index,:);
        Y_fold(i+1,:,1) = y2(Index,1);
        Y_fold(i+1,Y_fold(i+1,:,1)==0,2)=1;
        Check=setdiff(1:sample-i*batch,Index);
        X_temp = train_X(Check,:);
        Y_temp = y2(Check,:);
        train_X = X_temp;
        y2 = Y_temp;
    end
    clear Check train_X y2 i Index M N X_temp Y_temp train_Y y1
e = zeros(1,fold);
    for i = 1:1:fold
        Train_index = setdiff(1:fold,[i]);
        TX = reshape(X_fold(i,:,:),batch,feature);
        TX = TX(:,bitmap == 1);
        GX = reshape(X_fold(Train_index,:,:),batch*(fold-1),feature);
        GX = GX(:,bitmap == 1);
        TY = reshape(Y_fold(i,:,:),batch,2);
        GY = reshape(Y_fold(Train_index,:,:),batch*(fold-1),2);
        [~,e(i)]=train_network(GX,GY,TX,TY);
    end
    err = 1- mean(e);
end

