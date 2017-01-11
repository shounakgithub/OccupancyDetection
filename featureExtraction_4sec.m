clear all
clc
close all

A=importdata('512_Point1.mat');
X=detrend(A.y_values.values);
B=importdata('512_Point2.mat');
Y=detrend(B.y_values.values);

freq=512;
int=4;

l=length(X);

%break into 10 second intervals
itt=floor(l/(freq*int));
r=itt*freq*int;

it=1;
for i=1:512*int:r
  a=X(i:i+(512*int)-1);
  b=Y(i:i+(512*int)-1);
  n=it;
  
    MX(n,1)=max(a);
    MX(n,2)=max(b);
    
    MN(n,1)=min(a);
    MN(n,2)=min(b);
    
    ME(n,1)=mean(a);
    ME(n,2)=mean(b);
    
    SD(n,1)=sqrt(sum((a-ME(n,1)).^2)*(1/(length(a)-1)));
    SD(n,2)=sqrt(sum((b-ME(n,2)).^2)*(1/(length(b)-1)));
    
    RM(n,1)=sqrt(sum(a.^2)*(1/length(a)));
    RM(n,2)=sqrt(sum(b.^2)*(1/length(b)));
     
    SK(n,1)=sum((a-ME(n,1)).^3)/((length(a)-1)*SD(n,1)^3);
    SK(n,2)=sum((b-ME(n,2)).^3)/((length(b)-1)*SD(n,2)^3);
    
    KT(n,1)=sum((a-ME(n,1)).^4)/((length(a)-1)*SD(n,1)^4);
    KT(n,2)=sum((b-ME(n,2)).^4)/((length(b)-1)*SD(n,2)^4);    
       
    NS(n,1)=sum((a-ME(n,1)).^6)/((length(a)-1)*SD(n,1)^6);
    NS(n,2)=sum((b-ME(n,2)).^6)/((length(b)-1)*SD(n,2)^6);
     
    CF(n,1)=MX(n,1)/RM(n,1);
    CF(n,2)=MX(n,2)/RM(n,2);
    
    AS(n,1)=sum(a.^2);
    AS(n,2)=sum(b.^2);
    
    PF(n,1)=MX(n,1)/ME(n,1);
    PF(n,2)=MX(n,2)/ME(n,2);
    
    RA(n,1)=((sum(abs(a).^0.5))/length(a))^2;
    RA(n,2)=((sum(abs(b).^0.5))/length(b))^2;
    
    MF(n,1)=MX(n,1)/RA(n,1);
    MF(n,2)=MX(n,2)/RA(n,2);
    
    %Y1=[MX(n,1); MN(n,1); ME; SD; RM; SK; KT; NS; CF; AS; PF; RA; MF]';

    it=it+1;
end

figure, plot(MX(:,1),'b')
hold on
plot(MX(:,2),'g')
xlabel('Point')
ylabel('Magnitude')
legend('Point 1 - Front of class', 'Point 2 - Back of class','Location','NorthEastOutside')

figure, plot(MN(:,1),'b')
hold on
plot(MN(:,2),'g')
xlabel('Point')
ylabel('Magnitude')
legend('Point 1 - Front of class', 'Point 2 - Back of class','Location','NorthEastOutside')

figure, plot(ME(:,1),'b')
hold on
plot(ME(:,2),'g')
xlabel('Point')
ylabel('Magnitude')
legend('Point 1 - Front of class', 'Point 2 - Back of class','Location','NorthEastOutside')

figure, plot(SD(:,1),'b')
hold on
plot(SD(:,2),'g')
xlabel('Point')
ylabel('Magnitude')
legend('Point 1 - Front of class', 'Point 2 - Back of class','Location','NorthEastOutside')

figure, plot(RM(:,1),'b')
hold on
plot(RM(:,2),'g')
xlabel('Point')
ylabel('Magnitude')
legend('Point 1 - Front of class', 'Point 2 - Back of class','Location','NorthEastOutside')

