function [S1,S2]=SCT(netSCT)
Img=imread('C:\Users\NEW\Documents\MATLAB\work\EVCusingSOM\EXTIMG1.tiff');
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
        img=zeros(3,1);
        for p=1:3
            if (Img(i,j,p)==255)
                img(p,1)=1;
            end
        end
        a=sim(netSCT,img);
        class=vec2ind(a);
        switch(class)
            case 1
                S2(k,l,:)=[0,255,255];
                S2(k,l+1,:)=[255,255,0];
                S2(k+1,l,:)=[255,255,255];
                S2(k+1,l+1,:)=[255,0,255];
            case 2
                 S2(k,l,:)=[255,255,255];
                S2(k,l+1,:)=[0,255,255];
                S2(k+1,l,:)=[255,255,0];
                S2(k+1,l+1,:)=[255,0,255]; 
            case 3
                S2(k,l,:)=[255,0,255];
                S2(k,l+1,:)=[0,255,255];
                S2(k+1,l,:)=[255,255,255];
                S2(k+1,l+1,:)=[255,255,0];  
          case 4
                S2(k,l,:)=[255,255,0];
                S2(k,l+1,:)=[0,255,255];
                S2(k+1,l,:)=[255,0,255];
                S2(k+1,l+1,:)=[255,255,255];
          case 5
                 S2(k,l,:)=[255,0,255];
                S2(k,l+1,:)=[255,255,255];
                S2(k+1,l,:)=[0,255,255];
                S2(k+1,l+1,:)=[255,255,0];   
          case 6
                S2(k,l,:)=[255,255,0];
                S2(k,l+1,:)=[255,255,255];
                S2(k+1,l,:)=[0,255,255];
                S2(k+1,l+1,:)=[255,0,255];
           case 7
                S2(k,l,:)=[255,255,0];
                S2(k,l+1,:)=[255,0,255];
                S2(k+1,l,:)=[255,255,255];
                S2(k+1,l+1,:)=[0,255,255];
            case 8
                S2(k,l,:)=[255,255,0];
                S2(k,l+1,:)=[0,255,255];
                S2(k+1,l,:)=[255,255,255];
                S2(k+1,l+1,:)=[255,0,255]; 
         end
     l=l+2;
    end
 k=k+2;  
end
%figure;subplot(1,2,1);imshow(S1);title('SHARE 1');
%subplot(1,2,2);imshow(S2);title('SHARE 2');
imwrite(S1,'Share1.tiff');
imwrite(S2,'Share2.tiff');
%O(:,:,2)=bitand(S1(:,:,2),S2(:,:,2));
%O(:,:,3)=bitand(S1(:,:,3),S2(:,:,3));
%O(:,:,1)=bitand(S1(:,:,1),S2(:,:,1));
%figure;imshow(O);title('OVERLAPPED IMAGE');
%imwrite(O,'Overlappedimg.tiff');
end
