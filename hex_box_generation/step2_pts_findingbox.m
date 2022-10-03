clc;
clear;
close all;
warning off;
 load L_src.mat

%把L_src里每一片叶子计算曲面进行投影，并计算投影点
%L_pro 每一行是一个叶子，每一行的第一列是原始点位，第二列是x,y和在拟合平面上的z值，第三列是曲面系数coef，第四列是每个叶子的颜色信息
%曲面参数z=coef(1)+ coef(2)*x +coef(3)*y + coef(4)*x.^2 + coef(5)*x.*y+coef(6)*y.^2 + coef(7)*x.^3 + coef(8)*x.^2.*y + coef(9)*x.*y.^2 + coef(10)*y.^3;
L_pro=leaves_project(L_src);

% temp  = L_pro(:,2);
% %
% temp2 = [];
% temp  = L_pro(:,2);
% for b = 1:size(temp,1)
%     t = temp{b};
%     t = abs(t(:,3));
%     temp2 = [temp2;t];
% end
% % %
%     temp2 = [];
% temp  = L_pro(:,2);
% for b = 1:size(temp,1)
%  t = temp{b};
%      t =t(:,3);
%     t1 = max(t);
%     t2 = min(t);
%     t3 = t1 - t2;
%     temp2 = [temp2;t3];
% end
% %
% 
% count  =1 ;% 最大Z的平方
% for a = 1:size(temp,1)
%     t = temp{a};
%      t =t(:,3);
%     t1 = max(t);
%     t2 = min(t);
%     t3 = t1 - t2;
%     t =t3.^2;
%     if t>count  
%         % 将此行数值用上一行覆盖
%         temp1 = L_pro(a-1,:);
%       a
%        L_pro(a,:)=temp1;
%     end
% end


%根据上一步对每个叶子求取六面框
%L_pro_with_hexbox前四列和L_pro一致，最后一列是框体的点位信息。
%框体的点位信息是12个点位，排列顺序是前六个点为下面儿的ABCDEF一圈顺序点位，后六个点为对应的上面儿的A'B'C'D'E'F'。
L_pro_with_hexbox=leaves_hex_bound(L_pro);

save L_pro_with_hexbox.mat L_pro_with_hexbox;