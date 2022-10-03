clc;
clear;
leaves ={};
label = [];
path = 'C:\Users\27826\Desktop\GIScience & Remote Sensing\matlab\ly\code\tempdata\';
files = dir(strcat(path,'*.txt'));
for a=1:length(files)
    
%   leaf = load(['H:\Dongni Li\Leaf\leaf(' num2str(a) ').txt']);
    leaf = load(strcat(path,files(a).name));
%     r1=leaf(1,4);r2=leaf(1,5);r3=leaf(1,6);
    plot3(leaf(:,1),leaf(:,2),leaf(:,3),'.','Markersize',6,'Color',[rand rand rand]);
    hold on
%     lab = [r1 r1 r3];
   lab = [rand rand rand];
    leaves{a,1}=leaf(:,1:3);
   leaves{a,2}=lab;
end
% zhi = load('D:\matlab Project\Dongni Li UPDATE\毕设\橡胶树4\trunk4.txt');
% plot3(zhi(:,1),zhi(:,2),zhi(:,3),'k.','markersize',6);
xlabel x;ylabel y;zlabel z;
axis equal;
hold off
xlabel x;ylabel y;zlabel z;


% 新加
load fit_leave.mat
    leaves{1,1}=fit_leave(:,1:3);
    lab = [rand rand rand];
   leaves{1,2}=lab;
L_src = leaves;
% end
    %L_src = leaves;
   %leaves_save('./test.txt',L_src);%这里保存的是所有文件的叶子到一个点云里
save L_src.mat L_src;%这里保存了所有叶子的数据供step2整体使用




% url={'./data/XJSNEWleave1.txt','./data/XJSNEWleave2.txt','./data/XJSNEWleave3.txt','./data/XJSNEWleave4.txt','./data/XJSNEWleave5.txt','./data/XJSNEWleave6.txt','./data/XJSNEWleave7.txt','./data/XJSNEWleave8.txt','./data/XJSNEWleave9.txt','./data/XJSNEWleave10.txt','./data/XJSNEWleave11.txt','./data/XJSNEWleave12.txt','./data/XJSNEWleave13.txt','./data/XJSNEWleave14.txt','./data/XJSNEWleave15.txt','./data/XJSNEWleave16.txt','./data/XJSNEWleave17.txt','./data/XJSNEWleave18.txt','./data/XJSNEWleave19.txt','./data/XJSNEWleave20.txt','./data/XJSNEWleave21.txt','./data/XJSNEWleave22.txt','./data/XJSNEWleave23.txt','./data/XJSNEWleave24.txt','./data/XJSNEWleave25.txt','./data/XJSNEWleave26.txt','./data/XJSNEWleave27.txt','./data/XJSNEWleave28.txt','./data/XJSNEWleave29.txt'};
% epsilon=[0.006,0.006,0.008,0.006,0.006,0.006,0.006,0.003,0.006,0.004,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006];%对应一个文件一组参数
% MinPts=[5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5];%对应一个f文件一组参数  


