function [ dstPoints ] = formatPoint( srcPoints, minPoint )
dstPoints=srcPoints(:,1);
dstPoints=dstPoints-minPoint+0.001;
dstPoints=ceil(dstPoints*50);%��Ц
% dstPoints=ceil(dstPoints*300);%ӣ��
end

