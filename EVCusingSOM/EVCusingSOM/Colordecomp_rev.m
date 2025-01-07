function [cyan,magenta,yellow]=Colordecomp_rev(A)    
%A=imread('D:\RESEARCH\BMP\sailboat.bmp')
    A = im2uint8(A);
    N=256;
    gr = 0:1/(N-1):1;
        cMap = zeros(N,3);
        cMap(:,1) = gr;   
        red=ind2rgb(A(:,:,1),cMap);
        cyan=1-red;
        cMap = zeros(N,3);
        cMap(:,2)=gr;
        green=ind2rgb(A(:,:,2),cMap);
        magenta=1-green;
        cMap = zeros(N,3);
        cMap(:,3)=gr;
        blue=ind2rgb(A(:,:,3),cMap);
        yellow=1-blue;
end