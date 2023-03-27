generated quantities {
    // Number of trials
    int<lower=1> N = 50;
    // Number of allergic reactions
    int<lower=0, upper=N> y;
    // Probability of allergic reaction
    real<lower=0, upper=1> p;
    
    // Assign a prior for p using a beta distribution
    // 0.2 = alpha/(alpha+beta)
    // b = 4 a
    p = beta_rng(3, 12);
    
    // Sample from binomial distribution using N and p
    y = binomial_rng(N, p);
}
