function y = SampleGMM(mu,k, d, n, w )
    
    y = zeros(d,n);
    r = mnrnd(n,w);
    temp0 = 0; 
    temp2 = r(1);
     for ii = 1:k-1
    y (:,(1+temp0):temp2) = mvnrnd(mu(:,ii),eye(d),r(ii))';  
%     y (:,1+r(1): r(1) + r(2)) = mvnrnd(mu2,sigma2,r(2))';  
%     y (:,1+r(1) + r(2):n) = mvnrnd(mu3,sigma3,r(3))'; 
     
     temp0 = temp2;
     temp2 = temp2 + r(ii+1) ;
     end
     y (:,1+temp0:n) = mvnrnd(mu(:,k),eye(d),r(k))'; 
    idx = randperm(n);
    y(:,idx) = y;
end



%  y (:,1:r(1)) = mvnrnd(mu1,sigma1,r(1))';  
%     y (:,1+r(1): r(1) + r(2)) = mvnrnd(mu2,sigma2,r(2))';  
%     y (:,1+r(1) + r(2):n) = mvnrnd(mu3,sigma3,r(3))'; 