figure, plot(SK(:,1),'b')
hold on
plot(SK(:,2),'g')
xlabel('Point')
ylabel('Magnitude')
legend('Point 1 - Front of class', 'Point 2 - Back of class','Location','NorthEastOutside')

figure, plot(KT(:,1),'b')
hold on
plot(KT(:,2),'g')
xlabel('Point')
ylabel('Magnitude')
legend('Point 1 - Front of class', 'Point 2 - Back of class','Location','NorthEastOutside')

figure, plot(NS(:,1),'b')
hold on
plot(NS(:,2),'g')
xlabel('Point')
ylabel('Magnitude')
legend('Point 1 - Front of class', 'Point 2 - Back of class','Location','NorthEastOutside')

figure, plot(CF)
figure, plot(CF(:,1),'b')
hold on
plot(CF(:,2),'g')
xlabel('Point')
ylabel('Magnitude')
legend('Point 1 - Front of class', 'Point 2 - Back of class','Location','NorthEastOutside')

figure, plot(AS(:,1),'b')
hold on
plot(AS(:,2),'g')
xlabel('Point')
ylabel('Magnitude')
legend('Point 1 - Front of class', 'Point 2 - Back of class','Location','NorthEastOutside')

figure, plot(PF(:,1),'b')
hold on
plot(PF(:,2),'g')
xlabel('Point')
ylabel('Magnitude')
legend('Point 1 - Front of class', 'Point 2 - Back of class','Location','NorthEastOutside')

figure, plot(RA(:,1),'b')
hold on
plot(RA(:,2),'g')
xlabel('Point')
ylabel('Magnitude')
legend('Point 1 - Front of class', 'Point 2 - Back of class','Location','NorthEastOutside')

figure, plot(MF(:,1),'b')
hold on
plot(MF(:,2),'g')
xlabel('Point')
ylabel('Magnitude')
legend('Point 1 - Front of class', 'Point 2 - Back of class','Location','NorthEastOutside')

%%

