function SOT_1=print_pic_trai_1(winPt,maketesture_content,maketesture_material,data,i,screen_content,screen_full)



Screen('DrawTextures',winPt,maketesture_material(1,3),[],screen_full);
Screen('DrawTextures',winPt,maketesture_content(1,data.pn(i)),[],screen_content);


[~,SOT_1]=Screen('Flip',winPt);

