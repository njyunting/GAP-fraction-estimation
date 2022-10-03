clc;
clear;
close all;
% name='Michelia';
% % name='sakura1';
% % name='sakura2';
% leaf=load(['../data/' name ' ldnleaf.txt']);
% name='tuan4hebingzhi920 - Cloud';
%leaf=load(['./data/yxsleaf6.txt']);
% leaf=load(['./data/tuan4hebingzhi920 - Cloud.txt']);
% name='yinxintuleaf';
% leaf=load(['./data/yinxintuleaf.txt']);
% name='rubber part4 leaf';
% leaf=load(['./data/rubber part4 leaf.txt']);

name='团簇3';
leaf=load(['C:\Users\27826\Desktop\GIScience & Remote Sensing\matlab\ly\data\Michelia leafjzzy.txt']);

subLeaf=fit_leave;

leafX=subLeaf(:,1);
leafY=subLeaf(:,2);
leafZ=subLeaf(:,3);


%%
if exist(['../data/' name '/centerPoint.mat'],'file')
    load(['../data/' name '/centerPoint.mat']);
else
    centerPoint=findCenterPoint(subLeaf); %调用findCenterPoint函数找中心区域点
%     save(['../data/' name '/centerPoint.mat'],'centerPoint');
end

figure;
plot3(subLeaf(:,1),subLeaf(:,2),subLeaf(:,3),'g.','markersize',6);
xlabel x;ylabel y;zlabel z;
% axis equal;

hold on;
plot3(subLeaf(centerPoint,1),subLeaf(centerPoint,2),subLeaf(centerPoint,3),'k.');
hold off;

% figure;
% plot3(subLeaf(centerPoint,1),subLeaf(centerPoint,2),subLeaf(centerPoint,3),'k.');
% xlabel x;ylabel y;zlabel z;
% axis equal;


if exist(['../data/' name '/category.mat'],'file')
    load(['../data/' name '/category.mat']);
else
    category=classify(subLeaf,centerPoint);
%     save(['../data/' name '/category.mat'],'category');
end

% showClassification(subLeaf,centerPoint,category); 输出centerpoint 
category1 = unique(category,'rows');

if exist(['../data/' name '/cate.mat'],'file') && exist(['../data/' name '/DL.mat'],'file')
    load(['../data/' name '/cate.mat']);
    load(['../data/' name '/DL.mat']);
else
    [DL,cate]=separateBlades(subLeaf,centerPoint,category);
%     save(['../data/' name '/cate.mat'],'cate');
%     save(['../data/' name '/DL.mat'],'DL');
end


leaf1=showColorBlades(subLeaf,centerPoint,DL,cate);
%%
for i =1:max(cate)
    idx = find(cate == i);
    bb = leaf(idx(:,1),:);
%     r1=rand();r2=rand();r3=rand();
%     plot3(bb(:,1),bb(:,2),bb(:,3),'.','Markersize',10,'Color',[r1,r2,r3]);
%     hold on
    filename=['.\tempdata\leaf(',num2str(i),').txt'];
    save(filename,'bb','-ascii');
    %writematrix(bb,filename,'Delimiter' ,' ' );
end
% filename=['D:\Winter梨\研\ly\ly\data\data','.txt'];
% dlmwrite(filename,leaf1,'delimiter','\t','newline','pc');



% s=calcArea(subLeaf,cate);