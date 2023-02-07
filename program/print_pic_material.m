function print_pic_material(winPt,maketesture_material,i,screen_full,time)
Screen('DrawTextures',winPt,maketesture_material(1,i),[],screen_full);
Screen('Flip',winPt);
pause(time);

if i==1
KbWait([],2);
end