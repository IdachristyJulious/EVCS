function OUT = JARVIS(Im)
I=double(Im);
I = double(I)/255;
ORIG = 255*I;
% Extract Color Planes from the image
cyanIm = 1 - ORIG(:,:,1)/255;
magentaIm = 1 - ORIG(:,:,2)/255;
yellowIm = 1 - ORIG(:,:,3)/255;
% Condition for Error Diffusion into RGB planes
redIm = 1 - cyanIm;
greenIm = 1 - magentaIm;
blueIm = 1 - yellowIm;
[y1,q,k] = errordiff(redIm,[0 0 -99*48 7 5; 3 5 7 5 3; 1 3 5 3 1]/48);
[y2,q,k] = errordiff(greenIm,[0 0 -99*48 7 5; 3 5 7 5 3; 1 3 5 3 1]/48);
[y3,q,k] = errordiff(blueIm,[0 0 -99*48 7 5; 3 5 7 5 3; 1 3 5 3 1]/48);
OUT(:,:,1) = y1;
OUT(:,:,2) = y2;
OUT(:,:,3) = y3;
      
function [out, qn, k] = errordiff(in, fc)
  v=1; 
  dir=1; 
  l=0; 
[ri,ci]=size(in);
[rm,cm]=size(fc);
[r0,c0]=find(fc==-99);				% find origin of error filter
fc(r0,c0)=0;

rm=rm-1; cm=cm-1;
inpad=zeros(ri+rm,ci+cm);			% modified input image
inpad(r0:r0+ri-1,c0:c0+ci-1)=in;
out=zeros(ri,ci); qn=out;
sp=1; ep=ci; step=1;				% for direction changing
r0=r0-1; c0=c0-1;

for y=1:ri
  for x=sp:step:ep
    inpix=inpad(y+r0,x+c0);
    outpix=(inpix+l*in(y,x))>=0.5;
    out(y,x)=outpix;
    qerr=outpix-inpix;
    qn(y,x)=qerr;
    inpad(y:y+rm,x:x+cm)=inpad(y:y+rm,x:x+cm)-qerr*fc;
  end
  if dir==-1
    step=-step; temp=ep; ep=sp; sp=temp;
    fc=fc(:,cm+1:-1:1); end
  if v
   % fprintf('\rDithering... %3d%% done',round(y/ri*100)), 
   end
end

if v
  fprintf('\n')
end

if nargout==3
  xp=out(:)-0.5-qn(:);
  k=sum(abs(xp))/(2*sum(xp.^2));
end

