clc;
clear;
merge = [];
for i=1:13
    % path = ['D:\matlab Project\Dongni Li UPDATE\Ҷ��\part5\part5 (',num2str(i),')\leaf_cutAgain\'];
    % path = ['D:\matlab Project\Dongni Li UPDATE\leaf_cutAgain\'];
    path = ['D:\matlab Project\Dongni Li UPDATE\Ҷ��\10.21�����Ŵ�\part1\leaf_cutAgain\'];
    files = dir(strcat(path,'*.txt'));
    for a=1:length(files)   
        leaves =[];
        leaf = load(strcat(path,files(a).name));
        r1=rand();r2=rand();r3=rand();
        for j = 1:size(leaf,1)
            leaves(j,1:3)=leaf(j,1:3);
            leaves(j,4:6)=[r1,r2,r3];
        end
        strcat(path,files(a).name)
        merge = [merge;leaves];
    end
% end
merge;
filename=['D:\matlab Project\Dongni Li UPDATE\Ҷ��\part5\�ܼ���\partial1-4Ҷ�Ӻϲ�.txt'];
save(filename,'merge','-ascii');