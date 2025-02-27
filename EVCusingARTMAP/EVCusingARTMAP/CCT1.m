function [S1,S2]=CCT1(s1,s2)
c1=imread('C:\Users\NEW\Documents\MATLAB\work\EVCusingARTMAP\cover1.tiff');
c2=imread('C:\Users\NEW\Documents\MATLAB\work\EVCusingARTMAP\cover2.tiff');
[m1,n1]=size(c1); n1=n1/3;
[m2,n2]=size(c2); n2=n2/3;
l=1;
for i=1:2:m1
    k=1;
    for j=1:2:n1
        B1(:,:,:)=c1(i:i+1,j:j+1,:);
        B2(:,:,:)=c2(i:i+1,j:j+1,:);
        B3(:,:,:)=s1(i:i+1,j:j+1,:);
        B4(:,:,:)=s2(i:i+1,j:j+1,:);
        if(mod(1,2)==1)
           p1=[B1,B3];
           p2=[B2,B4];
        else
            p1=[B3,B1];
            p2=[B4,B2];
        end
        S1(l:l+1,k:k+3,:)=p1;
        S2(l:l+1,k:k+3,:)=p2;
        k=k+4;
    end
    l=l+2;
end;
%figure;imshow(S1);
%figure;imshow(S2);
end
