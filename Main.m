clc
clear 
close all
Outer_loop = 250;
stepsize = .1;
lambda = 1e1;
d = [2 4 8] ; % Dimension of data
k = [2 4 8 16]; % Number of mixture components
GD_Itr = 3000;    %%%% Number of EM iteration in each repetition 
GD_Repetetion = 4; %%% Number of experiment repetition
NSample = 80000; % Number of the Samples from Mixture of Gaussian in each iteration
Matrix_Result_EM = zeros(length(d), length(k));
Matrix_Result_SGM = zeros(length(d), length(k));


counter_k = 1;

for ll = k
    ll
    counter_hh = 1;
    for hh = d 
        percentage_EM = 0; % EM total
        percentage_SGM = 0; % SGM total
        NAN_SGM = 0; % SGM total
        
        for Master = 1:Outer_loop

            %%%%%%%%%Gaussian Set - up

            w = 1/ll*ones(1,ll);

            for kk = 1:GD_Repetetion

            %%%% Create Mixtures and data
            muOpt = 5 * randn(hh,ll); %%% Creat  the mixture
            temp_mean = mean(muOpt')';
            muOpt = muOpt - temp_mean;  %%% Shift the mean to origin

            X = SampleGMM(muOpt ,ll, hh, NSample, w );

            %%%%%% Initilization
            mu0 = 9*randn(hh,ll); %%% Random initlization 
            mu = mu0;
            [temp_mu_EM,temp_EMM] = EM( GD_Itr, NSample, ll, hh, w, mu0 , X, muOpt );
            
            if ( (temp_EMM(end)) > .7)

                percentage_EM = percentage_EM + 1;

            end            
                   
            [temp_mu_SGM ,temp_SGMM ] = GD_UpdateBSUM( X,ll,NSample,mu0, muOpt,GD_Itr, 1);
            
            if ( (temp_SGMM(end)) > .7)
                
                percentage_SGM = percentage_SGM + 1;

            end   



            end
            
     
        end
        ipercentage_EM = 100 * percentage_EM / (Outer_loop * GD_Repetetion);
        ipercentage_SGM = 100 * percentage_SGM / (Outer_loop * GD_Repetetion);
         
        
        Matrix_Result_EM(counter_hh, counter_k) = ipercentage_EM; 
        Matrix_Result_SGM(counter_hh, counter_k) = ipercentage_SGM;
        counter_hh = counter_hh + 1;
    end
    counter_k = counter_k + 1;    
        
end


 