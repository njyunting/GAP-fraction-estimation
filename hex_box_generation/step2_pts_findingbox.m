clc;
clear;
close all;
warning off;
 load L_src.mat

%��L_src��ÿһƬҶ�Ӽ����������ͶӰ��������ͶӰ��
%L_pro ÿһ����һ��Ҷ�ӣ�ÿһ�еĵ�һ����ԭʼ��λ���ڶ�����x,y�������ƽ���ϵ�zֵ��������������ϵ��coef����������ÿ��Ҷ�ӵ���ɫ��Ϣ
%�������z=coef(1)+ coef(2)*x +coef(3)*y + coef(4)*x.^2 + coef(5)*x.*y+coef(6)*y.^2 + coef(7)*x.^3 + coef(8)*x.^2.*y + coef(9)*x.*y.^2 + coef(10)*y.^3;
L_pro=leaves_project(L_src);

% temp  = L_pro(:,2);
% %
% temp2 = [];
% temp  = L_pro(:,2);
% for b = 1:size(temp,1)
%     t = temp{b};
%     t = abs(t(:,3));
%     temp2 = [temp2;t];
% end
% % %
%     temp2 = [];
% temp  = L_pro(:,2);
% for b = 1:size(temp,1)
%  t = temp{b};
%      t =t(:,3);
%     t1 = max(t);
%     t2 = min(t);
%     t3 = t1 - t2;
%     temp2 = [temp2;t3];
% end
% %
% 
% count  =1 ;% ���Z��ƽ��
% for a = 1:size(temp,1)
%     t = temp{a};
%      t =t(:,3);
%     t1 = max(t);
%     t2 = min(t);
%     t3 = t1 - t2;
%     t =t3.^2;
%     if t>count  
%         % ��������ֵ����һ�и���
%         temp1 = L_pro(a-1,:);
%       a
%        L_pro(a,:)=temp1;
%     end
% end


%������һ����ÿ��Ҷ����ȡ�����
%L_pro_with_hexboxǰ���к�L_proһ�£����һ���ǿ���ĵ�λ��Ϣ��
%����ĵ�λ��Ϣ��12����λ������˳����ǰ������Ϊ�������ABCDEFһȦ˳���λ����������Ϊ��Ӧ���������A'B'C'D'E'F'��
L_pro_with_hexbox=leaves_hex_bound(L_pro);

save L_pro_with_hexbox.mat L_pro_with_hexbox;