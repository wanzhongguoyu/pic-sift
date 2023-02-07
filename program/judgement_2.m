function data=judgement_2(data,i,SOT_2)


KbName('UnifyKeyNames');
oneKey = KbName('1');
twoKey = KbName('2');
thereKey = KbName('3');
fourKey = KbName('4');
fiveKey = KbName('5');
sixKey = KbName('6');
sevenKey=KbName('7');
eightKey=KbName('8');
nineKey=KbName('9');

KbWait;
[KeyisDown,secs,keyCode] = KbCheck;
while KbCheck;end

data.aromn_time(i) = secs-SOT_2;
if KeyisDown==1
    
    if keyCode(oneKey) == 1
        data.aromn_judge(i)=1;
    elseif keyCode(twoKey) == 1
        data.aromn_judge(i)=2;
    elseif keyCode(thereKey) == 1
        data.aromn_judge(i)=3;
    elseif keyCode(fourKey) == 1
        data.aromn_judge(i)=4;
    elseif keyCode(fiveKey) == 1
        data.aromn_judge(i)=5;
    elseif keyCode(sixKey) == 1
        data.aromn_judge(i)=6;
    elseif keyCode(sevenKey) == 1
        data.aromn_judge(i)=7;
    elseif keyCode(eightKey) == 1
        data.aromn_judge(i)=8;
    elseif keyCode(nineKey) == 1
        data.aromn_judge(i)=9;
    elseif keyCode(KbName('Q')) == 1
        Screen('ClossAll');
    end
    
end