% url={'./data/XJSleaf1.txt','./data/XJSleaf2.txt','./data/XJSleaf3.txt','./data/XJSleaf4.txt','./data/XJSleaf5.txt','./data/XJSleaf6.txt','./data/XJSleaf9.txt','./data/XJSleaf10.txt','./data/XJSleaf11.txt','./data/XJSleaf12.txt','./data/XJSleaf13.txt','./data/XJSleaf14.txt','./data/XJSleaf15.txt','./data/XJSleaf16.txt','./data/XJSleaf17.txt','./data/XJSleaf18.txt','./data/XJSleaf19.txt','./data/XJSleaf20.txt','./data/XJSleaf21.txt','./data/XJSleaf22.txt','./data/XJSleaf23.txt','./data/XJSleaf24.txt','./data/XJSleaf25.txt','./data/XJSleaf26.txt','./data/XJSleaf27.txt','./data/XJSleaf28.txt','./data/XJSleaf29.txt','./data/XJSleaf30.txt','./data/XJSleaf31.txt','./data/XJSleaf32.txt','./data/XJSleaf33.txt','./data/XJSleaf34.txt','./data/XJSleaf35.txt','./data/XJSleaf36.txt','./data/XJSleaf37.txt','./data/XJSleaf38.txt','./data/XJSleaf39.txt','./data/XJSleaf40.txt','./data/XJSleaf41.txt','./data/XJSleaf42.txt','./data/XJSleaf43.txt','./data/XJSleaf44.txt','./data/XJSleaf45.txt','./data/XJSleaf46.txt','./data/XJSleaf47.txt','./data/XJSleaf48.txt','./data/XJSleaf49.txt','./data/XJSleaf50.txt','./data/XJSleaf51.txt','./data/XJSleaf52.txt','./data/XJSleaf53.txt','./data/XJSleaf54.txt','./data/XJSleaf55.txt','./data/XJSleaf56.txt','./data/XJSleaf57.txt','./data/XJSleaf58.txt','./data/XJSleaf59.txt','./data/XJSleaf60.txt','./data/XJSleaf61.txt','./data/XJSleaf62.txt','./data/XJSleaf63.txt','./data/XJSleaf64.txt','./data/XJSleaf65.txt','./data/XJSleaf66.txt','./data/XJSleaf67.txt','./data/XJSleaf68.txt','./data/XJSleaf69.txt','./data/XJSleaf70.txt','./data/XJSleaf71.txt','./data/XJSleaf72.txt','./data/XJSleaf73.txt','./data/XJSleaf74.txt','./data/XJSleaf75.txt','./data/XJSleaf76.txt','./data/XJSleaf77.txt','./data/XJSleaf78.txt','./data/XJSleaf79.txt','./data/XJSleaf80.txt','./data/XJSleaf81.txt','./data/XJSleaf82.txt','./data/XJSleaf83.txt','./data/XJSleaf84.txt','./data/XJSleaf85.txt','./data/XJSleaf86.txt','./data/XJSleaf87.txt','./data/XJSleaf88.txt','./data/XJSleaf89.txt','./data/XJSleaf90.txt','./data/XJSleaf91.txt','./data/XJSleaf92.txt','./data/XJSleaf93.txt','./data/XJSleaf94.txt','./data/XJSleaf95.txt','./data/XJSleaf96.txt','./data/XJSleaf97.txt','./data/XJSleaf98.txt','./data/XJSleaf99.txt','./data/XJSleaf100.txt'};
% epsilon=[0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006];%对应一个文件一组参数
% MinPts=[5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5];%对应一个f文件一组参数  



