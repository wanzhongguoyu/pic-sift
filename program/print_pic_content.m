function print_pic_content(winPt,maketesture_content,maketesture_material,data,i,screen_content,screen_judge1,screen_judge2)


Screen('DrawTextures',winPt,maketesture_content(1,data.pn(i)),[],screen_content);

Screen('DrawTextures',winPt,maketesture_material(1,3),[],screen_judge1);

