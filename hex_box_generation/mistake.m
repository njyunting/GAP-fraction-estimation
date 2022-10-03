
close all; clear; clc;
for j=1:418
    filename1=['C:\Users\13896\Desktop\leaf2\leaf (' num2str(j) ').txt'];
     data1=load(filename1);   
      aa=[];
    [aa,bb]=find(data1(:,3)>10);  
       if aa>1
        filename1
    end
end
