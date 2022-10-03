 path = 'D:\matlab Project\Dongni Li UPDATE\leaf_cutAgain\';
 files = dir(strcat(path,'*.txt'));
 for a=1:length(files)
     leaf = load(strcat(path,files(a).name));
     r1=rand();r2=rand();r3=rand();
     leaf(:,4)=r1;
     leaf(:,5)=r2;
     leaf(:,6)=r3;
     save(strcat(path,files(a).name),'leaf','-ascii');
 end