% url={'./data/XJSleaf1.txt','./data/XJSleaf2.txt','./data/XJSleaf3.txt','./data/XJSleaf4.txt','./data/XJSleaf5.txt','./data/XJSleaf6.txt','./data/XJSleaf9.txt','./data/XJSleaf10.txt','./data/XJSleaf11.txt','./data/XJSleaf12.txt','./data/XJSleaf13.txt','./data/XJSleaf14.txt','./data/XJSleaf15.txt','./data/XJSleaf16.txt','./data/XJSleaf17.txt','./data/XJSleaf18.txt','./data/XJSleaf19.txt','./data/XJSleaf20.txt','./data/XJSleaf21.txt','./data/XJSleaf22.txt','./data/XJSleaf23.txt','./data/XJSleaf24.txt','./data/XJSleaf25.txt','./data/XJSleaf26.txt','./data/XJSleaf27.txt','./data/XJSleaf28.txt','./data/XJSleaf29.txt','./data/XJSleaf30.txt','./data/XJSleaf31.txt','./data/XJSleaf32.txt','./data/XJSleaf33.txt','./data/XJSleaf34.txt','./data/XJSleaf35.txt','./data/XJSleaf36.txt','./data/XJSleaf37.txt','./data/XJSleaf38.txt','./data/XJSleaf39.txt','./data/XJSleaf40.txt','./data/XJSleaf41.txt','./data/XJSleaf42.txt','./data/XJSleaf43.txt','./data/XJSleaf44.txt','./data/XJSleaf45.txt','./data/XJSleaf46.txt','./data/XJSleaf47.txt','./data/XJSleaf48.txt','./data/XJSleaf49.txt','./data/XJSleaf50.txt','./data/XJSleaf51.txt','./data/XJSleaf52.txt','./data/XJSleaf53.txt','./data/XJSleaf54.txt','./data/XJSleaf55.txt','./data/XJSleaf56.txt','./data/XJSleaf57.txt','./data/XJSleaf58.txt','./data/XJSleaf59.txt','./data/XJSleaf60.txt','./data/XJSleaf61.txt','./data/XJSleaf62.txt','./data/XJSleaf63.txt','./data/XJSleaf64.txt','./data/XJSleaf65.txt','./data/XJSleaf66.txt','./data/XJSleaf67.txt','./data/XJSleaf68.txt','./data/XJSleaf69.txt','./data/XJSleaf70.txt','./data/XJSleaf71.txt','./data/XJSleaf72.txt','./data/XJSleaf73.txt','./data/XJSleaf74.txt','./data/XJSleaf75.txt','./data/XJSleaf76.txt','./data/XJSleaf77.txt','./data/XJSleaf78.txt','./data/XJSleaf79.txt','./data/XJSleaf80.txt','./data/XJSleaf81.txt','./data/XJSleaf82.txt','./data/XJSleaf83.txt','./data/XJSleaf84.txt','./data/XJSleaf85.txt','./data/XJSleaf86.txt','./data/XJSleaf87.txt','./data/XJSleaf88.txt','./data/XJSleaf89.txt','./data/XJSleaf90.txt','./data/XJSleaf91.txt','./data/XJSleaf92.txt','./data/XJSleaf93.txt','./data/XJSleaf94.txt','./data/XJSleaf95.txt','./data/XJSleaf96.txt','./data/XJSleaf97.txt','./data/XJSleaf98.txt','./data/XJSleaf99.txt','./data/XJSleaf100.txt'};
% epsilon=[0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01,0.01];%对应一个文件一组参数
% MinPts=[5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5];%对应一个f文件一组参数  



% url={'./data/XJSleafsp1.txt','./data/XJSleafsp2.txt','./data/XJSleafsp3.txt','./data/XJSleafsp4.txt','./data/XJSleafsp5.txt','./data/XJSleafsp6.txt','./data/XJSleafsp7.txt','./data/XJSleafsp8.txt','./data/XJSleafsp9.txt','./data/XJSleafsp10.txt','./data/XJSleafsp11.txt'};
% epsilon=[0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006];%对应一个文件一组参数
% MinPts=[5,5,5,5,5,5,5,5,5,5,5];%对应一个f文件一组参数



% url={'./data/xjs5241.txt','./data/xjs5242.txt','./data/xjs5243.txt','./data/xjs5244.txt','./data/xjs5245.txt','./data/xjs5246.txt','./data/xjs5247.txt','./data/xjs5248.txt','./data/xjs5249.txt','./data/xjs52410.txt','./data/xjs52411.txt','./data/xjs52412.txt','./data/xjs52413.txt','./data/xjs52414.txt','./data/xjs52415.txt','./data/xjs52416.txt','./data/xjs52417.txt','./data/xjs52418.txt','./data/xjs52419.txt','./data/xjs52420.txt','./data/xjs52421.txt','./data/xjs52422.txt','./data/xjs52423.txt','./data/xjs52424.txt','./data/xjs52425.txt','./data/xjs52426.txt','./data/xjs52427.txt','./data/xjs52428.txt','./data/xjs52429.txt','./data/xjs52430.txt','./data/xjs52431.txt'};
% epsilon=[0.002,0.002,0.002,0.002,0.002,0.002,0.002,0.002,0.002,0.002,0.002,0.002,0.002,0.002,0.002,0.002,0.002,0.002,0.002,0.002,0.002,0.002,0.002,0.002,0.002,0.002,0.002,0.002,0.002,0.002,0.002];%对应一个文件一组参数
% MinPts=[5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5];%对应一个f文件一组参数



