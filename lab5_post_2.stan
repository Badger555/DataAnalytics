data {
  int N; //number of years
  real miles[N]; //miles flown
  int fatal[N];
}

parameters {
  real<lower=0> alpha[N];
  real beta;
}

model {
    alpha ~ normal(3.15, 0.025);
    beta ~ normal(0, 0.000015);
    
    for (n in 1:N){
      fatal[n] ~ poisson(exp(alpha[n] + beta * miles[n]));
    }
}

generated quantities {
    real fatal_sim[N]; //fatal accidents
    for (n in 1:N){
      fatal_sim[n] = poisson_log_rng(alpha[n] + beta * miles[n]);
    }
}