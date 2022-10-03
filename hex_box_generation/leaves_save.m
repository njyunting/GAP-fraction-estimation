function leaves_save(url,L)
num=size(L,1);
leaves=[];
for i=1:num
x=cell2mat(L(i,1));
c=cell2mat(L(i,2));
c=repmat(c,[size(x,1),1]);
leaves=[leaves;[x,c]];
end
save( url, '-ascii', 'leaves');
end