% url={'./data/XJSXJSleaf1.txt','./data/XJSXJSleaf2.txt','./data/XJSXJSleaf3.txt','./data/XJSXJSleaf4.txt','./data/XJSXJSleaf5.txt','./data/XJSXJSleaf6.txt','./data/XJSXJSleaf7.txt','./data/XJSXJSleaf8.txt','./data/XJSXJSleaf9.txt','./data/XJSXJSleaf10.txt','./data/XJSXJSleaf11.txt','./data/XJSXJSleaf12.txt','./data/XJSXJSleaf13.txt','./data/XJSXJSleaf14.txt','./data/XJSXJSleaf15.txt','./data/XJSXJSleaf16.txt','./data/XJSXJSleaf17.txt','./data/XJSXJSleaf18.txt','./data/XJSXJSleaf19.txt','./data/XJSXJSleaf20.txt','./data/XJSXJSleaf21.txt','./data/XJSXJSleaf22.txt'};
% epsilon=[0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006];%对应一个文件一组参数
% MinPts=[5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5];%对应一个f文件一组参数  

% url={'./data/XJSleaf8.txt','./data/XJSleaf9.txt','./data/XJSleaf10.txt','./data/XJSleaf11.txt','./data/XJSleaf12.txt','./data/XJSleaf13.txt','./data/XJSleaf14.txt','./data/XJSleaf15.txt','./data/XJSleaf16.txt','./data/XJSleaf17.txt','./data/XJSleaf18.txt','./data/XJSleaf19.txt','./data/XJSleaf20.txt','./data/XJSleaf21.txt','./data/XJSleaf22.txt','./data/XJSleaf23.txt','./data/XJSleaf24.txt','./data/XJSleaf25.txt','./data/XJSleaf26.txt','./data/XJSleaf27.txt','./data/XJSleaf28.txt','./data/XJSleaf29.txt','./data/XJSleaf30.txt','./data/XJSleaf31.txt','./data/XJSleaf32.txt','./data/XJSleaf33.txt','./data/XJSleaf34.txt','./data/XJSleaf35.txt','./data/XJSleaf36.txt','./data/XJSleaf37.txt','./data/XJSleaf38.txt','./data/XJSleaf39.txt','./data/XJSleaf40.txt','./data/XJSleaf41.txt','./data/XJSleaf42.txt','./data/XJSleaf43.txt','./data/XJSleaf44.txt','./data/XJSleaf45.txt','./data/XJSleaf46.txt','./data/XJSleaf47.txt','./data/XJSleaf48.txt','./data/XJSleaf49.txt','./data/XJSleaf50.txt','./data/XJSleaf51.txt','./data/XJSleaf52.txt','./data/XJSleaf53.txt','./data/XJSleaf54.txt','./data/XJSleaf55.txt','./data/XJSleaf56.txt','./data/XJSleaf57.txt','./data/XJSleaf58.txt','./data/XJSleaf59.txt','./data/XJSleaf60.txt','./data/XJSleaf61.txt','./data/XJSleaf62.txt','./data/XJSleaf63.txt','./data/XJSleaf64.txt','./data/XJSleaf65.txt','./data/XJSleaf66.txt','./data/XJSleaf67.txt','./data/XJSleaf68.txt','./data/XJSleaf69.txt','./data/XJSleaf70.txt','./data/XJSleaf71.txt','./data/XJSleaf72.txt','./data/XJSleaf73.txt','./data/XJSleaf74.txt','./data/XJSleaf75.txt','./data/XJSleaf76.txt','./data/XJSleaf77.txt','./data/XJSleaf78.txt','./data/XJSleaf79.txt','./data/XJSleaf80.txt','./data/XJSleaf81.txt','./data/XJSleaf82.txt','./data/XJSleaf83.txt','./data/XJSleaf84.txt','./data/XJSleaf85.txt','./data/XJSleaf86.txt','./data/XJSleaf87.txt','./data/XJSleaf88.txt'};
% epsilon=[0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006];%对应一个文件一组参数
% MinPts=[5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,55,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5];%对应一个f文件一组参数  

