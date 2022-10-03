function [opt_area,x1,y1,x2,y2]=margin_cut(xy,x0,y0,xd,yd,flag,order)
%(xy,x_min,y_min,xd,yd,1,1)

% xd=x_min:(x_max-x_min)/100:x_max;
% yd=y_min:(y_max-y_min)/100:y_max;
%�����������ھ���boundingbox����ȥһ���ǣ�Ҫ���е��Ľ��ﲻ������λ��Ϣ��������
%�ڳ����ϲ�����ͬ�ĵ㣬���ֱ�������Σ�Ȼ���������Ͳ�ѯ��λ��Ϣ

%��ɢ������
[xidx,yidx]=meshgrid(xd,yd);
xidx=reshape(xidx,[numel(xidx),1]);
yidx=reshape(yidx,[numel(yidx),1]);

pairs=[repmat(x0,[numel(xidx),1]),yidx,xidx,repmat(y0,[numel(yidx),1])];

%����ÿ�������ε�б��ֱ�ߺ����������
area=abs(pairs(:,1)-pairs(:,3)).*abs(pairs(:,2)-pairs(:,4));
k=(pairs(:,4)-pairs(:,2))./(pairs(:,3)-pairs(:,1));
b=pairs(:,4)-k.*pairs(:,3); 

x=repmat(xy(1,:),[numel(k),1]);
y=repmat(xy(2,:),[numel(k),1]);

K=repmat(k,[1,size(x,2)]);
B=repmat(b,[1,size(x,2)]);

%��ѯ��λ�Ƿ����������ڲ�
det=K.*x+B-y;

det(find(det>0))=1;
det(find(det<0))=0;
if flag<0
    det=1-det;
end

%���в�������λ��Ϣ��������
stats=sum(det,2);
index=find(stats==0);
if isempty(index)
opt_area=-1;
x1=0;
y1=0;
x2=0;
y2=0;
return;
end

%Ѱ��������
[v,p]=max(area(index));

k1=k(index(p));
b1=b(index(p));


%������
if order>0
x1=x0;
y1=pairs(index(p),2);

x2=pairs(index(p),3);
y2=y0;
else
    x2=x0;
y2=pairs(index(p),2);

x1=pairs(index(p),3);
y1=y0;
end

opt_area=area(index(p));
% 
% xs=pairs(index(p),1):(pairs(index(p),3)-pairs(index(p),1))/1000:pairs(index(p),3);
% ys=k1*xs+b1;
% 
% plot(xs,ys,'.');
% hold on;


end