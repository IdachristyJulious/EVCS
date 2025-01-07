   clc; 
close all;
clear all;
tic
tstart=tic
I=imread('C:\Users\NEW\Documents\MATLAB\work\EVCusingARTMAP\input images\128\peppers128.tiff');
disp('Color Decompostion in process');
I1=imresize(I,0.5);
[c1,m1,y1]=Colordecomp_rev(I1);
imwrite(c1,'pcyan.tiff');
imwrite(m1,'pmagenta.tiff');
imwrite(y1,'pyellow.tiff');
I2=imread('C:\Users\NEW\Documents\MATLAB\work\EVCusingARTMAP\input images\128\boat128.tiff');
I2=imresize(I2,0.5);
[c2,m2,y2]=Colordecomp_rev(I2);
imwrite(c2,'lcyan.tiff');
imwrite(m2,'lmagenta.tiff');
imwrite(y2,'lyellow.tiff');
I3=imread('C:\Users\NEW\Documents\MATLAB\work\EVCusingARTMAP\input images\128\lena128.tiff');
I3=imresize(I3,0.5);
[c3,m3,y3]=Colordecomp_rev(I3);
imwrite(c3,'scyan.tiff');
imwrite(m3,'smagenta.tiff');
imwrite(y3,'syellow.tiff');
disp('halftone in process');
H1=JARVIS(I1);
H2=JARVIS(I2);
H3=JARVIS(I3);
figure;imshow(H1);title('Halftone Image');
figure;imshow(H2);title('Halftone Image');
figure;imshow(H3);title('Halftone Image');
imwrite(H1,'halftone1.tiff');
imwrite(H2,'halftone2.tiff');
imwrite(H3,'halftone3.tiff');
close all
disp('Image Extraction in progress');
E1=ImgExt(H1);
E2=ImgExt(H2);
E3=ImgExt(H3);
figure;imshow(E1);title('Extracted Image');
figure;imshow(E2);title('Extracted Image');
figure;imshow(E3);title('Extracted Image');
imwrite(E1,'EXTIMG1.tiff');
imwrite(E2,'EXTIMG2.tiff');
imwrite(E3,'EXTIMG3.tiff');
close all
disp('Secret Image Coding in progress');
load netsct.mat;
[SS1,SS2]=BP_SCT(net);
disp('Cover Image Coding in progress');
load netcct.mat;
BPCCT(netcct);
[S1,S2]=CCT1(SS1,SS2);
imwrite(S1,'Share1.tiff');title('Share1');
imwrite(S2,'Share2.tiff');title('Share2');
O(:,:,1)=bitand(S1(:,:,1),S2(:,:,1));
O(:,:,2)=bitand(S1(:,:,2),S2(:,:,2));
O(:,:,3)=bitand(S1(:,:,3),S2(:,:,3));
figure;imshow(O);title('OVERLAPPED IMAGE');
imwrite(O,'overlappedimage.tiff');
mse=sum(sum(sum((uint8(O)-I).^2)))/(512*512*3)
psnr=10*log10(255^2/mse)
disp('Successful completion');
toc