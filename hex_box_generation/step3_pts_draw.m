clc;
clear;
load L_pro_with_hexbox.mat
figure_id=1;

% ¶Ôleaf1
% zlim([15 25])
% xlim([-22 -14])

 leaves_draw( L_pro_with_hexbox,figure_id,[0,0,255]);
xlabel('x');
ylabel('y');
zlabel('z');
% 
for i =1: size(L_pro_with_hexbox,1)
    temp = L_pro_with_hexbox{i,5};
    t = find(temp(:,2)>-1);
    if (isempty(t))
        continue
    else
        i
    end
end

% hold on
% zhigan = load('D:\matlab Project\Dongni Li UPDATE\ly\data\yinxintubranch.txt');
% plot3(zhigan(:,1),zhigan(:,2),zhigan(:,3),'.','color',[0,0,0],'Markersize',3)
%     load sakura1branch.txt;
%   T=sakura1branch(:,1:3);
%    plot3(T(:,1),T(:,2),T(:,3),'.','color',[0.5451,0.27059,0.07451],'Markersize',3);
  
%   load branch.pts;
%   T=branch(:,1:3);
%   plot3(T(:,1),T(:,2),T(:,3),'.','color',[0.5451,0.27059,0.07451]);

%   load XJSbranch.txt;
%   T=XJSbranch(:,1:3);
%   plot3(T(:,1),T(:,2),T(:,3),'.','color',[0.5451,0.27059,0.07451],'Markersize',3);

%   load XJSXJSbranch.txt;
%   T=XJSXJSbranch(:,1:3);
%   plot3(T(:,1),T(:,2),T(:,3),'.','color',[0.5451,0.27059,0.07451],'Markersize',3);
% 
%   load trunkxjs1.txt;
%   T=trunkxjs1(:,1:3);
%   plot3(T(:,1),T(:,2),T(:,3),'.','color',[0.5451,0.27059,0.07451],'Markersize',3);



%   load XJSNEWbranch.txt;
%   T=XJSNEWbranch(:,1:3);
%   plot3(T(:,1),T(:,2),T(:,3),'.','color',[0.5451,0.27059,0.07451],'Markersize',3);
  
%   load yxsbranch.txt;
%   T=yxsbranch(:,1:3);
%   plot3(T(:,1),T(:,2),T(:,3),'.','color',[0.5451,0.27059,0.07451],'Markersize',3);
  
  
  
%   load XJStrunk.txt;
%   T=XJStrunk(:,1:3);
%   plot3(T(:,1),T(:,2),T(:,3),'.','color',[0.5451,0.27059,0.07451],'Markersize',3);
%   
%    load ziweibranch.txt;
%    T=ziweibranch(:,1:3);
%    plot3(T(:,1),T(:,2),T(:,3),'.','color',[0.5451,0.27059,0.07451],'Markersize',3);



%    load tuan4zhi2.txt;
%    T=tuan4zhi2(:,1:3);
%    plot3(T(:,1),T(:,2),T(:,3),'.','color',[0 0 0],'Markersize',3);


% 
%    load C:\Users\13896\Desktop\×ÀÃæ±£´æ\cxnew\ÍÅ4\tuan4hebingzhi.txt;
%    T=tuan4hebingzhi(:,1:3);
%    plot3(T(:,1),T(:,2),T(:,3),'.','color',[0 0 0],'Markersize',2);

%================== 
%    load C:\Users\13896\Desktop\cxnew\trunkxjs1.txt;
%    T=trunkxjs1(:,1:3);
%    plot3(T(:,1),T(:,2),T(:,3),'.','color',[0 0 0],'Markersize',3);


%    load C:\Users\13896\Desktop\cxnew\ÍÅ5\zhi.txt;
%    T=zhi(:,1:3);
%    plot3(T(:,1),T(:,2),T(:,3),'.','color',[0 0 0],'Markersize',5);

%  load C:\Users\13896\Desktop\cxnew\Ïð½ºÊ÷2\zhi.txt;
%    T=zhi(:,1:3);
%    plot3(T(:,1),T(:,2),T(:,3),'.','color',[0 0 0],'Markersize',5);


%  load C:\Users\13896\Desktop\cxnew\Ïð½ºÊ÷3\zhi.txt;
%    T=zhi(:,1:3);
%    plot3(T(:,1),T(:,2),T(:,3),'.','color',[0 0 0],'Markersize',5);



%    load yxs1branch_000000.txt;
%    T=yxs1branch_000000(:,1:3);
%    plot3(T(:,1),T(:,2),T(:,3),'.','color',[0.5451,0.27059,0.07451],'Markersize',3);
%    hold on
%     load yxs1branch_000001.txt;
%    T=yxs1branch_000001(:,1:3);
%    plot3(T(:,1),T(:,2),T(:,3),'.','color',[0.5451,0.27059,0.07451],'Markersize',3);
   
   
%    load Micheliabranch.txt;
%    T=Micheliabranch(:,1:3);
%    plot3(T(:,1),T(:,2),T(:,3),'.','color',[0.5451,0.27059,0.07451],'Markersize',3);