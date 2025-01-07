Img=imread('C:\MATLAB7\work\Imageextraction\pExtimg.tiff');
for i=200:m
l=1;
for j=200:n
    inp=impixel(Img,i,j);
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
disp(i)
end;