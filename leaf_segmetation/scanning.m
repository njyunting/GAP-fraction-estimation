  %  jilubra��֦�ɵĵ�; jilu0��Ҷ�ӵĵ� 
  jilu01 =  [jilubra;  jilu0(:,1:3)];   % �����Ǽ���֦����Ҷ��һ��ĵ��� 
 
  %  jilu01=  [ jilu0];        % ������ֻ��Ҷ�ӵĵ��� 
  seepoint =[ -300,-300,120];     %  [100,-300,120];   
  %   [ -300,-300,120];   ����     [ 0,300,120];  ����       [ 300,-300,120]; ����    Mango_Tree1
  %   [ -300,-300,120];   ����     [ 0,300,120];  ����       [ 300,-300,120]; ����    Rubber_Tree1
  %   [ -300,-300,120];   ����     [ 0,300,120];  ����       [ 300,-300,120]; ����    Walnut_Tree
  %   [ -300,-300,120];   ����     [ 0,300,120];  ����       [ 300,-300,120];  ����   Rubber_Tree2
  
  jilu = jilu01;
  
  jilu(:,1) = jilu(:,1)-seepoint(1,1);  % �ӵ�Ϊ [-200,-500,-400]  һƬҶ���ڲ��ķ����� 
  jilu(:,2) = jilu(:,2)-seepoint(1,2);  % �ӵ�Ϊ [-200,-500,-400]  һƬҶ���ڲ��ķ����� 
  jilu(:,3) = jilu(:,3)-seepoint(1,3);  % �ӵ�Ϊ [-200,-500,-400]  һƬҶ���ڲ��ķ����� 
  jilu(:,4) =  (( jilu(:,1) ).^2+( jilu(:,2) ).^2+(  jilu(:,3) ).^2 ).^0.5;   % ������������ӵ��ŷʽ���� 
  jilu01(:,4) =   jilu(:,4);
  
  jilu1=[];
 
  jilu1(:,1) =  rad2deg(  acos(jilu(:,1) ./ sqrt(  jilu(:,1).^2 +  jilu(:,2).^2))   )   ;   % ��ֱ�ߵķ�������һ����������ȡ�ڵ� 
  jilu1(:,2) =  rad2deg(  asin(jilu(:,2) ./ sqrt(  jilu(:,1).^2 +  jilu(:,2).^2))   )     ;
  jilu1(:,3) =  rad2deg(  atan(jilu(:,3) ./ sqrt(  jilu(:,1).^2 +  jilu(:,2).^2  +  jilu(:,3).^2 )))   ;
  jilu2= round(jilu1*20)/20;           %   ����Խ��ɨ���ܶ�Խ�ߣ��ڵ�Խ������  
  %   �������� 1000 �ﵽ10΢����  ����ֱ���Ƕ��ٶ��� 10��0.1�ȵ�ɨ�辫�ȣ�20��0.05�ȵ�ɨ�辫��  
  %   Mango_Tree1����ĵ�֮������0.0688�� ���ĵĵ��ż���� 0.0540������20������
  
  
  [k3,k4,k5] = unique(jilu2,'rows');    % k3�Ƕ�����Ľ��, k4�Ǽ�¼����Щ��ı��, 
  [k6,k7]=sort(k5);                            % k5���ֵ�����jilu2��ԭ��ֵ��k4��λ��
  % k4�Ǿֲ����ݷֳ�����
  
  j=1;  occ=zeros(max(k6),4);
  for i=1:max(k6)
      temp=jilu01( k7(k6==i),:);   % ��ÿһ�� �ж��ٵ㣬�Ӷ�ȡһ�����ӵ������С�ĵ�
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
hold on; plot3(jilu0(:,1),jilu0(:,2),jilu0(:,3),'g*' ,'markersize',2 );   % ��ɫΪԭ����Ҷ�ӵ�  
xlabel('X');  ylabel('Y'); zlabel('Z');    
hold on; plot3(jilubra (:,1),jilubra (:,2),jilubra(:,3),'b*' ,'markersize',2 );  % ��ɫΪԭ����Ҷ�ӵ�  

hold on;  plot3(occ(:,1),occ(:,2),occ(:,3),'r*' ,'markersize',2);   % ��ɫΪ�ܹ������ĵ�  
hold on;  plot3(seepoint(1,1),seepoint(1,2),seepoint(1,3),'mo' ,'markersize',15,  'MarkerFaceColor', 'm' );
xlabel('X');  ylabel('Y'); zlabel('Z');


[aa,bb]  = intersect  (  occ(:,1:3),  jilu0,  'rows'  ) ;  % �����ԭ������֦�ɵĵ��޳���
occ1=occ(bb,:); 
occ=occ1;


%   axis([-100 100 -100 110])
%  ���Ҫ������ÿ�����ɨ������ �����ں�
%  occleftfloor=occ;
occall=[ occleftfloor; occding;   occrightfloor];
[k4,k5] = unique(occall,'rows'); 
[ftshist, binpos] = hist (occall(k5,3),200);  
figure, plot( ftshist, binpos,'ro-'        );       %  ������ɨ���ĵ� 
[ftshist, binpos] = hist (jilu01(:,3),200);
hold on; plot(ftshist, binpos,'b*-'  );            %  ������ԭ���ĵ� 



% aa7=intersect(occall(k5,1:3),branchdian,'rows');
% plot3(aa7(:,1),aa7(:,2),aa7(:,3),'r*' ,'markersize',3 );   % �����ཻ��֦�ɵ�

b1=zeros(1,3);   % ���������Ҷ�ӵ� 
for i=1:800
    b1(i,1:3)=aa7(int32(1+(length(aa7)-1)*rand), 1:3 );
end
b2 = setdiff(aa7,b1,'rows');   % �� 

aa8=intersect(occall(k5,1:3),jilu0,'rows');
plot3(jilu0(:,1),jilu0(:,2),jilu0(:,3),'g*' ,'markersize',3 ); 
hold on;   plot3(aa8(:,1),aa8(:,2),aa8(:,3),'bla*' ,'markersize',3 );   % �����ཻ��Ҷ�ӵ� 

b1=zeros(1,3);   % �������������Ҷ�ӵ� 
for i=1:800
    b1(i,1:3)=aa8(int32(1+(length(aa8)-1)*rand), 1:3 );
end

figure, plot3(b2(:,1),b2(:,2),b2(:,3),'b*' ,'markersize',3 );   % �����ཻ��֦�ɵ� 
hold on;  plot3(b1(:,1),b1(:,2),b1(:,3),'b*' ,'markersize',3 );   % �����ཻ��֦�ɵ� 



