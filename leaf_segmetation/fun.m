function [ finalIndexs ] = fun( index,d )

threshold=0.0001;  % 原来0.05,

tempIndexs=index;

% n=0;

finalIndexs=[];
while size(tempIndexs,1)>0%获取矩阵大小
    temp=[];
    for i=1:size(tempIndexs,1)
        if ismember(tempIndexs(i),finalIndexs)==0%tempIndexs(i)不是finalIndexs中成员
            temp=[temp;tempIndexs(i)];%垂直拼接A和B
            finalIndexs=[finalIndexs;tempIndexs(i)];
        end
    end
   [tempIndexs,c]=find(d(:,temp)<threshold & d(:,temp)>0);
end
end

