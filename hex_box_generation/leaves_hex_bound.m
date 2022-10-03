function L_pro_with_hexbox=leaves_hex_bound(L_pro)
num=size(L_pro,1);
L_pro_with_hexbox=cell(num,5);
pts=zeros(12,3,num);
for i=1:num
    xyz=cell2mat(L_pro(i,2));%%%%%��Ϊ���֮ǰ�ĵ� xyz=cell2mat(L_pro(i,2));
    if size(xyz,1)>1
       pts(:,:,i)=find_hex_box(xyz);
    else
        pts(:,:,i)=zeros(12,3);
    end
    i
end

L_pro_with_hexbox(:,1:4)=L_pro(:,1:4);
for i=1:num
L_pro_with_hexbox(i,5)={pts(:,:,i)};
end

end

function pts=find_hex_box(xyz)

%�����еĵ㿴��һ�����壬������ת���ҵ���ĳ���᷽����С����ת��������������ת�����ӽ��¡�
%Ŀ���ǽ���С��Χ��ƽ����xyz����м��㣨�����Ƚϼ�㣩��
%����õ��Ĳ����ٷ�����ת�ص�ԭ��������ϵ
x=1:pi/30:pi;%��x����ת����ɢ����
y=1:pi/30:pi;%��y����ת����ɢ����
z=1:pi/30:pi;%��z����ת����ɢ����
R_F=[];
error=1e32;
pos=0;
%�ڲ�ͬ����ת�£���¼��ת�����ݶ�x,y,z��ķ������ԽС��˵�����������ϵ������Խ��������Χ����С
for i=1:numel(x)
    for j=1:numel(y)
        for k=1:numel(z)
            thetax=x(i);
            thetay=y(j);
            thetaz=z(k);
            A=[1,0,0;0,cos(thetax),sin(thetax);0,-sin(thetax),cos(thetax)];
            B=[cos(thetay),0,-sin(thetay);0,1,0;sin(thetay),0,cos(thetay)];
            C=[cos(thetaz),sin(thetaz),0;-sin(thetaz),cos(thetaz),0;0,0,1];
            R=A*B*C;
            res=R*xyz';
            [e,p]=min([std(res(1,:));std(res(2,:));std(res(3,:))]);
            if e<error
                error=e;
                R_F=R;
                pos=p;
            end 
        end
    end
end
%R_F�������ŵ���ת������pos˵������洦��x,y,z�ĸ���
%������ת����
res_f=R_F*xyz';
%���  
temp = res_f';
fit_points = temp;
%  [fit_points] = fit_surface(temp);
%���������ΰ�Χ��
pts=hex_box(fit_points',pos);
%������ת�����ε�λ��Ϣ
pts=(inv(R_F)*pts')';
end

function pts=hex_box(res_f,pos)
%����˼����ǰ��ı��ε�ÿ���Ƕ������һ�����Ŀ����г���������
%Ȼ��ѡ��������������г�
xy=res_f;
xy(pos,:)=[];

x_min=min(xy(1,:));
y_min=min(xy(2,:));
x_max=max(xy(1,:));
y_max=max(xy(2,:));

xd=x_min:(x_max-x_min)/100:x_max;
yd=y_min:(y_max-y_min)/100:y_max;
xd(1)=[];
xd(end)=[];
yd(1)=[];
yd(end)=[];

opt_area=zeros(4,1);
x1=zeros(4,1);
x2=zeros(4,1);
y1=zeros(4,1);
y2=zeros(4,1);
[opt_area(1),x1(1),y1(1),x2(1),y2(1)]=margin_cut(xy,x_min,y_min,xd,yd,1,1);
[opt_area(2),x1(2),y1(2),x2(2),y2(2)]=margin_cut(xy,x_max,y_min,xd,yd,1,-1);
[opt_area(3),x1(3),y1(3),x2(3),y2(3)]=margin_cut(xy,x_max,y_max,xd,yd,-1,1);
[opt_area(4),x1(4),y1(4),x2(4),y2(4)]=margin_cut(xy,x_min,y_max,xd,yd,-1,-1);

final=[[1:4]',opt_area,x1,y1,x2,y2];
final=sortrows(final,2);
x1=final(:,3);
y1=final(:,4);
x2=final(:,5);
y2=final(:,6);


xyall=[x_min,y_min;
           x_max,y_min;
           x_max,y_max;
           x_min,y_max];
xyall2=[];
count=1;
for i=1:4
    if i==final(3,1)
        xyall2(count,:)=[x1(3),y1(3)];
        count=count+1;
        xyall2(count,:)=[x2(3),y2(3)];
        count=count+1;
    elseif i==final(4,1)
        xyall2(count,:)=[x1(4),y1(4)];
        count=count+1;
        xyall2(count,:)=[x2(4),y2(4)];
        count=count+1;
      else
            xyall2(count,:)=xyall(i,:);
        count=count+1;      
    end
    
end

n_min=repmat(min(res_f(pos,:)),[6,1]);
n_max=repmat(max(res_f(pos,:)),[6,1]);
if (n_max-n_min)<3
    
end
if pos==1
pts=[n_min,xyall2;n_max,xyall2];
elseif pos==2
pts=[xyall2(:,1),n_min,xyall2(:,2);xyall2(:,1),n_max,xyall2(:,2)];
else
pts=[xyall2,n_min;xyall2,n_max];
end

end
