  %  jilubra是枝干的点; jilu0是叶子的点 
  jilu01 =  [jilubra;  jilu0(:,1:3)];   % 这里是加上枝干与叶子一起的点云 
 
  %  jilu01=  [ jilu0];        % 这里是只有叶子的点云 
  seepoint =[ -300,-300,120];     %  [100,-300,120];   
  %   [ -300,-300,120];   左下     [ 0,300,120];  顶点       [ 300,-300,120]; 右下    Mango_Tree1
  %   [ -300,-300,120];   左下     [ 0,300,120];  顶点       [ 300,-300,120]; 右下    Rubber_Tree1
  %   [ -300,-300,120];   左下     [ 0,300,120];  顶点       [ 300,-300,120]; 右下    Walnut_Tree
  %   [ -300,-300,120];   左下     [ 0,300,120];  顶点       [ 300,-300,120];  右下   Rubber_Tree2
  
  jilu = jilu01;
  
  jilu(:,1) = jilu(:,1)-seepoint(1,1);  % 视点为 [-200,-500,-400]  一片叶子内部的法向量 
  jilu(:,2) = jilu(:,2)-seepoint(1,2);  % 视点为 [-200,-500,-400]  一片叶子内部的法向量 
  jilu(:,3) = jilu(:,3)-seepoint(1,3);  % 视点为 [-200,-500,-400]  一片叶子内部的法向量 
  jilu(:,4) =  (( jilu(:,1) ).^2+( jilu(:,2) ).^2+(  jilu(:,3) ).^2 ).^0.5;   % 这里求的是离视点的欧式距离 
  jilu01(:,4) =   jilu(:,4);
  
  jilu1=[];
 
  jilu1(:,1) =  rad2deg(  acos(jilu(:,1) ./ sqrt(  jilu(:,1).^2 +  jilu(:,2).^2))   )   ;   % 把直线的法向量归一化，进而求取遮挡 
  jilu1(:,2) =  rad2deg(  asin(jilu(:,2) ./ sqrt(  jilu(:,1).^2 +  jilu(:,2).^2))   )     ;
  jilu1(:,3) =  rad2deg(  atan(jilu(:,3) ./ sqrt(  jilu(:,1).^2 +  jilu(:,2).^2  +  jilu(:,3).^2 )))   ;
  jilu2= round(jilu1*20)/20;           %   数字越大，扫描密度越高，遮挡越不严重  
  %   根据推算 1000 达到10微度了  这里直接是多少度了 10是0.1度的扫描精度，20是0.05度的扫描精度  
  %   Mango_Tree1最近的点之间间隔是0.0688度 中心的点大概间隔是 0.0540，设置20正合适
  
  
  [k3,k4,k5] = unique(jilu2,'rows');    % k3是独立后的结果, k4是记录了哪些点的标号, 
  [k6,k7]=sort(k5);                            % k5体现的是在jilu2中原数值在k4的位置
  % k4是局部数据分成类了
  
  j=1;  occ=zeros(max(k6),4);
  for i=1:max(k6)
      temp=jilu01( k7(k6==i),:);   % 算每一类 有多少点，从而取一个离视点距离最小的点
      [k8,k9]=min(temp(:,4));
      occ(j,:)=temp(k9,:);
      j=j+1;
      i
  end


% for i=1:max(k4)
%       [aa]  =find(jilu2(:,1)==k3(i,1) & jilu2(:,2) == k3(i,2) & jilu2(:,3) == k3(i,3));
%       occ(j,:)=jilu02(aa(1,1),: ) ;
%       j=j+1
% end
  
  
  
figure,   
hold on; plot3(jilu0(:,1),jilu0(:,2),jilu0(:,3),'g*' ,'markersize',2 );   % 绿色为原来的叶子点  
xlabel('X');  ylabel('Y'); zlabel('Z');    
hold on; plot3(jilubra (:,1),jilubra (:,2),jilubra(:,3),'b*' ,'markersize',2 );  % 蓝色为原来的叶子点  

hold on;  plot3(occ(:,1),occ(:,2),occ(:,3),'r*' ,'markersize',2);   % 绿色为能够看见的点  
hold on;  plot3(seepoint(1,1),seepoint(1,2),seepoint(1,3),'mo' ,'markersize',15,  'MarkerFaceColor', 'm' );
xlabel('X');  ylabel('Y'); zlabel('Z');


[aa,bb]  = intersect  (  occ(:,1:3),  jilu0,  'rows'  ) ;  % 这里把原来包含枝干的点剔除掉
occ1=occ(bb,:); 
occ=occ1;


%   axis([-100 100 -100 110])
%  这边要出的是每个点的扫描数据 进行融合
%  occleftfloor=occ;
occall=[ occleftfloor; occding;   occrightfloor];
[k4,k5] = unique(occall,'rows'); 
[ftshist, binpos] = hist (occall(k5,3),200);  
figure, plot( ftshist, binpos,'ro-'        );       %  这里是扫描后的点 
[ftshist, binpos] = hist (jilu01(:,3),200);
hold on; plot(ftshist, binpos,'b*-'  );            %  这里是原来的点 



% aa7=intersect(occall(k5,1:3),branchdian,'rows');
% plot3(aa7(:,1),aa7(:,2),aa7(:,3),'r*' ,'markersize',3 );   % 画出相交的枝干点

b1=zeros(1,3);   % 画出多余的叶子点 
for i=1:800
    b1(i,1:3)=aa7(int32(1+(length(aa7)-1)*rand), 1:3 );
end
b2 = setdiff(aa7,b1,'rows');   % 求差集 

aa8=intersect(occall(k5,1:3),jilu0,'rows');
plot3(jilu0(:,1),jilu0(:,2),jilu0(:,3),'g*' ,'markersize',3 ); 
hold on;   plot3(aa8(:,1),aa8(:,2),aa8(:,3),'bla*' ,'markersize',3 );   % 画出相交的叶子点 

b1=zeros(1,3);   % 画出随机产生的叶子点 
for i=1:800
    b1(i,1:3)=aa8(int32(1+(length(aa8)-1)*rand), 1:3 );
end

figure, plot3(b2(:,1),b2(:,2),b2(:,3),'b*' ,'markersize',3 );   % 画出相交的枝干点 
hold on;  plot3(b1(:,1),b1(:,2),b1(:,3),'b*' ,'markersize',3 );   % 画出相交的枝干点 



