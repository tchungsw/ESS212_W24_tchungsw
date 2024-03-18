clear all
close all
%%

y = [3.75 .93 .38 .05 .04 .36 .32 .11 .15 .03 .58 .67 .12 .05 .08 2.06 1.01 .6 .11 .06]' ;
t = [1 2 3 4 5]' ;
A = [[t; t; t; t].^0 [t; t; t; t].^1]
nu = 19;

%%

lm = fitlm(A(:,2), log(y)) ;

%%
figure
hold on
scatter(A(:,2), log(y))
plot(lm)
hold off

%%

b_hat = lm.Coefficients.Estimate(2)
e_hat = lm.Coefficients.Estimate(1)
mu_hat = exp(e_hat)

%%

err_b = lm.Coefficients.SE(2)*sqrt(nu/(nu-2))
err_mu = lm.Coefficients.SE(1)*sqrt(nu/(nu-2))
