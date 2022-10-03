function [ leaf1 ] = showColorBlades( leaf,centerPoint,DL,cate )

figure;
% plot3(leaf(:,1),leaf(:,2),leaf(:,3),'g.');
xlabel('x');ylabel('y');zlabel('z');
axis equal;
hold on;
% 
% plot3(leaf(centerPoint,1),leaf(centerPoint,2),leaf(centerPoint,3),'k.');
%  hold on;

leaf1=leaf(:,1:3);
for i=1:max(max(max(DL)))
    temp=find(cate==i);
    r1=rand();r2=rand();r3=rand();
    plot3(leaf(temp,1),leaf(temp,2),leaf(temp,3),'.','Markersize',6,'Color',[r1,r2,r3]);
    leaf1(temp,4)=r1;leaf1(temp,5)=r2;leaf1(temp,6)=r3;
end
end

