close all
clc
clear all

%A=importdata('C:\Users\Roya A C\Documents\MATLAB\Waterloo\Roya_test\March18-15/NOTambient.txt');
A=importdata('C:\Users\Roya A C\Documents\MATLAB\Waterloo\Roya_test\March18-15/Point2.txt');
% c=importdata('512_Point2.mat');
% C=detrend(c.y_values.values);
% 
% figure, plot(A)
% figure, plot(B)
% figure, plot(C)

[m n dim]=size(A);

PC1 = A(:,1);

minPC1=min(PC1);
shiftPC1=PC1+abs(minPC1);

mPC1=max(PC1);
cPC1=std(PC1)^2;

PC2 = A(:,2);

minPC2=min(PC2);
shiftPC2=PC2+abs(minPC2);

mPC2=min(PC2);
cPC2=std(PC2)^2;

xi = [PC1,PC2];

[N dim]=size(A);

M=3;

Pi(1,1:M)=1/M;

for i=1:M
    mu(i,:) = [mPC1*rand(1) mPC2*rand(1)];
    covar(:,:,i) = [cPC1 0; 0 cPC2];
    p(i)=rand(1);
end
P=sum(p);
p=p./P;


for i=1:1
    tot(:,1)=zeros(1,N);
    for j=1:M
        tot(:,1)=tot(:,1)+(mvnpdf(xi,mu(j,:),covar(:,:,j))*p(j));
    end 

   for j=1:M
       w(j,:) = (mvnpdf(xi,mu(j,:),covar(:,:,j))*p(j))./tot;
        p(j)=sum(w(j,:))/length(w(j,:));
        mu(j,:) = (w(j,:)*xi/sum(w(j,:)));
        covar(:,:,j) = diag([cov(PC1.*w(j,:)'),cov(PC2.*w(j,:)')]);
        Prob(i,j)=p(j);
        if i > 1
            if Prob(i,j) == Prob(i-1)
                a(j)=1;
            end
        end
        
   end
   if i > 1
       p(M)=1-sum(p(1):p(M-1));
       if sum(a) == M
           ans=i-1
           break
       end
   end
   
end



variable=sum(w,1);   
for j=1:length(w)
    for i=1:M
       var1=w(i,j);
       var2=variable(i)-var1;
       if var1*(M-1) > var2
          im(j)= (i-1)*(1/(M-1));
       end   
    end
end

figure, plot(im)

