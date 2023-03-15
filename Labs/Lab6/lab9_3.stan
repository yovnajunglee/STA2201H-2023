data{
  int<lower=0> N;
  int y[N];
  vector[N] log_e;
  vector[N] x;
}

parameters{
  vector[N] alpha;
  real beta;
  real mu;
  real<lower=0> sigma;
}

transformed parameters{
   vector[N] log_theta;
   log_theta = alpha+beta*x;
}

model{
  y ~ poisson_log(log_theta +log_e);
  alpha ~ normal(mu,sigma);
  beta ~ normal(0,1);
  mu ~ normal(0,1);
  sigma ~ normal(0,1);
}