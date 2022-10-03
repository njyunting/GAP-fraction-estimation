clear;
clc;
 delete '.\leaf_cutAgain\*.txt';
 path = 'C:\Users\27826\Desktop\GIScience & Remote Sensing\matlab\ly\code\tempdata\';
 files = dir(strcat(path,'*.txt'));
for leafid = 1:size(files,1)
    leafid
    leaf = load(['.\tempdata\leaf(' num2str(leafid) ').txt']);
%     leaf = load(['D:\matlab Project\Dongni Li UPDATE\Leaf\leaf(5).txt']);
    p = leaf(:,1:3);

    flag = zeros(length(p),1);      %������
    clsnum = 0;                     %��ĸ���
    disnear = 0.015;                 %����뾶
    numberofpointlimitation=4;      %���ڶ��ٸ������ȥ
    for i=1:size(p,1)   
        nxtp = p(i,:);      %��ʼ����뾶�ڵ���������
        if flag(i)==0
            clsnum = clsnum+1;
            pcstart = 1;            %���ö�����ʼָ��
            preflag = flag;         %�����Ǹ���
            while pcstart<=size(nxtp,1)         %�ж��Ƿ���ɶ��б���
                curp = nxtp(pcstart,:);         %�õ���ǰҪ����ĵ�
                pcstart = pcstart+1;            %����ָ�����
                diffp = p-curp;                 %����ֱ�Ӻ��������ݱȽ��ˣ����������ʱ����Կ���kdtree
                dis = sqrt(diffp(:,1).*diffp(:,1)+diffp(:,2).*diffp(:,2)+diffp(:,3).*diffp(:,3));      %�жϵ�ǰ�������е�֮��ľ���        

                ind = dis<disnear;                  %�õ�����С����ֵ������
                flag(ind) = clsnum;                 %���õ�ǰ������
            
                diff_flag = preflag-flag;   
                diff_ind = (preflag-flag)<0;        %�жϱ���ѭ������ϴ�ѭ�����ӵĵ�
            
                tmp = zeros(length(p),1);
                tmp(diff_ind) = clsnum;
                flag = flag + tmp;                  %���ӵĵ㽫����Ϊһ��
                preflag = flag;                 %�����Ǹ���
                nxtp = [nxtp;p(diff_ind,:)];    %���Ӿ���뾶�ڵ���������
            end       
        end    
    end

%     for i = 1:clsnum
%         r1=rand();r2=rand();r3=rand();
%         plot3(p(flag==i,1),p(flag==i,2),p(flag==i,3),'.','Markersize',30,'Color',[r1,r2,r3]);
%         hold on
%     end
%     hold off;

    for j = 1:max(flag)
        point_num=find(flag == j);
        if size(point_num,1)<numberofpointlimitation
            flag(point_num)=0;
        end
    end

%     figure;
%     for i = 1:max(flag)
%         r1=rand();r2=rand();r3=rand();
%         plot3(p(flag==i,1),p(flag==i,2),p(flag==i,3),'.','Markersize',30,'Color',[r1,r2,r3]);
%         hold on
%     end
    
    cutid = 1; % �иȥ��<6������õ���Ҷ�����
    for i = 1:max(flag)
        bb=leaf(flag == i,:); % ���Ϊi������
        if isempty(bb) % �������Ϊ�գ�������
            continue;
        end
        % ����
        filename=['.\leaf_cutAgain\leaf(' num2str(leafid) ')_' num2str(cutid) '.txt'];
        save(filename,'bb','-ascii');
        cutid = cutid + 1;
    end
    
end