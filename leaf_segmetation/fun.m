function [ finalIndexs ] = fun( index,d )

threshold=0.0001;  % ԭ��0.05,

tempIndexs=index;

% n=0;

finalIndexs=[];
while size(tempIndexs,1)>0%��ȡ�����С
    temp=[];
    for i=1:size(tempIndexs,1)
        if ismember(tempIndexs(i),finalIndexs)==0%tempIndexs(i)����finalIndexs�г�Ա
            temp=[temp;tempIndexs(i)];%��ֱƴ��A��B
            finalIndexs=[finalIndexs;tempIndexs(i)];
        end
    end
   [tempIndexs,c]=find(d(:,temp)<threshold & d(:,temp)>0);
end
end

