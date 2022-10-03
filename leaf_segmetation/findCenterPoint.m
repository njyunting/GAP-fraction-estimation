function [ centerPoint ] = findCenterPoint( leaf )

c1=0;c2=0;c3=0;
centerPoint=[];

% �����Ŀ��x,y,z����
pointSize=size(leaf,1);
leaf_x=leaf(:,1);
leaf_y=leaf(:,2);
leaf_z=leaf(:,3);
%����ÿ����
for leafIndex=1:pointSize/1
    leafIndex
    %��ȡÿ�������꣬��Ϊ���ĵ�
    x=leaf_x(leafIndex);
    y=leaf_y(leafIndex);
    z=leaf_z(leafIndex);
    
    %��ֵ
    neipointnum = 4;
%   range=0.025;%��Ц

    range=0.02;%ӣ��  ��Ҫ�޸ĵĲ���  0.020; % ��ȵ�1/4
    range1 = 0.02; % Խ���������ĵ�Ҫ��ĵ�Խ��
    %������3 &&����
%     range=0.03;%ӣ��  ��Ҫ�޸ĵĲ���  0.020; % ��ȵ�1/4
%     range1 = 0.025; % Խ���������ĵ�Ҫ��ĵ�Խ��
    
    %������2
%     range=0.02;%ӣ��  ��Ҫ�޸ĵĲ���  0.020; % ��ȵ�1/4
%     range1 = 0.015; % Խ���������ĵ�Ҫ��ĵ�Խ��
    
    %������1
%     range=0.023;%ӣ��  ��Ҫ�޸ĵĲ���  0.020; % ��ȵ�1/4
%     range1 = 0.02; % Խ���������ĵ�Ҫ��ĵ�Խ��

    % (x,y,z +- range)���Ե�ǰ��Ϊ���Ĳ����ĳ������
    % r_x12 y12 z12 Ϊ������ ȡֵΪ0��1�������ж�ÿ�����Ƿ�λ�ڳ�������
    r_x1=leaf_x > (x-range);
    r_x2=leaf_x < (x+range);
    r_y1=leaf_y > (y-range);
    r_y2=leaf_y < (y+range);
    r_z1=leaf_z > (z-range);
    r_z2=leaf_z < (z+range);
    %��ĳһ�ж�Ӧ�� r_x12 y12 z12��Ϊ1����õ�λ�ڳ�������
    r=r_x1 & r_x2 & r_y1 & r_y2 & r_z1 & r_z2;
    % �ҵ�����λ�ڳ������ڵĵ㣬��Ӧ����
    tempP=find(r>0);
    
    %�Ӻ���ǰ����λ�ڳ������ڵĵ�
    for i=length(tempP):-1:1
        % leaf_xyz(tempP(i)) ��Ӧ������
        % �ж����ĵ���������ڵ�ľ��룬����ֵ�ж�
        if (leaf_x(tempP(i))-x)^2+(leaf_y(tempP(i))-y)^2+(leaf_z(tempP(i))-z)^2 > range^2
            tempP(i)=[]; %���������ֵ
        end
    end
    
    % ȥ���������������ĵ�
    % ��leafIndexΪ���ĵ�ʱ���������ڵĵ�ĸ���
    [leafIndex length(tempP)];
    if length(tempP)<neipointnum %�����������ĵ�����С��6ʱ����ȥ
        continue; %�������ѭ��������һ��ѭ��
    end
    % �����ĵ�(x,y,z)�������tempP��ƽ��ֵ�ľ���
    meanPoint=mean(leaf(tempP,:)); 
    D=(meanPoint(1)-x)^2+(meanPoint(2)-y)^2+(meanPoint(3)-z)^2; %�����ĵ����������ڵ�ƽ��ֵ�ľ���
    if D>(range1/10)^2%0.00000169  ��ֵ�ж� ���ĵ��������ƽ�������С����ֵ
        c1=c1+1; % ѡȡ������  ���ĵ��������ƽ����   �����������ĵ���Ŀ
        continue;
    end

    %     distance between [x,y,z] to plain
    % ��ʱ����Ϊ�����ĵ���ȷ���ĳ������� ���е������
    b=point2plain(leaf_x(tempP),leaf_y(tempP),leaf_z(tempP));
    D=calcDis([x,y,z],b); %��ֵ�ж� ���ĵ�[x,y,z]��ƽ����������ֵ
    if D>range1/4 %0.0032 %range/10
        c2=c2+1; % ѡȡ������  ���ĵ���ƽ�����   �����������ĵ���Ŀ
        continue;
    end
    
    %     mean distance between tempP to plain
    D=calcDis(leaf(tempP,:),b);
    if D>range1/4 %0.00325%range/10 %��ֵ�жϼ���[x,y,z]����Ϸ��̵ľ��������ֵ 
        c3=c3+1;
        continue;
    end
    centerPoint=[centerPoint;leafIndex];
end

end

