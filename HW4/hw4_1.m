clear all
close all
%%

y = [-2.73 -2.71 -2.65 -.87 -3.1 -1.03 .63 1.46 5.9 8.38]' ;
t = [1 2 3 4 5 6 7 8 9 10]' ;
t2 = [1 2 3 4 5 6 7 8 9 10 11 12]' ;
nu = 7;

%%

p = [t.^1 t.^2] ;
lm = fitlm(p, y) ;

%%
a_hat = lm.Coefficients.Estimate(3)
b_hat = lm.Coefficients.Estimate(2)
c_hat = lm.Coefficients.Estimate(1)

err_a = lm.Coefficients.SE(3)*sqrt(nu/(nu-2))
err_b = lm.Coefficients.SE(2)*sqrt(nu/(nu-2))
err_c = lm.Coefficients.SE(1)*sqrt(nu/(nu-2))

model =  a_hat.*t2.^2 + b_hat.*t2 + c_hat;

%%

y_12 = a_hat*12^2 + b_hat*12 + c_hat

%%

n=100;

a_err = (a_hat+randn(n,1)*err_a);
b_err = (b_hat+randn(n,1)*err_b);
c_err = (c_hat+randn(n,1)*err_c);

y_12_mat = [];

for n = 1:100
    model_err = a_err(n).*t2.^2 + b_err(n).*t2 + c_err(n);
    plot(model_err)
    y_12_mat = [y_12_mat model_err(12)];
    hold on
end
%hold off
%%
err_y_12 = std(y_12_mat)
%%

% figure
% hold on
scatter(t, y, 'filled')
scatter(12, y_12, 'filled')
plot(model, color = 'b', LineWidth = 4)
hold off

