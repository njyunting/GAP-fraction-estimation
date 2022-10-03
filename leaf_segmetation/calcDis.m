function [ D ] = calcDis( p,b )
pointSize=size(p,1);
if pointSize==1
    D=abs(b(2)*p(1)+b(3)*p(2)-1*p(3)+b(1))/sqrt(b(2)^2+b(3)^2+1);%计算[x,y,z]到拟合方程的距离
else
    sumD=0;
    for i=1:pointSize
        sumD=sumD+calcDis(p(i,:),b);
    end
    D=sumD/pointSize;
end
end

