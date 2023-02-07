function print_pic_trai_3(winPt,maketesture_content,maketesture_material,data,i,screen_circle_1,screen_circle_2,screen_content,screen_full)



Screen('DrawTextures',winPt,maketesture_material(1,3),[],screen_full);

if data.valmn_judge(i)~=0
Screen('FillOval', winPt,[125,0,0], screen_circle_1(data.valmn_judge(i),:));
end
if data.aromn_judge(i)~=0
Screen('FillOval', winPt,[125,0,0], screen_circle_2(data.aromn_judge(i),:));
end
Screen('DrawTextures',winPt,maketesture_content(1,data.pn(i)),[],screen_content);

Screen('Flip',winPt);