function [ b ] = point2plain( x,y,z )
size=length(x);

X = [ones(size,1) x y]; 
% ��Ԫ���Իع� Ҫ������г�����ؾࣩ��ģ�͵�ϵ������ֵ�����ھ��� X �а���һ���� 1 ���ɵ��С�
b = regress(z,X);
b=b';
%Ax+By+Cz+D=0 ,b1=D, b2=A ,b3=B ת����z=D+Ax+By 
end

