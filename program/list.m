function  dt=list()

each_pn=150;
con=3;
total_pic=each_pn*con;

prompt = {'ID:','Gender:'};
dlgtitle = 'ID and Gender';
dims = [1 20];
ID_gender= inputdlg(prompt,dlgtitle,dims);
ID=ID_gender{1,1};  Gender=ID_gender{2,1};

ID =str2double(ID)*ones(total_pic,1);
Gender=str2double(Gender)*ones(total_pic,1);
Date = repmat(datestr(now,30),(total_pic),1);

%%%
con1=[ones(total_pic/3,1);ones(total_pic/3,1)+1;ones(total_pic/3,1)+2];

con1_pn_random=[con1,(1:total_pic)',randperm(total_pic)'];
con1_pn=sortrows(con1_pn_random,3);
con1=con1_pn(:,1);   % 1:����  2:����  3������
pn=con1_pn(:,2);  % 1-150 ����   151-300 ����  301-450 ����

valmn_judge=zeros(total_pic,1); %Ч��  1-3����  4-6����   7-9����
valmn_time=zeros(total_pic,1);
aromn_judge=zeros(total_pic,1);%���Ѷ�   1-3�� 4-6�� 7-9��
aromn_time=zeros(total_pic,1); 
dt=table(ID,Gender,Date,con1,pn,valmn_judge,valmn_time,aromn_judge,aromn_time);


