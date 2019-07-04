function [mu, error] =GD_UpdateBSUM( X,k,n,mu0,muOpt,GD_Itr, lambda)
mu = mu0;
lambda0=lambda;
alpha = zeros(n,k);
dist = zeros(k,k);
error = zeros(GD_Itr,1);
templambda = zeros(GD_Itr,1);
for ll = 1:GD_Itr
    

  if (mod(ll,100) == 1)
   lambda = betarnd(0.5,0.5)*lambda0;

   if rand(1)>0.5
       lambda = 0;
   end

  end
  templambda(ll) = lambda;

    

    %%%%%%% Weight updated
        for i = 1:k
         
        temp = X - mu(:,i)*ones(1,n);
        temp = temp.^2;
        temp = -sum(temp,1)/2;
        temp = exp(temp);
        alpha(:,i) = temp';
        end
        alpha = alpha / median(alpha(:))  *1e-30;
    temp = sum(alpha,2);
    alpha = alpha./(temp * ones(1,k));
    
    temp2 = sum(alpha,1);
    temp1 = X*alpha;

    sumMu = sum(mu')'; 
    for j = 1:k
        mu(:,j) = (1/n * temp1(:,j) + k * lambda * mu(:,j) - lambda* sumMu)/(1/n * temp2(j) + k * lambda);
    end
    
    for i=1:k
        for j=1:k
           dist(i,j) = norm(mu(:,i)-muOpt(:,j));
        end
    end
    distmin = min(dist);
    error(ll) = sum(distmin);
    
    
    
end



end