%Y1=[MX(:,1)'; MN(:,1)'; ME(:,1)'; SD(:,1)'; RM(:,1)'; SK(:,1)'; KT(:,1)'; NS(:,1)'; CF(:,1)'; AS(:,1)'; PF(:,1)'; RA(:,1)'; MF(:,1)']';
%Y2=[MX(:,2)'; MN(:,2)'; ME(:,2)'; SD(:,2)'; RM(:,2)'; SK(:,2)'; KT(:,2)'; NS(:,2)'; CF(:,2)'; AS(:,2)'; PF(:,2)'; RA(:,2)'; MF(:,2)']';

%Y=[AS; CF; KT; ME; MF; MN; MX; PF; RA; RM; SD; SK; NS]';

%Based on Shilpa's Thesis only use SD, RMS, AS and RA
%MX and MN debatably uselful too, but will neglect
Y1=[SD(:,1)'; RM(:,1)'; AS(:,1)'; RA(:,1)']';
Y2=[SD(:,2)'; RM(:,2)'; AS(:,2)'; RA(:,2)']';

%Use PCA to reduce feature size
[m n, dim]=size(Y1);
[COEFF1 SCORE1 LATENT1]=princomp(Y1);
comp1=COEFF1(:,1:2);
Y_new1=Y1*comp1
%dlmwrite('Point1.txt',Y_new1);
figure, plot(Y_new1(50:94,1),Y_new1(50:94,2),'bo')
hold on
plot(Y_new1(107:151,1),Y_new1(107:151,2),'bo')
hold on
plot(Y_new1(163:214,1),Y_new1(163:214,2),'bo')
hold on
plot(Y_new1(226:273,1),Y_new1(226:273,2),'bo')
hold on
plot(Y_new1(330:374,1),Y_new1(330:374,2),'bo')
hold on

plot(Y_new1(45:49,1),Y_new1(45:49,2),'r.')
hold on
plot(Y_new1(95:106,1),Y_new1(95:106,2),'r.')
hold on
plot(Y_new1(152:162,1),Y_new1(152:162,2),'r.')
hold on
plot(Y_new1(215:225,1),Y_new1(215:225,2),'r.')
hold on
plot(Y_new1(274:275,1),Y_new1(274:275,2),'r.')
hold on
plot(Y_new1(325:329,1),Y_new1(325:329,2),'r.')
hold on
plot(Y_new1(375:379,1),Y_new1(375:379,2),'r.')
hold on

plot(Y_new1(1:44,1),Y_new1(1:44,2),'g+')
hold on
plot(Y_new1(276:324,1),Y_new1(276:324,2),'g+')
hold on
plot(Y_new1(380:427,1),Y_new1(380:427,2),'g+')

xlabel('PC1')
ylabel('PC2')
legend('Full - bo', 'Walking - r.','Ambient - g+', 'Location' ,'NorthEastOutside')
title('Point 1 - Front of class')


clc

[m n, dim]=size(Y2);
[COEFF2 SCORE2 LATENT2]=princomp(Y2);
comp2=COEFF2(:,1:2);
Y_new2=Y2*comp2
%dlmwrite('Point2.txt',Y_new2);
% figure, plot(Y_new2(:,1),Y_new2(:,2),'.')
% xlabel('PC1')
% ylabel('PC2')

figure, plot(Y_new2(50:94,1),Y_new2(50:94,2),'bo')
hold on
plot(Y_new2(107:151,1),Y_new2(107:151,2),'bo')
hold on
plot(Y_new2(163:214,1),Y_new2(163:214,2),'bo')
hold on
plot(Y_new2(226:273,1),Y_new2(226:273,2),'bo')
hold on
plot(Y_new2(330:374,1),Y_new2(330:374,2),'bo')
hold on

plot(Y_new2(45:49,1),Y_new2(45:49,2),'r.')
hold on
plot(Y_new2(95:106,1),Y_new2(95:106,2),'r.')
hold on
plot(Y_new2(152:162,1),Y_new2(152:162,2),'r.')
hold on
plot(Y_new2(215:225,1),Y_new2(215:225,2),'r.')
hold on
plot(Y_new2(274:275,1),Y_new2(274:275,2),'r.')
hold on
plot(Y_new2(325:329,1),Y_new2(325:329,2),'r.')
hold on
plot(Y_new2(375:379,1),Y_new2(375:379,2),'r.')
hold on

plot(Y_new2(1:44,1),Y_new2(1:44,2),'g+')
hold on
plot(Y_new2(276:324,1),Y_new2(276:324,2),'g+')
hold on
plot(Y_new2(380:427,1),Y_new2(380:427,2),'g+')

xlabel('PC1')
ylabel('PC2')
legend('Full - bo', 'Walking - r.','Ambient - g+', 'Location' ,'NorthEastOutside')
title('Point 2 - Back of class')

clc

% figure, plot(Y_new2(50:94,1),Y_new2(50:94,2),'b.',Y_new2(107:151,1),Y_new2(107:151,2),'b.',Y_new2(163:214,1),Y_new2(163:214,2),'b.',Y_new2(226:273,1),Y_new2(226:273,2),'b.',Y_new2(330:374,1),Y_new2(330:374,2),'b.')
% hold on
% plot(Y_new2(45:49,1),Y_new2(45:49,2),'r.',Y_new2(95:106,1),Y_new2(95:106,2),'r.',Y_new2(152:162,1),Y_new2(152:162,2),'r.',Y_new2(215:225,1),Y_new2(215:225,2),'r.',Y_new2(274:275,1),Y_new2(274:275,2),'r.',Y_new2(325:329,1),Y_new2(325:329,2),'r.',Y_new2(375:379,1),Y_new2(375:379,2),'r.')
% hold on
% plot(Y_new2(1:44,1),Y_new2(1:44,2),'g.',Y_new2(276:324,1),Y_new2(276:324,2),'g.',Y_new2(380:427,1),Y_new2(380:427,2),'g.')
% hold off
% 
% xlabel('PC1')
% ylabel('PC2')
% legend('Full','Walking','Ambient')
% title('Point 2 - Back of class')


