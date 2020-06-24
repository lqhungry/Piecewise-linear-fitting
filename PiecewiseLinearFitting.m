clc 
clear all
close all
load('1.mat')

x0 = 0.99*xdata(ydata == max(ydata));

model = @(beta,x) beta(1).*x.*(x>0&x<x0)+beta(2).*(133-x).*(x>=x0&x<133);

beta = [3,0.2];

[f,resnorm,residual,exitflag,output,lambda,jacobian] = lsqcurvefit(model,beta,xdata,ydata);

times = linspace(0,135,135);
figure
plot(xdata,ydata,'ko',times,model(f,times),'b-')
legend('Data','Fitted lines')
title('Data and Fitted Curve')
