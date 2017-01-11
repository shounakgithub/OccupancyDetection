function [ Y ] = featExtrac( freq, int, X)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    l=length(X);
    itt=floor(l/(freq*int));
    r=itt*freq*int;
    it=1;
    for i=1:freq*int:r
      a=X(i:i+(512*int)-1);
      %b=Y(i:i+(512*int)-1);
      n=it;

        MX(n,1)=max(a);
        %MX(n,2)=max(b);

        MN(n,1)=min(a);
        %MN(n,2)=min(b);

        ME(n,1)=mean(a);
        %ME(n,2)=mean(b);

        SD(n,1)=sqrt(sum((a-ME(n,1)).^2)*(1/(length(a)-1)));
        %SD(n,2)=sqrt(sum((b-ME(n,2)).^2)*(1/(length(b)-1)));

        RM(n,1)=sqrt(sum(a.^2)*(1/length(a)));
        %RM(n,2)=sqrt(sum(b.^2)*(1/length(b)));

        SK(n,1)=sum((a-ME(n,1)).^3)/((length(a)-1)*SD(n,1)^3);
        %SK(n,2)=sum((b-ME(n,2)).^3)/((length(b)-1)*SD(n,2)^3);

        KT(n,1)=sum((a-ME(n,1)).^4)/((length(a)-1)*SD(n,1)^4);
        %KT(n,2)=sum((b-ME(n,2)).^4)/((length(b)-1)*SD(n,2)^4);    

        NS(n,1)=sum((a-ME(n,1)).^6)/((length(a)-1)*SD(n,1)^6);
        %NS(n,2)=sum((b-ME(n,2)).^6)/((length(b)-1)*SD(n,2)^6);

        CF(n,1)=MX(n,1)/RM(n,1);
        %CF(n,2)=MX(n,2)/RM(n,2);

        AS(n,1)=sum(a.^2);
        %AS(n,2)=sum(b.^2);

        PF(n,1)=MX(n,1)/ME(n,1);
        %PF(n,2)=MX(n,2)/ME(n,2);

        RA(n,1)=((sum(abs(a).^0.5))/length(a))^2;
        %RA(n,2)=((sum(abs(b).^0.5))/length(b))^2;

        MF(n,1)=MX(n,1)/RA(n,1);
        %MF(n,2)=MX(n,2)/RA(n,2);

        %Y1=[MX(n,1); MN(n,1); ME; SD; RM; SK; KT; NS; CF; AS; PF; RA; MF]';

        it=it+1;
    end

    Y=[MX(:,1)'; MN(:,1)'; ME(:,1)'; SD(:,1)'; RM(:,1)'; SK(:,1)'; KT(:,1)'; NS(:,1)'; CF(:,1)'; AS(:,1)'; PF(:,1)'; RA(:,1)'; MF(:,1)']';
    %Y2=[MX(:,2)'; MN(:,2)'; ME(:,2)'; SD(:,2)'; RM(:,2)'; SK(:,2)'; KT(:,2)'; NS(:,2)'; CF(:,2)'; AS(:,2)'; PF(:,2)'; RA(:,2)'; MF(:,2)']';

    
end

