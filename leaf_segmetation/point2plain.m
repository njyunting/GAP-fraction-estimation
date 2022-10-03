function [ b ] = point2plain( x,y,z )
size=length(x);

X = [ones(size,1) x y]; 
% 多元线性回归 要计算具有常数项（截距）的模型的系数估计值，请在矩阵 X 中包含一个由 1 构成的列。
b = regress(z,X);
b=b';
%Ax+By+Cz+D=0 ,b1=D, b2=A ,b3=B 转换成z=D+Ax+By 
end

