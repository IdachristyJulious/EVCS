    netcct=newff(minmax(inpcct),[6,12,12,12,12,6,6,24],{'tansig','tansig','tansig','tansig','purelin','purelin','purelin','purelin'},'trainlm');
    netcct.trainParam.epochs = 5000;
    netcct.trainParam.goal = 1e-5;
    [netcct,tr]=train(netcct,inpcct,targetcct);
    a=sim(netcct,inpcct)
for i=1:10
  netcct=init(netcct);
  [netcct,tr]=train(netcct,inpcct,targetcct);
  a=sim(netcct,inpcct)
  i
end