% url={'yxsleave1_000000.txt','yxsleave1_000001.txt','yxsleave1_000002.txt','yxsleave1_000003.txt','yxsleave1_000004.txt','yxsleave1_000005.txt','yxsleave1_000006.txt','yxsleave1_000007.txt','yxsleave1_000008.txt','yxsleave1_000009.txt','yxsleave1_000010.txt','yxsleave1_000011.txt','yxsleave1_000012.txt','yxsleave1_000013.txt','yxsleave1_000014.txt','yxsleave1_000015.txt','yxsleave1_000016.txt','yxsleave1_000017.txt','yxsleave1_000018.txt','yxsleave1_000019.txt','yxsleave1_000020.txt','yxsleave1_000021.txt','yxsleave1_000022.txt'};
% epsilon=[0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006];%对应一个文件一组参数
% MinPts=[5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5];%对应一个f文件一组参数  


% url={'yxsleavetest1.txt','yxsleavetest2.txt','yxsleavetest3.txt','yxsleavetest4.txt','yxsleavetest5.txt','yxsleavetest6.txt','yxsleavetest7.txt','yxsleavetest8.txt','yxsleavetest9.txt','yxsleavetest10.txt','yxsleavetest11.txt'};
% epsilon=[0.002,0.002,0.002,0.002,0.002,0.002,0.002,0.002,0.002,0.002,0.002];%对应一个文件一组参数
% MinPts=[5,5,5,5,5,5,5,5,5,5,5];%对应一个f文件一组参数  


% url={'./data/XJSleaves1.txt','./data/XJSleaves2.txt','./data/XJSleaves3.txt','./data/XJSleaves4.txt','./data/XJSleaves5.txt','./data/XJSleaves6.txt','./data/XJSleaves7.txt','./data/XJSleaves8.txt','./data/XJSleaves9.txt','./data/XJSleaves10.txt','./data/XJSleaves11.txt','./data/XJSleaves12.txt','./data/XJSleaves13.txt'};
% epsilon=[0.006,0.006,0.008,0.006,0.006,0.006,0.006,0.003,0.006,0.004,0.006,0.006,0.006];%对应一个文件一组参数
% MinPts=[5,5,5,5,5,5,5,5,5,5,5,5,5];%对应一个f文件一组参数  


% 
% url={'./test/test1.txt','./test/test2.txt'};
% epsilon=[0.001,0.001];%对应一个文件一组参数
% MinPts=[5,5];%对应一个f文件一组参数


% url={'./yxs/leaf1.txt','./yxs/leaf2.txt'};
% epsilon=[0.01,0.01];%对应一个文件一组参数
% MinPts=[10,5];%对应一个f文件一组参数



% url={'./xjs/1.txt'};
% epsilon=0.006;%对应一个文件一组参数
% MinPts=25;%对应一个f文件一组参数

% url={'./xjs/2.txt'};
% epsilon=0.005;%对应一个文件一组参数
% MinPts=10;%对应一个f文件一组参数

% url={'./xjs/3.txt'};
% epsilon=0.006;%对应一个文件一组参数
% MinPts=30;%对应一个f文件一组参数

% url={'./xjs/4.txt'};
% epsilon=0.01;%对应一个文件一组参数
% MinPts=30;%对应一个f文件一组参数



% url={'./xjs/5.txt'};
% epsilon=0.006;%对应一个文件一组参数
% MinPts=20;%对应一个f文件一组参数


% url={'./xjs/7.txt'};
% epsilon=0.01;%对应一个文件一组参数
% MinPts=20;%对应一个f文件一组参数


% url={'./xjs/6.txt'};
% epsilon=0.01;%对应一个文件一组参数
% MinPts=30;%对应一个f文件一组参数

% url={'./xjs/3.txt','./xjs/1.txt'};
% epsilon=[0.006,0.006];%对应一个文件一组参数
% MinPts=[30,25];%对应一个f文件一组参数

