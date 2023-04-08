data {
  int N;
  real weight[N];
}

generated quantities {
  real alpha = normal_rng(155,8);
  real<lower=0> beta = lognormal_rng(0,0.4);
  real sigma = exponential_rng(0.50);
  real height[N];
  real tmp[N];
  for (i in 1:N){
    tmp[i] = weight[i]*beta+alpha;
    height[i] = normal_rng((weight[i]*beta)+alpha, sigma);
  }
}