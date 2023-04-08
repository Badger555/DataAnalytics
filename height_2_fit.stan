data {
  int N;
  real weight[N];
}

parameters {
  real alpha;
  real beta;
  real sigma;
  real heights[N];
}

transformed parameters {
  real mu[N];
  for (i in 1:N){
    mu[i] = weight[i]*beta + alpha;
  }
}

model {
  alpha ~ normal(155,8);
  beta ~ lognormal(0,0.4);
  sigma ~ exponential(0.5);
  heights ~ normal(mu, sigma);        
}

generated quantities {
  real height[N];
  real tmp[N];
  for (i in 1:N) {
    tmp[i] = mu[i];
    height[i] = normal_rng(mu[i], sigma);
  }
}