% 
% url={'./拟合/Michelialeaf1.txt'};
% epsilon=0.005;%对应一个文件一组参数
% MinPts=10;%对应一个f文件一组参数

% 
% url={'./拟合/Michelialeaf2.txt'};
% epsilon=0.005;%对应一个文件一组参数
% MinPts=10;%对应一个f文件一组参数


% url={'./拟合/Michelialeaf3.txt'};
% epsilon=0.005;%对应一个文件一组参数
% MinPts=10;%对应一个f文件一组参数



% url={'./yxs/1.txt'};
% epsilon=0.001;%对应一个文件一组参数
% MinPts=15;%对应一个f文件一组参数

% url={'./yxs/2.txt'};
% epsilon=0.001;%对应一个文件一组参数
% MinPts=10;%对应一个f文件一组参数

% url={'./yxs/3.txt'};
% epsilon=0.001;%对应一个文件一组参数
% MinPts=10;%对应一个f文件一组参数

% url={'./yxs/4.txt'};
% epsilon=0.001;%对应一个文件一组参数
% MinPts=10;%对应一个f文件一组参数

% url={'./yxs/5.txt','./yxs/1.txt'};
% epsilon=[0.001,0.001];%对应一个文件一组参数
% MinPts=[10,10];%对应一个f文件一组参数
% 
% url={'./yxs/6.txt'};
% epsilon=0.001;%对应一个文件一组参数
% MinPts=10;%对应一个f文件一组参数

% url={'./yxs/7.txt'};
% epsilon=0.001;%对应一个文件一组参数
% MinPts=10;%对应一个f文件一组参数

% url={'./yxs/hz1.txt'};
% epsilon=0.001;%对应一个文件一组参数
% MinPts=10;%对应一个f文件一组参数

% url={'./yxs/hz2.txt'};
% epsilon=0.001;%对应一个文件一组参数
% MinPts=10;%对应一个f文件一组参数

% url={'./yxs/hz3.txt'};
% epsilon=0.001;%对应一个文件一组参数
% MinPts=10;%对应一个f文件一组参数

% url={'./yxs/hz4.txt'};
% epsilon=0.001;%对应一个文件一组参数
% MinPts=10;%对应一个f文件一组参数

% url={'./yxs/hz5.txt'};
% epsilon=0.001;%对应一个文件一组参数
% MinPts=10;%对应一个f文件一组参数

% url={'ziweileaf2.txt'};
% epsilon=0.01;%对应一个文件一组参数
% MinPts=10;%对应一个f文件一组参数

% url={'./data/yxsleaf1.txt','./data/yxsleaf2.txt','./data/yxsleaf3.txt','./data/yxsleaf4.txt','./data/yxsleaf5.txt','./data/yxsleaf6.txt','./data/yxsleaf7.txt','./data/yxsleaf8.txt','./data/yxsleaf9.txt','./data/yxsleaf10.txt','./data/yxsleaf11.txt','./data/yxsleaf12.txt','./data/yxsleaf13.txt','./data/yxsleaf14.txt','./data/yxsleaf15.txt','./data/yxsleaf16.txt','./data/yxsleaf17.txt','./data/yxsleaf18.txt','./data/yxsleaf19.txt','./data/yxsleaf20.txt','./data/yxsleaf21.txt','./data/yxsleaf22.txt','./data/yxsleaf23.txt','./data/yxsleaf24.txt','./data/yxsleaf25.txt','./data/yxsleaf26.txt','./data/yxsleaf27.txt','./data/yxsleaf28.txt','./data/yxsleaf29.txt','./data/yxsleaf30.txt','./data/yxsleaf31.txt','./data/yxsleaf32.txt','./data/yxsleaf33.txt','./data/yxsleaf34.txt','./data/yxsleaf35.txt','./data/yxsleaf36.txt','./data/yxsleaf37.txt','./data/yxsleaf38.txt','./data/yxsleaf39.txt','./data/yxsleaf40.txt','./data/yxsleaf41.txt','./data/yxsleaf42.txt','./data/yxsleaf43.txt','./data/yxsleaf44.txt','./data/yxsleaf45.txt','./data/yxsleaf46.txt','./data/yxsleaf47.txt','./data/yxsleaf48.txt','./data/yxsleaf49.txt','./data/yxsleaf50.txt','./data/yxsleaf51.txt','./data/yxsleaf52.txt','./data/yxsleaf53.txt','./data/yxsleaf54.txt','./data/yxsleaf55.txt','./data/yxsleaf56.txt','./data/yxsleaf57.txt','./data/yxsleaf58.txt','./data/yxsleaf59.txt'};
% epsilon=[0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001];%对应一个文件一组参数
% MinPts=[5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5];%对应一个f文件一组参数  

