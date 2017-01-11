clear all
clc
close all

A=importdata('512_Point1.mat');
X=detrend(A.y_values.values);
B=importdata('512_Point2.mat');
Y=detrend(B.y_values.values);

freq=512;
int=8;

[ Y1 ] = featExtrac( freq, int, X);

[ Y2 ] = featExtrac( freq, int, Y);

%Use PCA to reduce feature size
[ Y_new1 ] = PCA_part( Y1 );
[COEFF, LATENT, EXPLAINED] = pcacov(Y1);
EXPLAINED
%dlmwrite('Point1.txt',Y_new1);

figure, plot(Y_new1(27:48,1),Y_new1(27:48,2),'bo')
hold on
plot(Y_new1(55:76,1),Y_new1(55:76,2),'bo')
hold on
plot(Y_new1(84:108,1),Y_new1(84:108,2),'bo')
hold on
plot(Y_new1(115:137,1),Y_new1(115:137,2),'bo')
hold on
plot(Y_new1(168:188,1),Y_new1(168:188,2),'bo')
hold on

plot(Y_new1(25:26,1),Y_new1(25:26,2),'r.')
hold on
plot(Y_new1(49:54,1),Y_new1(49:54,2),'r.')
hold on
plot(Y_new1(77:83,1),Y_new1(77:83,2),'r.')
hold on
plot(Y_new1(109:114,1),Y_new1(109:114,2),'r.')
hold on
plot(Y_new1(138:140,1),Y_new1(138:140,2),'r.')
hold on
plot(Y_new1(164:167,1),Y_new1(164:167,2),'r.')
hold on
plot(Y_new1(189:190,1),Y_new1(189:190,2),'r.')
hold on

plot(Y_new1(1:24,1),Y_new1(1:24,2),'g+')
hold on
plot(Y_new1(141:163,1),Y_new1(141:163,2),'g+')
hold on
plot(Y_new1(191:213,1),Y_new1(191:213,2),'g+')

xlabel('PC1')
ylabel('PC2')
legend('Full - bo', 'Walking - r.','Ambient - g+', 'Location' ,'NorthEastOutside')
title('Point 1 - Front of class')


clc

[ Y_new2 ] = PCA_part( Y2 ); % CONTAINS 2 COLUMNS - 2 PCs.

%dlmwrite('Point2.txt',Y_new2);

% figure, plot(Y_new2(:,1),Y_new2(:,2),'.')
% xlabel('PC1')
% ylabel('PC2')

figure, plot(Y_new2(27:48,1),Y_new2(27:48,2),'bo')
hold on
plot(Y_new2(55:76,1),Y_new2(55:76,2),'bo')
hold on
plot(Y_new2(84:108,1),Y_new2(84:108,2),'bo')
hold on
plot(Y_new2(115:137,1),Y_new2(115:137,2),'bo')
hold on
plot(Y_new2(168:188,1),Y_new2(168:188,2),'bo')
hold on

plot(Y_new2(25:26,1),Y_new2(25:26,2),'r.')
hold on
plot(Y_new2(49:54,1),Y_new2(49:54,2),'r.')
hold on
plot(Y_new2(77:83,1),Y_new2(77:83,2),'r.')
hold on
plot(Y_new2(109:114,1),Y_new2(109:114,2),'r.')
hold on
plot(Y_new2(138:140,1),Y_new2(138:140,2),'r.')
hold on
plot(Y_new2(164:167,1),Y_new2(164:167,2),'r.')
hold on
plot(Y_new2(189:190,1),Y_new2(189:190,2),'r.')
hold on

plot(Y_new2(1:24,1),Y_new2(1:24,2),'g+')
hold on
plot(Y_new2(141:163,1),Y_new2(141:163,2),'g+')
hold on
plot(Y_new2(191:213,1),Y_new2(191:213,2),'g+')

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

% SEGREGATION OF OCCUPIED AND UNOCCUPIED
y(1:24,1)=0;
y(24:140,1)=1;
y(141:163,1)=0;
y(164:190,1)=1;
y(191:213,1)=0;
% SEGREGATION OF OCCUPIED AND UNOCCUPIED

figure,
SVMStruct=svmtrain(Y_new2,y,'showplot',true,'Kernel_Function','polynomial','polyorder',2);

sample=xlsread('ambient.xlsx');
freq=2000;

samp=detrend(sample(:,2));

[ test ] = featExtrac( freq, int, samp);
[ testy ] = PCA_part( test );

figure,
Group = svmclassify(SVMStruct,testy,'Showplot',true);

% CREATING A NEW ARRAY (Y_clust) TO STORE THE y VALUES WHICH CORRESPOND TO 1.
it=1;
for i=1:length(Y_new2)
    if y(i)== 1
    Y_clust(it,:)=Y_new2(i,:);
    it=it+1;
    end
end

%dlmwrite('NOTambient.txt',Y_clust);
%close all
%% Apply the GMM EM algorithm to see how it clusters
A=Y_clust(:,2); % WHY SENDING THE SECOND COLUMN ???
M=2;
[ im ] = GMM_EM( A, M );
figure, subplot (2,1,1), plot(im)
subplot (2,1,2), plot (Y_clust(:,2))

