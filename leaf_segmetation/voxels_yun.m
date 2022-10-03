clc;
clear;
close all;
jilu0=load('../data/Michelia leaf.txt');

jilu0=jilu0*20;

xmin=min(jilu0(:,1));    %找到X最小值
xmax=max(jilu0(:,1));  %找到X最大值
ymin=min(jilu0(:,2));    %找到Y最小值
ymax=max(jilu0(:,2));  %找到Y最大值
zmin=min(jilu0(:,3));    %找到Z最小值
zmax=max(jilu0(:,3));  %找到Z最大值

width=1; f=1; bb2=zeros(1,1,1);
for k= round(zmin):width: round (zmax)           %Z轴
    k
    for i=round(xmin):width: round (xmax)         %X轴
        for j= round(ymin):width: round (ymax)    %Y轴
            %             [x,y,z]=cubic([i j k],width,width,width);   %参数分别是中心点,长a(x),宽b(y),高c(z)
            [aa2]=find ( jilu0(:,1) >= i-0.5*width &   jilu0(:,1)<i+0.5*width &  jilu0(:,2) >= j-0.5*width &   jilu0(:,2)<j+0.5*width & jilu0(:,3) >= k-0.5*width &   jilu0(:,3)<k+0.5*width  );
            bb2(k-round(zmin)+1,i-round(xmin)+1, j-round(ymin)+1)  = size(aa2,1);   % 这里给出了每个方格内的叶子点数
            f=f+1;
        end
    end
end


figure;  f=1;
for k= round(zmin):width*6: round (zmax)           %Z轴
    k
    for i=round(xmin):width: round (xmax)         %X轴
        for j= round(ymin):width: round (ymax)    %Y轴
            [x,y,z]=cubic([i j k],width/1.3,width/1.3,width/1.3);   %参数分别是中心点,长a(x),宽b(y),高c(z)   round (zmax)
            if bb2(k-round(zmin)+1,i-round(xmin)+1, j-round(ymin)+1)>2             % 这里是控制点数多少的  bb2在上面是排列好的
                aa3=bb2(k-round(zmin)+1,i-round(xmin)+1, j-round(ymin)+1)/max(max(max(bb2)));    % 这里给出了每个方格内的叶子点数
                if  aa3<1/6           %   blue  cyan  green yellow   magenta   red
                    hold on; mesh(x,y,z, 'EdgeColor', 'black',   'FaceColor', 'blue');
                end
                if  aa3>=1/6  & aa3<2/6
                    hold on; mesh(x,y,z, 'EdgeColor', 'black',   'FaceColor', 'cyan');
                end
                if  aa3>=2/6  & aa3<3/6
                    hold on; mesh(x,y,z, 'EdgeColor', 'black',   'FaceColor', 'green');
                end
                if  aa3>=3/6  & aa3<4/6
                    hold on; mesh(x,y,z, 'EdgeColor', 'black',   'FaceColor', 'yellow');
                end
                if  aa3>=4/6  & aa3<5/6
                    hold on; mesh(x,y,z, 'EdgeColor', 'black',   'FaceColor', 'magenta');
                end
                if  aa3>=5/6  & aa3<1
                    hold on; mesh(x,y,z, 'EdgeColor', 'none',   'FaceColor', 'red');
                end
            end
            f=f+1;
        end
    end
end
xlabel('x');ylabel('y');zlabel('z');
axis equal;


% 蓝 （0，0，255） 青（0，255，255） 绿（0，255，0） 黄（255，255，0） 红（255，0，0）
%   blue  cyan  green yellow   magenta   red   mesh(x,y,z, 'EdgeColor', 'none',   'FaceColor', [0 aa3 1]);







