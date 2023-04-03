data{
    int<lower=1> N;
    real heights[N];
}

parameters{
    real mu;
    real<lower=0> sigma;
}

model{
    mu ~ normal(175,15);
    sigma ~ exponential(0.5);
    heights ~ normal(mu, sigma);
}

generated quantities {
    real height = normal_rng(mu, sigma);
}