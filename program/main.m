% main
clc;clear

AssertOpenGL;
Screen('Preference', 'SkipSyncTests',1);
Screen('Preference','VisualDebugLevel',3);
Screen('Preference','SuppressAllWarnings',1);

k=1; %rate
t1=5*k;
t2=1*k;
t3=3*k;
% KbName('UnifyKeyNames');
% oneKey = KbName('1');
% twoKey = KbName('2');
% thereKey = KbName('3');
% fourKey = KbName('4');
% fiveKey = KbName('5');
% sixKey = KbName('6');
% sevenKey=KbName('7');
% eightKey=KbName('8');
% nineKey=KbName('9');

each_pn=150;
con=3;
total_pic=each_pn*con;

data=list();

% if data.ID(1,1)~=1
%     [winPt,winRect] = Screen('OpenWindow',0,[125,125,125],[0 0 1920 1080]);
%     HideCursor
% else
%     % [winPt,winRect] = Screen('OpenWindow',1,[125,125,125],[0 0 800 600]);
%     [winPt,winRect] = Screen('OpenWindow',0,[125,125,125],[0 0 1920 1080]);
%
% end
[winPt,winRect] = Screen('OpenWindow',0,[125,125,125]);
HideCursor;

Xmax=winRect(3);
Ymax=winRect(4);
screen_full=winRect;
screen_content=[636,136,1284,623];  % [clicks,x,y,whichButton] =GetClicks();
load('screen_circle.mat');

dis_picture_content = dir([cd,'\pic_content','\*.jpg']);  %实验材料
for i = 1:length(dis_picture_content)
    Path_picture_content{i}=[cd,'\pic_content\',dis_picture_content(i).name]; %#ok<*SAGROW>
    im_content{i} =imread(Path_picture_content{1,i});
    maketesture_content(i)= Screen('MakeTexture',winPt,im_content{1,i});
end


dis_picture_material= dir([cd,'\pic_material','\*.jpg']);  %实验用图
for i = 1:length(dis_picture_material)
    Path_picture_material{i}=[cd,'\pic_material\',dis_picture_material(i).name];
    im_material{i} =imread(Path_picture_material{1,i});
    maketesture_material(i)= Screen('MakeTexture',winPt,im_material{1,i});
end


print_pic_material(winPt,maketesture_material,1,screen_full,t1)  %指导语


for i=1:height(data)
    
    print_pic_material(winPt,maketesture_material,2,screen_full,t2)  %注视点
    
    SOT_1=print_pic_trai_1(winPt,maketesture_content,maketesture_material,data,i,screen_content,screen_full);
    data=judgement_1(data,i,SOT_1);
    SOT_2=print_pic_trai_2(winPt,maketesture_content,maketesture_material,data,i,screen_circle_1,screen_content,screen_full);
    
    data=judgement_2(data,i,SOT_2);
    print_pic_trai_3(winPt,maketesture_content,maketesture_material,data,i,screen_circle_1,screen_circle_2,screen_content,screen_full);
    
    KbWait;
    
    if i==(total_pic/3)*1
        print_pic_material(winPt,maketesture_material,5,screen_full,t3); %break          
    elseif i==(total_pic/3)*2
        print_pic_material(winPt,maketesture_material,5,screen_full,t3); % break
    else
        print_pic_material(winPt,maketesture_material,4,screen_full,t3); % relax
    end
    
    
    
end


print_pic_material(winPt,maketesture_material,6,screen_full,t3);  % end

Path = [cd,'\'];
ID=data.ID(1);
mkdir([Path,'D',num2str(ID(1))]);
writetable(data,[Path,'D',num2str(ID(1)),'\',num2str(ID(1)),'Dt.xlsx']);

Screen('CloseAll');
