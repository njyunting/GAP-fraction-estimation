clc;clear;close all;
leaf=load ('../data/Michelia leaf.txt');

leaf_x=leaf(:,1);
leaf_y=leaf(:,2);
leaf_z=leaf(:,3);
pointSize=length(leaf);

plot3(leaf_x,leaf_y,leaf_z,'g.');
xlabel('x');ylabel('y');zlabel('z');
axis equal;


largeRange=0.1;
smallRange=0.01;
leafWidth=0.025;

c1=0;c2=0;c3=0;

finalPoint=[];

for i0=1:7
%     pointIndex
    pointIndex=ceil(rand()*pointSize);
    x=leaf_x(pointIndex);
    y=leaf_y(pointIndex);
    z=leaf_z(pointIndex);
    % cube
    r_x1=leaf_x > (x-largeRange);
    r_x2=leaf_x < (x+largeRange);
    r_y1=leaf_y > (y-largeRange);
    r_y2=leaf_y < (y+largeRange);
    r_z1=leaf_z > (z-largeRange);
    r_z2=leaf_z < (z+largeRange);
    r=r_x1 & r_x2 & r_y1 & r_y2 & r_z1 & r_z2;
%     clear r_x1 r_x2 r_y1 r_y2 r_z1 r_z2
    
    subPoint=find(r>0);
    tempPoint=find(r>0);
    
    hold on;
    plot3(leaf(tempPoint,1),leaf(tempPoint,2),leaf(tempPoint,3),'r.');
    
    for i=size(tempPoint,1):-1:1
        if (leaf_x(tempPoint(i))-x)^2+(leaf_y(tempPoint(i))-y)^2+(leaf_z(tempPoint(i))-z)^2 > smallRange^2
            tempPoint(i)=[];
        end
    end
    
    
    if size(tempPoint,1)<10
        continue;
    end
    
    tempLeaf=leaf(tempPoint,:);
    
    % d=pdist(tempLeaf);
    % d=squareform(d);
    % d=d(:,1);
    
    b=point2plain([tempLeaf(:,1),tempLeaf(:,2),tempLeaf(:,3)]);
    
    plot3(tempLeaf(:,1),tempLeaf(:,2),tempLeaf(:,3),'k.');
    
    d=zeros(size(subPoint,1),1);
    for i=1:size(subPoint,1)
        d(i)=calcDis(leaf(subPoint(i),:),b);
    end
    
    
    testPoint=find(d<smallRange);
    if size(testPoint,1)<10
        continue;
    end
    
    tempPoint=subPoint(testPoint,:);
    b=point2plain([leaf(tempPoint,1),leaf(tempPoint,2),leaf(tempPoint,3)]);
    
    plot3(leaf(tempPoint,1),leaf(tempPoint,2),leaf(tempPoint,3),'c.');
    
    plot3(x,y,z,'b.','markersize',20);
    
    
%     %     distance between [x,y,z] to mean of tempP
%     meanPoint=mean(leaf(tempPoint,:));
%     D=(meanPoint(1)-x)^2+(meanPoint(2)-y)^2+(meanPoint(3)-z)^2;
%     if D>(leafWidth/10)^2;
%         c1=c1+1;
%         continue;
%     end
%     
%     %     distance between [x,y,z] to plain
%     b=point2plain(leaf(tempPoint,:));
%     D=calcDis([x,y,z],b);
%     if D>leafWidth/10
%         c2=c2+1;
%         continue;
%     end
%     
%     %     mean distance between tempP to plain
%     D=calcDis(leaf(tempPoint,:),b);
%     if D>leafWidth/10
%         c3=c3+1;
%         continue;
%     end
%     finalPoint=[finalPoint;pointIndex];
end
% c1
% c2
% c3
% finalPoint
% plot3(newLeaf(:,1),newLeaf(:,2),newLeaf(:,3),'b.');
% plot3(leaf(point,1),leaf(point,2),leaf(point,3),'b*');
% hold off;