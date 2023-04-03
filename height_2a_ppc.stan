data {
  int<lower=0> N;
  real weight[N];
}

parameters {
  real mu;
  real<lower=0> sigma;
  real alpha;
  real beta;
  real heights[N];

}

model {
    mu ~ normal(175, 10);
    sigma ~ cauchy(0, 10);
    alpha ~ normal(175, 10);

    beta ~ normal(0, 1);
    for (n in 1:N){
        real tmp = alpha + beta * weight[n];
        heights[n] ~ normal(tmp, sigma);
    }
        
}

generated quantities {
  real height_new[N];
  for (i in 1:N) {
    height_new[i] = normal_rng(alpha + beta * weight[i], sigma);
  }
}