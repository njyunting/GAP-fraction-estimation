function [ L_pro] = leaves_project(L_src)
num=size(L_src,1);
L_pro=cell(num,4);
%对每个叶子点进行拟合三次曲面
%计算投影点
for i=1:num%
xyz=cell2mat(L_src(i,1));
xyz=rand(size(xyz,1),size(xyz,2))*0.00001+xyz;   % 去除重复的点，以免投影会出错 加上一个小的随机噪声 xyz=unique (xyz,'rows');  
L_pro(i,1)={xyz};
coef=zeros(1,10);
 if size(xyz,1)>10
    [e,p]=min([std(xyz(:,1));std(xyz(:,2));std(xyz(:,3))]);  % 算最小方差
    if p==3  % Z方差最小，用XY拟合Z
        sf = fit([xyz(:,1), xyz(:,2)],xyz(:,3),'poly33');   %可以通过poly33及后面多项式来改变拟合阶数
        coef = coeffvalues(sf);
        %曲面参数z=coef(1)+ coef(2)*x +coef(3)*y + coef(4)*x.^2 + coef(5)*x.*y+coef(6)*y.^2 + coef(7)*x.^3 + coef(8)*x.^2.*y + coef(9)*x.*y.^2 + coef(10)*y.^3;
        z_bar= repmat(coef(1),[size(xyz,1),1])  + coef(2)*xyz(:,1) +coef(3)*xyz(:,2) + coef(4)*xyz(:,1).^2 + coef(5)*xyz(:,1).*xyz(:,2)+coef(6)*xyz(:,2).^2 + coef(7)*xyz(:,1).^3 + ...
              coef(8)*xyz(:,1).^2.*xyz(:,2) + coef(9)*xyz(:,1).*xyz(:,2).^2 + coef(10)*xyz(:,2).^3;
        xyz(:,3)=z_bar;
    end
    if p==2  % Y方差最小，用XZ拟合Y
        sf = fit([xyz(:,1), xyz(:,3)],xyz(:,2),'poly33');   %可以通过poly33及后面多项式来改变拟合阶数
        coef = coeffvalues(sf);
        %曲面参数z=coef(1)+ coef(2)*x +coef(3)*y + coef(4)*x.^2 + coef(5)*x.*y+coef(6)*y.^2 + coef(7)*x.^3 + coef(8)*x.^2.*y + coef(9)*x.*y.^2 + coef(10)*y.^3;
        y_bar= repmat(coef(1),[size(xyz,1),1])  + coef(2)*xyz(:,1) +coef(3)*xyz(:,3) + coef(4)*xyz(:,1).^2 + coef(5)*xyz(:,1).*xyz(:,3)+coef(6)*xyz(:,3).^2 + coef(7)*xyz(:,1).^3 + ...
              coef(8)*xyz(:,1).^2.*xyz(:,3) + coef(9)*xyz(:,1).*xyz(:,3).^2 + coef(10)*xyz(:,3).^3;
        xyz(:,2)=y_bar;
    end
    if p==1  % X方差最小，用YZ拟合X
        sf = fit([xyz(:,2), xyz(:,3)],xyz(:,1),'poly33');   %可以通过poly33及后面多项式来改变拟合阶数
        coef = coeffvalues(sf);
        %曲面参数z=coef(1)+ coef(2)*x +coef(3)*y + coef(4)*x.^2 + coef(5)*x.*y+coef(6)*y.^2 + coef(7)*x.^3 + coef(8)*x.^2.*y + coef(9)*x.*y.^2 + coef(10)*y.^3;
        x_bar= repmat(coef(1),[size(xyz,1),1])  + coef(2)*xyz(:,2) +coef(3)*xyz(:,3) + coef(4)*xyz(:,2).^2 + coef(5)*xyz(:,2).*xyz(:,3)+coef(6)*xyz(:,3).^2 + coef(7)*xyz(:,2).^3 + ...
              coef(8)*xyz(:,2).^2.*xyz(:,3) + coef(9)*xyz(:,2).*xyz(:,3).^2 + coef(10)*xyz(:,3).^3;
        xyz(:,1)=x_bar;
    end
    
 end
L_pro(i,2)={xyz};
L_pro(i,3)={coef};
L_pro(i,4)=L_src(i,2);
end
end



