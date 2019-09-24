function judge( ... )
    -- body
    local flag=0
    local hours = os.date("%H");
    local minute= os.date("%M");
    local a="目前时间是："..hours.."点"..minute.."分";
    dialog(a,2)
    num_hours=tonumber(hours)
    if num_hours>7 and num_hours<23 then
        flag=1
        return flag 
    end
end
function click(x, y)
    touchDown(x, y)
    mSleep(30)
    touchUp(x, y)
end

function notify()
    for var = 1, 3 do
        vibrator();
        mSleep(500);
    end
end

function shake()
    types = getDeviceType();
    if types ~= 3 and types ~= 4 then
        shakeDevice(0, 0, -3, 3000);
        mSleep(3000);
    end
end

function unlock()
    local flag = deviceIsLock();
    if flag ~= 0 then
        unlockDevice();
        mSleep(1000);
    end
end

function vSlide(x, y1, y2)
    for var = 1, 3 do
        touchDown(x, y1);
        mSleep(30);
        touchMove(x, y2);
        mSleep(830);
        touchUp(x, y2);
        mSleep(30)
    end
end
while(true) 
do
    if judge()==1 then

        mSleep(3000);
        shake();
        unlock();
        mSleep(1000);
        vSlide(500, 900, 500);
        mSleep(3000);
        closeApp('com.alibaba.android.rimet');
        for var = 1, 3 do
            unlock();
            runApp('com.alibaba.android.rimet');
            --setScreenScale(true, 720, 1280);
            mSleep(8000);
            click(543, 1715);
            setScreenScale(false)
            mSleep(5000)
            -- 根据像素模糊查找考勤按钮
            --[[

            x, y = findMultiColorInRegionFuzzy(0x708090, "200|200|0xffffff,60|80|0x708090,200|-200|0xffffff,60|-10|0x778899,-200|-200|0xffffff,-10|-19|0x708090,-200|200|0xffffff,-270|220|0xf6f9ff,240|220|0xf6f9ff", 70, 0, 0, 1023, 1614);
            x1, y1 = findMultiColorInRegionFuzzy(0x5e97f6, "200|200|0xffffff,60|80|0x85b0f8,200|-200|0xffffff,60|-10|0x5e97f6,-200|-200|0xffffff,-10|-19|0x5e97f6,-200|200|0xffffff,-270|220|0xf6f9ff,240|220|0xf6f9ff", 70, 0, 0, 1023, 1614);
            if x ~= -1 and y ~= -1 then
                click(x, y);
                click(x, y);
                dialog("不能打卡",2)
            elseif x1 ~= -1 and y1 ~= -1  then        
                msleep(40);
                click(x1 y1);
                dialog("可以打卡",2)
            else
                --dialog("木有找到元素", 2)
                click(574, 868);
                click(574, 868);
                click(552,1237);
                dialog("木有找到元素", 2)
                vSlide(500, 1164, 968)
                mSleep(1500)


            end
            --]]
            click(426, 1590);
            mSleep(4000);
            for v =1, 3 do
                x, y = findMultiColorInRegionFuzzy(0x708090, "200|200|0xffffff,60|80|0x708090,200|-200|0xffffff,60|-10|0x778899,-200|-200|0xffffff,-10|-19|0x708090,-200|200|0xffffff,-270|220|0xf6f9ff,240|220|0xf6f9ff", 70, 0, 0, 1023, 1614);
                x1, y1 = findMultiColorInRegionFuzzy(0x5e97f6, "200|200|0xffffff,60|80|0x85b0f8,200|-200|0xffffff,60|-10|0x5e97f6,-200|-200|0xffffff,-10|-19|0x5e97f6,-200|200|0xffffff,-270|220|0xf6f9ff,240|220|0xf6f9ff", 70, 0, 0, 1023, 1614);
                if x ~= -1 and y ~= -1 then
                    click(x, y);
                    click(x, y);
                    dialog("不能打卡",2)
                    break
                elseif x1 ~= -1 and y1 ~= -1  then        
                    mSleep(40);
                    click(x1,y1);
                    dialog("可以打卡",2)
                    break
                else
                    --dialog("木有找到元素", 2)
                    click(574, 868);
                    click(574, 868);
                    click(552,1237);
                    dialog("木有找到元素", 2)
                    vSlide(500, 1164, 968)
                    mSleep(1500)
                end                
            end
            mSleep(1000);
            print('hahahaha')
            closeApp('com.alibaba.android.rimet');
            -- notify();
            mSleep(3000);
        end

    end
        math.randomseed(os.time())
        randsleep=math.random(30)
        local mes="下次运行是"..randsleep.."分钟后";
        dialog(mes,2)
        mSleep(randsleep);

end