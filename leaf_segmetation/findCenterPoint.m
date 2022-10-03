function [ centerPoint ] = findCenterPoint( leaf )

c1=0;c2=0;c3=0;
centerPoint=[];

% 点的数目和x,y,z坐标
pointSize=size(leaf,1);
leaf_x=leaf(:,1);
leaf_y=leaf(:,2);
leaf_z=leaf(:,3);
%遍历每个点
for leafIndex=1:pointSize/1
    leafIndex
    %获取每个点坐标，设为中心点
    x=leaf_x(leafIndex);
    y=leaf_y(leafIndex);
    z=leaf_z(leafIndex);
    
    %阈值
    neipointnum = 4;
%   range=0.025;%含笑

    range=0.02;%樱花  需要修改的参数  0.020; % 宽度的1/4
    range1 = 0.02; % 越大，满足中心点要求的点越多
    %银杏树3 &&橡胶树
%     range=0.03;%樱花  需要修改的参数  0.020; % 宽度的1/4
%     range1 = 0.025; % 越大，满足中心点要求的点越多
    
    %银杏树2
%     range=0.02;%樱花  需要修改的参数  0.020; % 宽度的1/4
%     range1 = 0.015; % 越大，满足中心点要求的点越多
    
    %银杏树1
%     range=0.023;%樱花  需要修改的参数  0.020; % 宽度的1/4
%     range1 = 0.02; % 越大，满足中心点要求的点越多

    % (x,y,z +- range)是以当前点为中心产生的长方体框，
    % r_x12 y12 z12 为列向量 取值为0或1，用于判定每个点是否位于长方体内
    r_x1=leaf_x > (x-range);
    r_x2=leaf_x < (x+range);
    r_y1=leaf_y > (y-range);
    r_y2=leaf_y < (y+range);
    r_z1=leaf_z > (z-range);
    r_z2=leaf_z < (z+range);
    %若某一行对应的 r_x12 y12 z12均为1，则该点位于长方体内
    r=r_x1 & r_x2 & r_y1 & r_y2 & r_z1 & r_z2;
    % 找到所有位于长方体内的点，对应的行
    tempP=find(r>0);
    
    %从后向前遍历位于长方体内的点
    for i=length(tempP):-1:1
        % leaf_xyz(tempP(i)) 对应点坐标
        % 判断中心点与领域各内点的距离，与阈值判断
        if (leaf_x(tempP(i))-x)^2+(leaf_y(tempP(i))-y)^2+(leaf_z(tempP(i))-z)^2 > range^2
            tempP(i)=[]; %距离大于阈值
        end
    end
    
    % 去除不合条件的中心点
    % 第leafIndex为中心点时，长方体内的点的个数
    [leafIndex length(tempP)];
    if length(tempP)<neipointnum %如果满足领域的点数量小于6时，舍去
        continue; %跳到外层循环进行下一次循环
    end
    % 求中心点(x,y,z)的领域点tempP的平均值的距离
    meanPoint=mean(leaf(tempP,:)); 
    D=(meanPoint(1)-x)^2+(meanPoint(2)-y)^2+(meanPoint(3)-z)^2; %求中心点与其领域内点平均值的距离
    if D>(range1/10)^2%0.00000169  阈值判断 中心点与领域点平均点距离小于阈值
        c1=c1+1; % 选取过程中  中心点与领域点平均点   距离过大的中心点数目
        continue;
    end

    %     distance between [x,y,z] to plain
    % 此时输入为，中心点所确定的长方体内 所有点的坐标
    b=point2plain(leaf_x(tempP),leaf_y(tempP),leaf_z(tempP));
    D=calcDis([x,y,z],b); %阈值判断 中心点[x,y,z]与平面距离大于阈值
    if D>range1/4 %0.0032 %range/10
        c2=c2+1; % 选取过程中  中心点与平面距离   距离过大的中心点数目
        continue;
    end
    
    %     mean distance between tempP to plain
    D=calcDis(leaf(tempP,:),b);
    if D>range1/4 %0.00325%range/10 %阈值判断计算[x,y,z]到拟合方程的距离大于阈值 
        c3=c3+1;
        continue;
    end
    centerPoint=[centerPoint;leafIndex];
end

end

