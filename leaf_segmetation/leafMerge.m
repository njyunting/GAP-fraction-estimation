clc;
clear;
label = [];
% max = 0;
cutid = 1;
for i=1:7
    % path = ['D:\matlab Project\Dongni Li UPDATE\叶子\part\tree2\tree2_',num2str(i),'\leafcut\'];
    path = ['D:\matlab Project\Dongni Li UPDATE\叶子\part\tree2\tree2_7\leafcut2\'];
    files = dir(strcat(path,'*.txt'));
    for a=1:length(files)   
        leaves =[];
%       leaf = load(['H:\Dongni Li\Leaf\leaf(' num2str(a) ').txt']);
        leaf = load(strcat(path,files(a).name));
%         r1=rand();r2=rand();r3=rand();
%         plot3(leaf(:,1),leaf(:,2),leaf(:,3),'.','Markersize',10,'Color',[r1,r2,r3]);
%         hold on
        r1=rand();r2=rand();r3=rand();
        for j = 1:size(leaf,1)
            leaves(j,1:3)=leaf(j,1:3);
            leaves(j,4:6)=[r1,r2,r3];
        end
        % 保存
        filename=['D:\matlab Project\Dongni Li UPDATE\叶子\part\tree2\tree2_sum\leaf(' num2str(cutid) ') .txt'];
        save(filename,'leaves','-ascii');
        cutid = cutid + 1;
    end
%     max =max + length(files);
end
% hold off
% xlabel x;ylabel y;zlabel z;