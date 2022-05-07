clear;close;clc
load('Data.mat');
Data.X1Kernel_area = str2double(Data.X1Kernel_area);
Data.X1Kernel_area=(Data.X1Kernel_area-mean(Data.X1Kernel_area))/(max(Data.X1Kernel_area)-min(Data.X1Kernel_area));
Data.X2Kernel_length=(Data.X2Kernel_length-mean(Data.X2Kernel_length))/(max(Data.X2Kernel_length)-min(Data.X2Kernel_length));

area = table2array([Data(:,1)]);
length = table2array([Data(:,2)]);
X = table2array([Data(:,[1,2])]);
y = table2array([Data(:,3)]);

g = {Data.WheatVarieties};
gscatter(area,length,g);
hold on;

Kama = (y == 'Kama');
Rosa = (y == 'Rosa');
Canadian = (y == 'Canadian');

[m,n] = size(X);
X = [ones(m,1) X];

initialW = zeros(n + 1, 1);

[Jval, gradient] = costfunction(initialW, X, Kama);

options = optimset('GradObj', 'on', 'MaxIter', 100);

[optW, functionVal, exitFlag] = fminunc(@(w)(costfunction(w, X, Kama)), initialW, options);

plotDecisionBoundary(optW, X, y);
hold on;

[Jval2, gradient2] = costfunction(initialW, X, Rosa);

[optW2, functionVal2, exitFlag2] = fminunc(@(w)(costfunction(w, X, Rosa)), initialW, options);

plotDecisionBoundary(optW2, X, y);
hold on;

[Jval3, gradient3] = costfunction(initialW, X, Canadian);

[optW3, functionVal3, exitFlag3] = fminunc(@(w)(costfunction(w, X, Canadian)), initialW, options);

plotDecisionBoundary(optW3, X, y);
hold on;
legend('Canadian', 'Kama', 'Rosa', 'Kama', 'Rosa', 'Canadian');