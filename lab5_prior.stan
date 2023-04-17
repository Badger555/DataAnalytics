data {
  int N; //number of years
  real miles[N]; //miles flown
}

generated quantities {
  real fatal_sim[N];
  real alpha = normal_rng(3.15, 0.025);
  real beta = normal_rng(0, 0.000015);
  real tmp_AB[N];
  for (n in 1:N){
    tmp_AB[n] = alpha + beta * miles[n];
    fatal_sim[n] = poisson_log_rng(alpha + beta * miles[n]);
  };
}
