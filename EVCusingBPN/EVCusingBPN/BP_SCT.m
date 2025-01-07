function [S1,S2]=BP_SCT(net)
Img=imread('C:\Users\NEW\Documents\MATLAB\work\EVCusingBPN\EXTIMG1.tiff');
[m,n]=size(Img);
n=n/3;
k=1;
for i=1:m
l=1;
for j=1:n
    S1(k,l,:)=[255,255,0];
    S1(k,l+1,:)=[0,255,255];
    S1(k+1,l,:)=[255,255,255];
    S1(k+1,l+1,:)=[255,0,255];
    inp=impixel(Img,j,i);
    inp=inp';
    out=sim(net,inp);
    out=round(out');
    S2(k,l,:)=out(:,1:3);
    S2(k,l+1,:)=out(:,4:6);
    S2(k+1,l,:)=out(:,7:9);
    S2(k+1,l+1,:)=out(:,10:12);
    l=l+2;
end
k=k+2;
end;
figure;imshow(S1);title('SHARE 1');
figure;imshow(S2);title('SHARE 2'); 
%end


