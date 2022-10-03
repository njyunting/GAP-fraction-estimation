function [ leaf ] = proj2plain( leaf, b )  
% Ax+By+Cz+D=0
leaf;
A=b(2);
B=b(3);
C=-1;
D=b(1);

size=length(leaf);
for i=1:size
    t=-(A*leaf(i,1)+B*leaf(i,2)+C*leaf(i,3)+D)/(A*A+B*B+C*C);
    leaf(i,1)=leaf(i,1)+A*t;
    leaf(i,2)=leaf(i,2)+B*t;
    leaf(i,3)=leaf(i,3)+C*t;
end
end

