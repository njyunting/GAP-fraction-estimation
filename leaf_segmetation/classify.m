function [ category ] = classify( leaf,centerPoint )
leaf=leaf(centerPoint,:);

leaf_x=leaf(:,1);%��һ��תΪ������
leaf_y=leaf(:,2);
leaf_z=leaf(:,3);
leaf=[leaf_x,leaf_y,leaf_z];
pointSize=length(leaf);%���ĵ����

d=pdist(leaf);%���������֮��ľ���
d=squareform(d);%����������ת��Ϊԭ���뷽��

category=zeros(pointSize,1);%����һ��pointSizex1����
for pointIndex=1:pointSize/1
    pointIndex
    
    if category(pointIndex)>0
        continue;
    end
    x=leaf_x(pointIndex);
    y=leaf_y(pointIndex);
    z=leaf_z(pointIndex);
    
    indexs=fun(pointIndex,d);%pointIndex�����ӵ��ϵ��
    %     if length(indexs)>10%��Ц
    if length(indexs)>0%ӣ��
        category(indexs)=pointIndex;
    end
end
% cate=unique(category);
end

