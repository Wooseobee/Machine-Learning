clear;close;clc
load('Data.mat');
Data.X1Kernel_area = str2double(Data.X1Kernel_area);
Data.X1Kernel_area=(Data.X1Kernel_area-mean(Data.X1Kernel_area))/(max(Data.X1Kernel_area)-min(Data.X1Kernel_area));
Data.X2Kernel_length=(Data.X2Kernel_length-mean(Data.X2Kernel_length))/(max(Data.X2Kernel_length)-min(Data.X2Kernel_length));

x = table2array([Data(:,1)]);
y = table2array([Data(:,2)]);

g = {Data.WheatVarieties};
gscatter(x,y,g);
hold on;