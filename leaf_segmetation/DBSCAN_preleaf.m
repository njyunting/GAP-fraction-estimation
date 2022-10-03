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

    flag = zeros(length(p),1);      %聚类标记
    clsnum = 0;                     %类的个数
    disnear = 0.015;                 %聚类半径
    numberofpointlimitation=4;      %少于多少个点就舍去
    for i=1:size(p,1)   
        nxtp = p(i,:);      %初始聚类半径内的邻域点队列
        if flag(i)==0
            clsnum = clsnum+1;
            pcstart = 1;            %设置队列起始指针
            preflag = flag;         %聚类标记更新
            while pcstart<=size(nxtp,1)         %判断是否完成队列遍历
                curp = nxtp(pcstart,:);         %得到当前要处理的点
                pcstart = pcstart+1;            %队列指针更新
                diffp = p-curp;                 %这里直接和所有数据比较了，数据量大的时候可以考虑kdtree
                dis = sqrt(diffp(:,1).*diffp(:,1)+diffp(:,2).*diffp(:,2)+diffp(:,3).*diffp(:,3));      %判断当前点与所有点之间的距离        

                ind = dis<disnear;                  %得到距离小于阈值的索引
                flag(ind) = clsnum;                 %设置当前聚类标记
            
                diff_flag = preflag-flag;   
                diff_ind = (preflag-flag)<0;        %判断本次循环相比上次循环增加的点
            
                tmp = zeros(length(p),1);
                tmp(diff_ind) = clsnum;
                flag = flag + tmp;                  %增加的点将其标记为一类
                preflag = flag;                 %聚类标记更新
                nxtp = [nxtp;p(diff_ind,:)];    %增加聚类半径内的邻域点队列
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
    
    cutid = 1; % 切割并去除<6的类别后得到的叶子序号
    for i = 1:max(flag)
        bb=leaf(flag == i,:); % 类别为i的坐标
        if isempty(bb) % 若此类别为空，则跳过
            continue;
        end
        % 保存
        filename=['.\leaf_cutAgain\leaf(' num2str(leafid) ')_' num2str(cutid) '.txt'];
        save(filename,'bb','-ascii');
        cutid = cutid + 1;
    end
    
end