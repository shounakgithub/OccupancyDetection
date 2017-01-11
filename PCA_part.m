function [ Y_new] = PCA_part( Y )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
[m n, dim]=size(Y);
[COEFF1 SCORE1 LATENT1]=princomp(Y);
comp1=COEFF1(:,1:2);
Y_new=Y*comp1;

end

