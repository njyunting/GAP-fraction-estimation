function [ DL,cate ] = separateBlades( leaf,centerPoint,category )

pointSize=size(leaf,1);

% x,y,z����Сֵ
minX=min(leaf(:,1));
minY=min(leaf(:,2));
minZ=min(leaf(:,3));
% ��ʽ���������еĵ���ԭ��ƽ����ͬ�ľ���
leafX=formatPoint(leaf(:,1),minX);
leafY=formatPoint(leaf(:,2),minY);
leafZ=formatPoint(leaf(:,3),minZ);

a=zeros(max(leafX),max(leafY),max(leafZ));

cate=zeros(pointSize,1);

meanPoints=[];

for i=1:max(category)/1
    i;
    % Ѱ�ҵ�ǰiֵ������������ͬ���У�������ͬһ�������ĵ�
    points=find(category==i);
    % ���Ҳ����������һ�����
    if size(points,1)==0
        continue;
    end
    % �ҵ�����ͬһ������ĵ���leaf�ж�Ӧ�ľ�����
    centerPoint(points,:);
    % ��leaf���ҵ��������ĵ㣬���������ֵ
    meanPoints=[meanPoints;mean(leaf(centerPoint(points,:),:),1)];
end
% ��ʽ���������еĵ���ԭ��ƽ����ͬ�ľ���
meanPoints(:,1)=formatPoint(meanPoints(:,1),minX);
meanPoints(:,2)=formatPoint(meanPoints(:,2),minY);
meanPoints(:,3)=formatPoint(meanPoints(:,3),minZ);

%meanPoints Ϊÿһ�����ĵ�����ľ�ֵ
% �籾��Ϊ33�࣬meanPoints��33�У�ÿ��ǰ����Ϊ��Ӧ���������ĵ��ƽ������
for i=1:size(meanPoints,1)
    i;
    a(meanPoints(i,1),meanPoints(i,2),meanPoints(i,3))=1;
end
%  D = bwdist(a) D��ʾÿ��Ԫ�����ڵ�λ��������ķ���Ԫ��λ�õ���̾��룻
% �������Ƿ���Ԫ��������

D = bwdist(a);


% DL �е�Ԫ���ǷǸ�������
%       ֵΪ 0 ��Ԫ�ز�����һ�������ķ�ˮ��������Щ���ر���Ϊ����ˮ��Ԫ�ء���
%       ֵΪ 1 ��Ԫ�����ڵ�һ����ˮ������
%       ֵΪ 2 ��Ԫ�����ڵڶ�����ˮ������
%       ֵΪ 3 ��Ԫ�����ڵ�������ˮ������
%       ������
%       �Դ����ơ�

DL = watershed(D);

for i=1:pointSize/1
    i
    t=DL(leafX(i),leafY(i),leafZ(i));
    if t==0
        t=max(max(max(DL(max(1,leafX(i)-1):min(max(leafX),leafX(i)+1),...
                         max(1,leafY(i)-1):min(max(leafY),leafY(i)+1),...
                         max(1,leafZ(i)-1):min(max(leafZ),leafZ(i)+1)...
                         )...
                      )...
                  )...
               );
        i;
    end
    cate(i)=t;
end
end

