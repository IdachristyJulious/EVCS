O=imread('C:\MATLAB7\work\BP\peppers1024x1024\overlappedimage.tiff');
I=imread('C:\MATLAB7\work\BP\input images\pepper1024.tiff');
[m,n]=size(I);
n=n/3;
sqx=0;
sqy=0;
xy=0;
sumx=sum(sum(sum(I)));
sumy=sum(sum(sum(O)));
for i=1:m
    for j=1:n
        for k=1:3
        sqx(i,j,k)=I(i,j,k)^2;
        sqy(i,j,k)=O(i,j,k)^2;
        xy(i,j,k)=I(i,j,k)*O(i,j,k);
        end
    end
end
sumsqx=sum(sum(sum(sqx)))
sumsqy=sum(sum(sum(sqy)))
sumxy=sum(sum(sum(xy)))
avgx=sumx/(512*512*3)
avgy=sumy/(512*512*3)
exy=sumxy/(512*512*3)
stdx=sqrt(sumsqx/(512*512*3)*avgx^2)
stdy=sqrt(sumsqy/(512*512*3)*avgy^2)
corr=(exy*(avgx*avgy))/(stdx*stdy)