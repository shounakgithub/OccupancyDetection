clear all
clc
close all

load 512_Point1.mat
X=detrend(n_Point1.y_values.values);

load 512_Point2.mat
Y=detrend(n_Point2.y_values.values);