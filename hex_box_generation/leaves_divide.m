function [ L ] = leaves_divide( IDX,leaves )
%把分割标签转化为单个叶子
label=unique(IDX);
%                                          color=rand(numel(label),3);
                  color=repmat([0,1,0],[numel(label),1]);
L=cell(numel(label),1);
for i=1:numel(label)
L(i,1)={leaves(find(IDX==label(i)),:)};
L(i,2)={color(i,:)};
end
L(1,:)=[];
end

