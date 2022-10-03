function [  ] = showClassification( subLeaf,centerPoint,category )

figure;
plot3(subLeaf(centerPoint,1),subLeaf(centerPoint,2),subLeaf(centerPoint,3),'w.','markersize',0.1);
xlabel x;ylabel y;zlabel z;
axis equal;
hold on;
for i=1:max(category)
    t=centerPoint(category==i);
    x=subLeaf(t,1);
    y=subLeaf(t,2);
    z=subLeaf(t,3);
    plot3(x,y,z,'.','Color',[rand() rand() rand()],'markersize',6);
end