% url={'./data/sakuraleaf1.txt','./data/sakuraleaf2.txt','./data/sakuraleaf3.txt','./data/sakuraleaf4.txt','./data/sakuraleaf5.txt','./data/sakuraleaf6.txt','./data/sakuraleaf7.txt','./data/sakuraleaf8.txt','./data/sakuraleaf9.txt','./data/sakuraleaf10.txt','./data/sakuraleaf11.txt'};
% epsilon=[0.005,0.005,0.005,0.005,0.005,0.005,0.005,0.005,0.005,0.005,0.005];%对应一个文件一组参数
% MinPts=[5,5,5,5,5,5,5,5,5,5,5];%对应一个f文件一组参数
 
%  url={'./data/ziweileaf1.txt','./data/ziweileaf2.txt','./data/ziweileaf3.txt','./data/ziweileaf4.txt'};
%  epsilon=[0.009,0.015,0.015,0.015];%对应一个文件一组参数
%  MinPts=[5,5,8,8];%对应一个f文件一组参数
 
% url={'./yxs/leaf.txt','./yxs/leaf2.txt'};
%  epsilon=[0.005,0.01];%对应一个文件一组参数
%  MinPts=[5,10];%对应一个f文件一组参数

%  url={'./data/ziweileaf3.txt'};
%  epsilon=0.015;%对应一个文件一组参数
%  MinPts=8;%对应一个f文件一组参数
 
%  url={'./data/Michelialeaf1.txt','./data/Michelialeaf2.txt','./data/Michelialeaf3.txt','./data/Michelialeaf4.txt','./data/Michelialeaf5.txt','./data/Michelialeaf6.txt'};
%  epsilon=[0.01,0.01,0.007,0.015,0.011,0.01];%对应一个文件一组参数
%  MinPts=[5,5,5,5,5,3];%对应一个f文件一组参数

%  url={'./data/Michelialeaf2.txt','./data/Michelialeaf5.txt'};
%  epsilon=[0.01,0.011];%对应一个文件一组参数
%  MinPts=[5,5];%对应一个f文件一组参数

% url={'./yxs/leaf1.txt','./yxs/leaf2.txt'};
% epsilon=[0.0007,0.0008];%对应一个文件一组参数
% MinPts=[3,3];%对应一个f文件一组参数


% url={'./yxs1/1.txt','./yxs1/2.txt','./yxs1/3.txt','./yxs1/4.txt','./yxs1/5.txt','./yxs1/6.txt','./yxs1/7.txt','./yxs1/8.txt','./yxs1/9.txt','./yxs1/10.txt','./yxs1/11.txt','./yxs1/12.txt','./yxs1/13.txt','./yxs1/14.txt','./yxs1/15.txt'};
% epsilon=[0.0009,0.0007,0.0007,0.0007,0.0007,0.0008,0.0008,0.0008,0.0008,0.0008,0.0008,0.0008,0.0008,0.0008,0.0008];%对应一个文件一组参数
% MinPts=[4,4,4,4,4,4,4,4,4,4,4,4,4,4,4];%对应一个f文件一组参数

