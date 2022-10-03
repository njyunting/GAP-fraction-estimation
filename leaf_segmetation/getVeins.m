clc;clear;close all;
leaf=load ('../data/Michelia leaf.txt');

leaf_x=leaf(:,1);
leaf_y=leaf(:,2);
leaf_z=leaf(:,3);
pointSize=length(leaf);

plot3(leaf_x,leaf_y,leaf_z,'g.');
xlabel('x');ylabel('y');zlabel('z');
axis equal;



