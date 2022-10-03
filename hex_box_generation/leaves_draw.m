function leaves_draw( L_pro_with_hexbox,figure_id,box_color)
num=size(L_pro_with_hexbox,1);
close all;
figure(figure_id);

%这个for循环就是遍历所有的叶子进行画出，每一个循环画一个叶子。如果你想画单片叶子，就把这里的for i=2:num改成任意你想画的，for
%i=5:5就是画第5片叶子。
for i=1:num%num
    i
    r1=rand();r2=rand();r3=rand();
x=cell2mat(L_pro_with_hexbox(i,2));
c=cell2mat(L_pro_with_hexbox(i,4));
box=cell2mat(L_pro_with_hexbox(i,5));

% dis = (box(1,1)-box(2,1)).^2 + (box(1,2)-box(2,2)).^2 + (box(1,3)-box(2,3)).^2;
% if(sqrt(dis)>0.5)
%     continue;
% end
% 
% dis = (box(2,1)-box(3,1)).^2 + (box(2,2)-box(3,2)).^2 + (box(2,3)-box(3,3)).^2;
% if(sqrt(dis)>0.5)
%     continue;
% end
% 
% dis = (box(3,1)-box(4,1)).^2 + (box(3,2)-box(4,2)).^2 + (box(3,3)-box(4,3)).^2;
% if(sqrt(dis)>0.5)
%     continue;
% end
% 
% dis = (box(4,1)-box(5,1)).^2 + (box(4,2)-box(5,2)).^2 + (box(4,3)-box(5,3)).^2;
% if(sqrt(dis)>0.5)
%     continue;
% end
% 
% dis = (box(5,1)-box(6,1)).^2 + (box(5,2)-box(6,2)).^2 + (box(5,3)-box(6,3)).^2;
% if(sqrt(dis)>0.5)
%     continue;
% end
% 
% dis = (box(6,1)-box(1,1)).^2 + (box(6,2)-box(1,2)).^2 + (box(6,3)-box(1,3)).^2;
% if(sqrt(dis)>0.5)
%     continue;
% end
% 画叶子投影点位信息
plot3(x(:,1),x(:,2),x(:,3),'.','color','r','Markersize',5);
hold on;

% 
% %画下面儿ABCDEF
% plot3([box(1:6,1);box(1,1)],[box(1:6,2);box(1,2)],[box(1:6,3);box(1,3)],'-','color',box_color);
% hold on;
% %画上面儿A'B'C'D'E'F'
% plot3([box(7:12,1);box(7,1)],[box(7:12,2);box(7,2)],[box(7:12,3);box(7,3)],'-','color',box_color);
% hold on;

% 
% 
% %把ABCDE对应的A'B'C'D'E'F'之间的连线画好，就形成了一个盒子
% for k=1:6
% plot3([box(k,1);box(k+6,1)],[box(k,2);box(k+6,2)],[box(k,3);box(k+6,3)],'-','color',box_color);
% hold on;
% end
% axis equal;
% end


color=[0,1,1];
 %color=[0,0.9,1];
%color=[0.25098,0.87843,0.81569];
 %color=[0,0.80784,0.81961];
%color=[0.27451,0.5098,0.70588];
%color=[0.53,0.81,0.92];
%画下面儿ABCDEF
fill3([box(1:6,1);box(1,1)],[box(1:6,2);box(1,2)],[box(1:6,3);box(1,3)],color,'FaceAlpha',0.5,'LineWidth',1);
hold on;
%画上面儿A'B'C'D'E'F'
% 上面小
box(7:12,1) = box(7:12,1)+(box(7:12,1)- min(box(7:12,1))).*0.01;
box(7:12,2) = box(7:12,2)+(box(7:12,2)- min(box(7:12,2))).*0.01;
box(7:12,3) = box(7:12,3)+(box(7:12,3)- min(box(7:12,3))).*0.01;


% ttt = [mean(box(7:12,1)),mean(box(7:12,2)),mean(box(7:12,3))];

fill3([box(7:12,1);box(7,1)],[box(7:12,2);box(7,2)],[box(7:12,3);box(7,3)],color,'FaceAlpha',0.5,'LineWidth',1);
hold on;



%把ABCDE对应的A'B'C'D'E'F'之间的连线画好，就形成了一个盒子
    for k=1:5
    fill3([box(k,1);box(k+6,1);box(k+7,1);box(k+1,1)],[box(k,2);box(k+6,2);box(k+7,2);box(k+1,2)],[box(k,3);box(k+6,3);box(k+7,3);box(k+1,3)],color,'FaceAlpha',0.1,'LineWidth',1);
    hold on;
%     fill3([box(k,1);box(k+1,1);ttt(1,1)],[box(k,2);box(k+1,2);ttt(1,2)],[box(k,3);box(k+1,3);ttt(1,3)],color,'FaceAlpha',0.5);
%     hold on;
    end
    %axis equal;
end

% zhi = load('D:\matlab Project\Dongni Li UPDATE\毕设\橡胶树4\trunk4.txt');
% plot3(zhi(:,1),zhi(:,2),zhi(:,3),'k.','markersize',6);
% xlabel x;ylabel y;zlabel z;



end

