function [ s ] = calcArea( leaf,cate )
groundArea=(max(leaf(:,1))-min(leaf(:,1)))*(max(leaf(:,2))-min(leaf(:,2)));
disp(['占地面积' num2str(groundArea)]);

% tempLeaf=proj2plain(leaf,[0 0 0]);
% [k,Area] = convhull(tempLeaf(:,1),tempLeaf(:,2));

cateSize=max(cate);
s=zeros(cateSize,1);
for i=1:cateSize
    temp=find(cate==i);
    if size(temp,1)<4
        continue;
    end
    x=leaf(temp,1);
    y=leaf(temp,2);
    z=leaf(temp,3);
    
    tempLeaf=proj2plain([x y z],[0 0 0]);   %[000]
    [~,area] = convhull(tempLeaf(:,1),tempLeaf(:,2));
    s(i)=area;
end
end

