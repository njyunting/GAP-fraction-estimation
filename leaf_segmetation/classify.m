function [ category ] = classify( leaf,centerPoint )
leaf=leaf(centerPoint,:);

leaf_x=leaf(:,1);%第一列转为行向量
leaf_y=leaf(:,2);
leaf_z=leaf(:,3);
leaf=[leaf_x,leaf_y,leaf_z];
pointSize=length(leaf);%中心点个数

d=pdist(leaf);%获得两个点之间的距离
d=squareform(d);%将此行向量转换为原距离方阵

category=zeros(pointSize,1);%返回一个pointSizex1矩阵
for pointIndex=1:pointSize/1
    pointIndex
    
    if category(pointIndex)>0
        continue;
    end
    x=leaf_x(pointIndex);
    y=leaf_y(pointIndex);
    z=leaf_z(pointIndex);
    
    indexs=fun(pointIndex,d);%pointIndex是种子点的系列
    %     if length(indexs)>10%含笑
    if length(indexs)>0%樱花
        category(indexs)=pointIndex;
    end
end
% cate=unique(category);
end

