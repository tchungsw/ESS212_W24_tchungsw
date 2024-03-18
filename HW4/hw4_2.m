clear all
close all 

%%
x = [0 1 2 3 4]' ;
y = [0.0434 1.0343 -0.2588 3.68622 4.3188]' ;
x_sub = [0 1] ;
y_sub = [0.0434 1.0343] ;
err_sub = [0.1 0.1] ;
nu = 3; 

%%

lm = fitlm(x, y) ;

%%

m = lm.Coefficients.Estimate(2)
b = lm.Coefficients.Estimate(1)

err_m = lm.Coefficients.SE(2)*sqrt(nu/(nu-2));
err_b = lm.Coefficients.SE(1)*sqrt(nu/(nu-2));

%%

model = m.*x + b;

n=2000;

m_err = m - err_m + 2*err_m*rand(n,1);
b_err = b - err_b + 2*err_b*rand(n,1);

for i=1:n
    
    model_err = m_err(i).*x + b_err(i);
    errors(i,:) = model_err;
            if or(model(1)<(model_err(1)-.1),or(model(1)>(model_err(1)+.1),or(model(2)<(model_err(2)-.1),model(2)>(model_err(2)+.1))))
                model_err = NaN;
            end

    plot(x, model_err, 'Color', 'k')
    
    hold on
end

plot(x, y, '-o', 'linewidth', 2, 'color', 'b')
plot(x, model, 'linewidth', 2, 'color', 'r')
ylim([-.5 5])
hold off 

%%

error_x2=std(errors(:,2)-model(2));
error_x3=std(errors(:,3)-model(3));
error_x4=std(errors(:,4)-model(4));

