clc;
clear;
close all;

leaf=load ('../data/Michelia leaf1.txt');
% leaf=load ('../data/sakura1 leaf.txt');

pointSize=size(leaf,1);
leaf_x=leaf(:,1);
leaf_y=leaf(:,2);
leaf_z=leaf(:,3);

theta1=zeros(pointSize,1);

for leafIndex=1:pointSize
    leafIndex;
    x=leaf_x(leafIndex);
    y=leaf_y(leafIndex);
    z=leaf_z(leafIndex);
    
    range=0.012;
    %     cube
    r_x1=leaf_x > (x-range);
    r_x2=leaf_x < (x+range);
    r_y1=leaf_y > (y-range);
    r_y2=leaf_y < (y+range);
    r_z1=leaf_z > (z-range);
    r_z2=leaf_z < (z+range);
    r=r_x1 & r_x2 & r_y1 & r_y2 & r_z1 & r_z2;
    %     sphere
    tempP=find(r>0);
    for i=length(tempP):-1:1
        if (leaf_x(tempP(i))-x)^2+(leaf_y(tempP(i))-y)^2+(leaf_z(tempP(i))-z)^2 > range^2
            tempP(i)=[];
        end
    end
    if length(tempP)<10
        continue;
    end
    
    b=point2plain(leaf_x(tempP),leaf_y(tempP),leaf_z(tempP));
    
    theta1(leafIndex)=acosd(1/sqrt(b(1)^2+b(2)^2+1));
end