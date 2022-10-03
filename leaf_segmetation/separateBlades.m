function [ DL,cate ] = separateBlades( leaf,centerPoint,category )

pointSize=size(leaf,1);

% x,y,z的最小值
minX=min(leaf(:,1));
minY=min(leaf(:,2));
minZ=min(leaf(:,3));
% 格式化，将所有的点向原点平移相同的距离
leafX=formatPoint(leaf(:,1),minX);
leafY=formatPoint(leaf(:,2),minY);
leafZ=formatPoint(leaf(:,3),minZ);

a=zeros(max(leafX),max(leafY),max(leafZ));

cate=zeros(pointSize,1);

meanPoints=[];

for i=1:max(category)/1
    i;
    % 寻找当前i值与与分类表中相同的行，即属于同一类别的中心点
    points=find(category==i);
    % 若找不到则进入下一个类别
    if size(points,1)==0
        continue;
    end
    % 找到属于同一类的中心点在leaf中对应的具体行
    centerPoint(points,:);
    % 在leaf中找到具体中心点，并按列求均值
    meanPoints=[meanPoints;mean(leaf(centerPoint(points,:),:),1)];
end
% 格式化，将所有的点向原点平移相同的距离
meanPoints(:,1)=formatPoint(meanPoints(:,1),minX);
meanPoints(:,2)=formatPoint(meanPoints(:,2),minY);
meanPoints(:,3)=formatPoint(meanPoints(:,3),minZ);

%meanPoints 为每一类中心点坐标的均值
% 如本次为33类，meanPoints有33行，每行前三列为对应类所有中心点的平均坐标
for i=1:size(meanPoints,1)
    i;
    a(meanPoints(i,1),meanPoints(i,2),meanPoints(i,3))=1;
end
%  D = bwdist(a) D表示每个元素所在的位置与最近的非零元素位置的最短距离；
% 若本就是非零元素则置零

D = bwdist(a);


% DL 中的元素是非负整数。
%       值为 0 的元素不属于一个独立的分水岭区域，这些像素被称为“分水岭元素”；
%       值为 1 的元素属于第一个分水岭区域；
%       值为 2 的元素属于第二个分水岭区域；
%       值为 3 的元素属于第三个分水岭区域；
%       。。。
%       以此类推。

DL = watershed(D);

for i=1:pointSize/1
    i
    t=DL(leafX(i),leafY(i),leafZ(i));
    if t==0
        t=max(max(max(DL(max(1,leafX(i)-1):min(max(leafX),leafX(i)+1),...
                         max(1,leafY(i)-1):min(max(leafY),leafY(i)+1),...
                         max(1,leafZ(i)-1):min(max(leafZ),leafZ(i)+1)...
                         )...
                      )...
                  )...
               );
        i;
    end
    cate(i)=t;
end
end

