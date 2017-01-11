function [ Rank] = R( Y )

[m n, dim]=size(Y);
[COEFF1 SCORE1 LATENT1]=princomp(Y);
[COEFF, LATENT, EXPLAINED] = PCACOV(Y)
Rank=EXPLAINED;
end

