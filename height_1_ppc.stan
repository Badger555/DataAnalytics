generated quantities {
    real mu = normal_rng(155,8);
    real sigma = exponential_rng(0.15);
    real height = normal_rng(mu, sigma);
}