% 
% url={'./yxs2/1.txt','./yxs2/2.txt','./yxs2/3.txt','./yxs2/4.txt','./yxs2/6.txt','./yxs2/7.txt','./yxs2/8.txt','./yxs2/9.txt','./yxs2/10.txt','./yxs2/11.txt','./yxs2/12.txt','./yxs2/13.txt','./yxs2/14.txt','./yxs2/15.txt','./yxs2/16.txt','./yxs2/17.txt','./yxs2/19.txt','./yxs2/20.txt'};
% epsilon=[0.0009,0.0007,0.0007,0.0007,0.0008,0.0008,0.0008,0.0008,0.0008,0.0008,0.0008,0.0008,0.0008,0.0008,0.0008,0.0008,0.0008,0.0008];%对应一个文件一组参数
% MinPts=[4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4];%对应一个f文件一组参数


%11111
% url={'./yxs2/test2.txt'};
% epsilon=[0.001];%对应一个文件一组参数
% MinPts=[4];%对应一个f文件一组参数

%222
% url={'./yxs1/test.txt'};
% epsilon=[0.001];%对应一个文件一组参数
% MinPts=[4];%对应一个f文件一组参数


% url={'./yxs3/test.txt'};
% epsilon=[0.001];%对应一个文件一组参数
% MinPts=[4];%对应一个f文件一组参数

% url={'./yxs3/test1.txt'};
% epsilon=[0.001];%对应一个文件一组参数
% MinPts=[4];%对应一个f文件一组参数

% url={'./yxs4/test.txt'};
% epsilon=[0.001];%对应一个文件一组参数
% MinPts=[4];%对应一个f文件一组参数

% url={'./yxs5/test.txt'};
% epsilon=[0.001];%对应一个文件一组参数
% MinPts=[4];%对应一个f文件一组参数



% url={'./yxs7/test.txt'};
% epsilon=[0.0009];%对应一个文件一组参数
% MinPts=[5];%对应一个f文件一组参数


%======
% url={'./团1/test3.txt'};
% epsilon=[0.0009];%对应一个文件一组参数
% MinPts=[5];%对应一个f文件一组参数






% url={'./团4/test8.txt'};
% epsilon=[0.0006];%对应一个文件一组参数
% MinPts=[5];%对应一个f文件一组参数





% url={'./yxs/leaf.txt'};
% epsilon=[0.005];%对应一个文件一组参数
% MinPts=[5];%对应一个f文件一组参数

% ====



% url={'./橡胶树1/test1.txt','./橡胶树1/test2.txt','./橡胶树1/test3.txt'};
% epsilon=[0.003,0.003,0.003];%对应一个文件一组参数
% MinPts=[5,5,5];%对应一个f文件一组参数

% ========
% url={'./橡胶树1/test4.txt'};
% epsilon=[0.003];%对应一个文件一组参数
% MinPts=[6];%对应一个f文件一组参数

% 
% url={'./橡胶树2/rubber part2.txt'};
% epsilon=[0.005];%对应一个文件一组参数
% MinPts=[5];%对应一个f文件一组参数
% 
% 
% ===========
% L_src=[];
% num=numel(url);
% 
% for index=1:num
%    
%     leave=[];
%     leave=load(cell2mat(url(index)));
%     leaves=leave(:,1:3);
%     X=zeros(size(leaves));
%     for i = 1:size(leaves,2)
%             std_v=std(leaves(:, i));
%             mean_v=mean(leaves(:, i));
%             X(:,i)=(leaves(:, i)-std_v)/mean_v;
%     end
% 
% %     epsilon=0.005;
% %     MinPts=10;
%     
%     [IDX, isnoise]=DBSCAN(X,epsilon(index),MinPts(index));
%     [ L_src_temp ] = leaves_divide( IDX,leaves );
%     L_src=[L_src;L_src_temp];
% 
% %     L_src=[L_src;{leaves,[0,1,0]}];
%      
%     display(['cluster for ',cell2mat(url(index)),' has ',num2str(size(L_src,1)),' leaves.']);
%     
% end
% leaves_save('./test.txt',L_src);%这里保存的是所有文件的叶子到一个点云里
% save L_src.mat L_src;%这里保存了所有叶子的数据供step2整体使用