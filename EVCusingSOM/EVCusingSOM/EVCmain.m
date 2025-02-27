clc; 
close all;
clear all;
tic
tstart=tic
I=imread('C:\Users\NEW\Documents\MATLAB\work\EVCusingSOM\input images\256\pepperscolor.tif');
disp('Color Decompostion in process');
I1=imresize(I,0.5);
[c1,m1,y1]=Colordecomp_rev(I1);
imwrite(c1,'Cyan1.tiff');
imwrite(m1,'Magenta1.tiff');
imwrite(y1,'Yellow1.tiff');
figure;subplot(2,2,1);imshow(I1);title('SECRET IMAGE');
subplot(2,2,2);imshow(c1);title('CYAN IMAGE');
subplot(2,2,3);imshow(m1);title('MAGENTA IMAGE');
subplot(2,2,4);imshow(y1);title('YELLOW IMAGE');
I2=imread('C:\Users\NEW\Documents\MATLAB\work\EVCusingSOM\input images\256\lenacolor.tif');
I2=imresize(I2,0.5);
[c2,m2,y2]=Colordecomp_rev(I2);
imwrite(c2,'Cyan2.tiff');
imwrite(m2,'Magenta2.tiff');
imwrite(y2,'Yellow2.tiff');
figure;subplot(2,2,1);imshow(I2);title('COVER IMAGE 1');
subplot(2,2,2);imshow(c2);title('CYAN IMAGE');
subplot(2,2,3);imshow(m2);title('MAGENTA IMAGE');
subplot(2,2,4);imshow(y2);title('YELLOW IMAGE');
I3=imread('C:\Users\NEW\Documents\MATLAB\work\EVCusingSOM\input images\256\boatcolor.tif');
I3=imresize(I3,0.5);
[c3,m3,y3]=Colordecomp_rev(I3);
imwrite(c3,'Cyan3.tiff');
imwrite(m3,'Magenta3.tiff');
imwrite(y3,'Yellow3.tiff');
figure;subplot(2,2,1);imshow(I1);title('COVER IMAGE 2');
subplot(2,2,2);imshow(c3);title('CYAN IMAGE');
subplot(2,2,3);imshow(m3);title('MAGENTA IMAGE');
subplot(2,2,4);imshow(y3);title('YELLOW IMAGE');
disp('halftone in process');
imshow(y3);
H1=JARVIS(I1);
H2=JARVIS(I2);
H3=JARVIS(I3);
figure;subplot(2,2,1);imshow(H1);title('Halftone Image 1');
subplot(2,2,2);imshow(H2);title('Halftone Image 2');
subplot(2,2,3:4);imshow(H3);title('Halftone Image 3');
imwrite(H1,'Halftone1.tiff');
imwrite(H2,'Halftone2.tiff');
imwrite(H3,'Halftone3.tiff');
disp('Image Extraction in progress');
E1=ImgExt(H1);
E2=ImgExt(H2);
E3=ImgExt(H3);
figure;subplot(2,2,1);imshow(E1);title('Extracted Image 1');
subplot(2,2,2);imshow(E2);title('Extracted Image 2');
subplot(2,2,3:4);imshow(E3);title('Extracted Image 3');
imwrite(E1,'Extimg1.tiff');
imwrite(E2,'Extimg2.tiff');
imwrite(E3,'Extimg3.tiff');
disp('Secret Image Coding in progress');
load SCT.mat;
[SS1,SS2]=SCT(netSCT);
disp('Cover Image Coding in progress');
load CCT.mat;
CCT(netCCT);
[S1,S2]=CCT1(SS1,SS2);
figure;imshow(S1);title('Share1');
figure;imshow(S2);title('Share2');
imwrite(S1,'Share1.tiff');
imwrite(S2,'Share2.tiff');
O(:,:,1)=bitand(S1(:,:,1),S2(:,:,1));
O(:,:,2)=bitand(S1(:,:,2),S2(:,:,2));
O(:,:,3)=bitand(S1(:,:,3),S2(:,:,3));
figure;imshow(O);title('OVERLAPPED IMAGE');
imwrite(O,'Overlappedimage.tiff');
mse=sum(sum(sum((uint8(O)-I).^2)))/(512*512*3)
psnr=10*log10(255^2/mse)
disp('Successful completion');
toc