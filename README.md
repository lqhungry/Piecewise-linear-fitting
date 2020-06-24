# Piecewise-linear-fitting
This method can be used in both linear regrassion and nonlinear regression.
The dimension of beta depends on the number of coefficient you are seeking.
线性非线性皆适用
本例中要根据数据拟合两段直线，已知两段直线在x轴截距分别为(0，0)和(133，0)，断点在0.95max{ydata}处。本文亮点在于利用逻辑语句进行分段函数定义的方法。网上有许多方法都不如此法简洁明了。
参考网站：https://www.mathworks.com/help/optim/ug/lsqcurvefit.html#buuhcjo-fun
https://www.mathworks.com/matlabcentral/fileexchange/40913-piecewise-linear-least-square-fit?s_tid=mwa_osa_a
https://www.jianshu.com/p/fb95fe87a1b2
https://www.mathworks.com/matlabcentral/answers/344059-piece-wise-linear-fitting
https://www.mathworks.com/matlabcentral/answers/475306-how-to-perform-piece-wise-linear-regression-to-determine-break-point
https://www.youtube.com/watch?v=D00pdffK5nI&list=PLXSInGxMChK1s2UETkt3_6iHHPm2RWVWI&index=9

代码：
clc 
clear all
close all
load('1.mat')
%x0为断点
x0 = 0.95*xdata(ydata == max(ydata));
%定义分段函数，采用匿名函数语法
model = @(beta,x) beta(1).*x.*(x>0&x<x0)+beta(2).*(133-x).*(x>=x0&x<133);
%定义beta的初始值
beta = [3,0.2];
%拟合
[f,resnorm,residual,exitflag,output,lambda,jacobian] = lsqcurvefit(model,beta,xdata,ydata);
%画图
times = linspace(0,135);
figure
plot(xdata,ydata,'ko',times,model(f,times),'b-')
legend('Data','Fitted lines')
title('Data and Fitted Curve')
