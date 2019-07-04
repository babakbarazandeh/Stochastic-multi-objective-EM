function  [mu,error] = EM( MaxIter, n, k, d, w, mu, X, muOpt )

alpha = zeros(n,k);
dist = zeros(k,k);
error = zeros([1, MaxIter]);
for iter = 1:MaxIter
    for i=1:k
        temp = X - mu(:,i)*ones(1,n);
        temp = temp.^2;
        temp = -sum(temp,1)/2;
        temp = exp(temp);
        alpha(:,i) = temp' * w(i);
    end
    alpha = alpha / median(alpha(:))  *1e-30;
    temp = sum(alpha,2);
    alpha = alpha./(temp * ones(1,k));

   for i =1:k
        mu(:,i) = (X * alpha(:,i))/(sum(alpha(:,i)));
   end

   
   
 
    for i=1:k
        for j=1:k
           dist(i,j) = norm(mu(:,i)-muOpt(:,j));
        end
    end
    distmin = min(dist);
    error(iter) = sum(distmin);

end

end

