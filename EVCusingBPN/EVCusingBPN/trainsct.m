t=[255 255 255 255 255 255 0 255;
255 255 255 255 255 0 255 0;
0 0 0 255 0 255 255 255;
0 255 0 0 255 0 255 255;
255 255 255 255 0 255 255 255;
255 255 255 255 255 255 0 255;
255 0 255 255 255 255 255 0;
255 255 0 255 255 255 255 255;
255 255 255 0 255 255 255 255;
255 255 255 255 0 255 255 255;
0 0 255 0 255 255 0 255;
255 255 255 255 255 0 255 0]
p=[255 0 255 255 0 255 0 0;255 255 0 255 0 0 255 0;255 255 255 0 255 0 0 0]
net=newff(minmax(p),[3,6,9,12,9,12],{'tansig','tansig','tansig','purelin','purelin','purelin'},'trainlm');
    net.trainParam.epochs = 500;
    net.trainParam.goal = 1e-5;
    [net,tr]=train(net,p,t);
    a=sim(net,p)
for i=1:15
 net=init(net);
[net,tr]=train(net,p,t);
a=sim(net,p)
end
%net=setx(net,x)
round(a')