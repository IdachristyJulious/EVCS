function E=ImgExt(Inp)
[m,n]=size(Inp);
n=n/3;
l=1;
for i=1:m
k=1;
for j=1:2:n
E(l,k,:)=Inp(i,j,:);
k=k+1;
end
l=l+1;
end;
end

