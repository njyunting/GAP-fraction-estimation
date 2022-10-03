function [ dstPoint ] = removeNoisePoints( srcPoint )
% dstPoint=srcPoint;

dstPoint(:,1)=formatPoint(srcPoint(:,1),min(srcPoint(:,1)));
dstPoint(:,2)=formatPoint(srcPoint(:,2),min(srcPoint(:,2)));
dstPoint(:,3)=formatPoint(srcPoint(:,3),min(srcPoint(:,3)));

maxY=max(dstPoint(:,2));
maxZ=max(dstPoint(:,3));
temp=(dstPoint(:,1).*maxY+dstPoint(:,2))*maxZ+dstPoint(:,3);
c=zeros(size(temp,1),1);
table= tabulate(temp);
f=find(table(:,2)>2);

for i=1:size(f,1)
    i
   t= temp==f(i);
   c(t)=1;
end
dstPoint=srcPoint(c>0,:);
% for i=1:size(temp,1)
%     i
%     c(i)=length(find(temp==temp(i)));
% end
end

