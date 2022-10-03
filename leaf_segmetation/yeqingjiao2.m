clc;
clear;
close all;
%michelia sakura1
% load('../data/sakura1/subLeaf.mat');
load('..\data\sakura1\sakura1\subLeaf.mat')
load('..\data\sakura1\sakura1\cate.mat')
leafSize=max(cate);

theta2=zeros(leafSize,1);

for leafIndex=1:leafSize
    leafIndex;
    temp=find(cate==leafIndex);
    
    b=point2plain(subLeaf(temp,1),subLeaf(temp,2),subLeaf(temp,3));
    
    theta2(leafIndex)=acosd(1/sqrt(b(1)^2+b(2)^2+1));
end