
# Stochastic multi-objective EM
Implementation code for the proposed Stochastic multi-objective EM, published in the processing of the 2018 IEEE Global Conference on Signal and Information Processing (GlobalSIP). [Link to Paper](https://arxiv.org/pdf/1809.08705.pdf)
# Abstract 
Finite  mixture  models  are  among  the  most  popular  statistical  models  used  in  different  data  science
disciplines. Despite  their  broad  applicability,  inference  under  these models typically leads to computationally 
challenging non-convex problems.
While the Expectation-Maximization(EM) algorithm  is  the  most  popular  approach  for  solving  these non-convex 
problems, the behavior of this algorithm is not well understood. 
In  this  work,  we  focus  on  the  case  of mixture  of  Laplacian  (or  Gaussian)  distribution.  
We  start by  analyzing  a  simple  equally  weighted  mixture  of  two single  dimensional  Laplacian  distributions
and  show  that every local optimum of the population maximum likelihood estimation problem is globally optimal. 
Then, we prove that the EM algorithm converges to the ground truth parameters almost surely with random initialization. 
Our result extends the  existing  results  for  Gaussian  distribution  to  Laplacian distribution.  
Then  we  numerically  study  the  behavior  of mixture models with more than two components.
Motivatedby our extensive numerical experiments, we propose a novel stochastic method for estimating the mean of 
components of a mixture model. Our numerical experiments show that our algorithm outperforms 
the Naïve EM algorithm in almost all scenarios.

# Summary of the proposed algorithm
The idea behind the proposed algorithm is that each sampled value of penalty value leads to different set of spurious local optima. However, if a point̂ is a fixed point of EM algorithm for any value of pentlay term,it must be a stationary point of the Maximum Likelihood Estimation (MLE) function and also it should satisfy the first moment condition.
<p align="center">
  <img width="380" height="250" src="https://github.com/babakbarazandeh/Stochastic-multi-objective-EM/blob/master/Algorithm.jpg">
</p>
 
# Reuslts 
Following figure shows the performance of the proposed algorithm for different data dimension (d) and number of components (K). The  proposed method significantly improves the percentage of times that a random initialization converges to the ground truth parameter.

<p align="center">
  <img width="300" height="110" src="https://github.com/babakbarazandeh/Stochastic-multi-objective-EM/blob/master/Result.jpg">
</p> <br/>

# Getting started
After installing Tensorflow, run Main.py

# Citation 
@article{barazandeh2019training,<br/>
  title={Training generative networks using random discriminators},<br/>
  author={Barazandeh, Babak and Razaviyayn, Meisam and Sanjabi, Maziar},<br/>
  journal={arXiv preprint arXiv:1904.09775},<br/>
  year={2019}
}
