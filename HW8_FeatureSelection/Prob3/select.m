function index = select(X,Y,n);
    index =[];
    [M,N]=size(X);
    score = zeros(1,N);
    for i=1:1:N
        if ismember(i,index);
            continue;
        end
        X_11=X(Y(:,1)==1,index);
        X_01=X(Y(:,1)==0,index);
        X_10=X(Y(:,1)==1,i);
        X_00=X(Y(:,1)==0,i);
        X_1=[X_11,X_10];
        X_0=[X_01,X_00];
        X_=[X_1;X_0];
        DX_1=X_1-repmat(mean(X_1),length(X_1(:,1)),1);
        S_1=zeros(N-2,N-2);
        DX_0=X_0-repmat(mean(X_0),length(X_0(:,1)),1);
        S_0=zeros(N-2,N-2);
        for l=1:length(DX_1(:,1))
            S_1=S_1+DX_1(l,:)'*DX_1(l,:);
        end
        for l=1:length(DX_0(:,1))
            S_0=S_0+DX_0(l,:)'*DX_0(l,:);
        end
        S_w=S_1+S_0;
        S_b=length(X_0)*((mean(X_)-mean(X_0))*(mean(X_)-mean(X_0))') .../
        +length(X_1)*((mean(X_)-mean(X_1))*(mean(X_)-mean(X_1))');
        score(i) =trace(S_b)/trace(S_w);
    end
    [sv si]=sort(score,2,'descend');
    index = si(1:n)
end
