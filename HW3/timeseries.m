%%
warning off
clear, close all, clc

outfilename = websave("monthly_in_situ_co2_mlo.csv","https://scrippsco2.ucsd.edu/assets/data/atmospheric/stations/in_situ_co2/monthly/monthly_in_situ_co2_mlo.csv");

a = readtable(outfilename);
b = a(3:end,:);
c = b{3:end,5};
co2_conc = c(c > 0); 
d = b{3:end,3};
days = d(c > 0);

%% trend line

days_adjusted=days-mean(days);

b1 = days_adjusted\co2_conc;

X = [ones(length(days_adjusted),1) days_adjusted];
b = X\co2_conc;

fitline=b(1)+b(2)*days_adjusted;

residuals=co2_conc - fitline;%sum((anomaly - fitline).^2);

Rsq = 1 - sum((co2_conc - fitline).^2)/sum((co2_conc - mean(co2_conc)).^2);

%%

figure
plot(days_adjusted, co2_conc,'LineWidth',3,'DisplayName','Data')
hold on
plot(days_adjusted, fitline, 'LineWidth',3,'DisplayName','Model')
set(gca,'FontSize',14)
xlabel('Days'), ylabel("CO2 Concentration (ppm)")
legend('Location','southeast')
axis tight


disp(strcat("mu = ", num2str(b(1))))
disp(strcat("m = ", num2str(b(2))))
disp(strcat("R^2 = ", num2str(Rsq)))
disp(strcat("Standard deviation of residuals = ", num2str(std(residuals))))



