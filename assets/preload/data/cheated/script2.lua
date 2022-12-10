function onCreatePost()
    makeLuaSprite('no-miss', 'no-miss', 0, 0)
    setObjectCamera('no-miss', 'camHUD')
    makeLuaSprite('idk', 'mike room/redoverlay', 0, 0)
    setObjectCamera('idk', 'camHUD')
    setProperty('idk.alpha', 0)
    setProperty('dad.alpha', 0)
end
function opponentNoteHit()
    health = getProperty('health')
    if curStep <= 927 and getProperty('health') > 0.1 then
        setProperty('health', health- 0.02);
    end
    if curStep >= 927 and getProperty('health') > 0.1 then
        setProperty('health', health- 0.05);
    end
end
function onUpdate(elapsed)
    if curStep >= 10 then
        doTweenAlpha('hellodad', 'dad', 1, 3)
    end
    if curStep >= 917 then
        miss = misses
        addLuaSprite('no-miss', false)
        addLuaSprite('idk', false)
    end
    if curStep >= 927 and misses > miss then
        setProperty('health', health- 1000);
    end
    if curStep >= 936 then
    
        setProperty('bg.visible', false)
        setProperty('bedR.visible', false)
        setProperty('help.visible', false)
        setProperty('photo.visible', false)
        setProperty('idk.alpha', 0.75)
        scaleObject('idk', 1.1, 1)
    end
    if curStep >= 937 then
        doTweenAlpha('scorehno', 'scoreBar', 0, 2, 'linear')
        doTweenAlpha('scorehnono', 'foreverScore', 0, 2, 'linear')
        doTweenAlpha('autoplayMarkno', 'autoplayMark', 0, 1, 'linear')
        doTweenAlpha('icon1hno', 'iconP1', 0, 2, 'linear')
        doTweenAlpha('icon2no', 'iconP2', 0, 2, 'linear')
        doTweenAlpha('helthno', 'healthBar', 0, 2, 'linear')
        doTweenAlpha('missno', 'no-miss', 0, 2, 'linear')
    end
    if curStep >= 982 then
        setProperty('boyfriend.alpha', 0.95)
        setProperty('dad.alpha', 0.95)
    end
    if curStep >= 1037 then
        setProperty('boyfriend.alpha', 0.9)
        setProperty('dad.alpha', 0.9)
    end
        if curStep >= 1092 then
        setProperty('boyfriend.alpha', 0.85)
        setProperty('dad.alpha', 0.85)
    end
    if curStep >= 1147 then
        setProperty('boyfriend.alpha', 0.8)
        setProperty('dad.alpha', 0.8)
    end
    if curStep >= 1202 then
        setProperty('boyfriend.alpha', 0.75)
        setProperty('dad.alpha', 0.75)
    end
    if curStep >= 1257 then
        setProperty('boyfriend.alpha', 0.7)
        setProperty('dad.alpha', 0.7)
    end
    if curStep >= 1312 then
        setProperty('boyfriend.alpha', 0.65)
        setProperty('dad.alpha', 0.65)
    end
    if curStep >= 1367 then
        setProperty('boyfriend.alpha', 0.6)
        setProperty('dad.alpha', 0.6)
    end
    if curStep >= 1422 then
        setProperty('boyfriend.alpha', 0.55)
        setProperty('dad.alpha', 0.55)
    end
    if curStep >= 1477 then
        setProperty('boyfriend.alpha', 0.5)
        setProperty('dad.alpha', 0.5)
    end
    if curStep >= 1532 then
        setProperty('boyfriend.alpha', 0.45)
        setProperty('dad.alpha', 0.45)
    end
    if curStep >= 1587 then
        setProperty('boyfriend.alpha', 0.4)
        setProperty('dad.alpha', 0.4)
    end
    if curStep >= 1642 then
        setProperty('boyfriend.alpha', 0.35)
        setProperty('dad.alpha', 0.35)
    end
    if curStep >= 1697 then
        setProperty('boyfriend.alpha', 0.3)
        setProperty('dad.alpha', 0.3)
    end
    if curStep >= 1752 then
        setProperty('boyfriend.alpha', 0.25)
        setProperty('dad.alpha', 0.25)
    end
    if curStep >= 1807 then
        setProperty('boyfriend.alpha', 0.2)
        setProperty('dad.alpha', 0.2)
    end
    if curStep >= 1862 then
        setProperty('boyfriend.alpha', 0.15)
        setProperty('dad.alpha', 0.15)
    end
    if curStep >= 1917 then
        setProperty('boyfriend.alpha', 0.1)
        setProperty('dad.alpha', 0.1)
    end
    if curStep >= 1972 then
        setProperty('boyfriend.alpha', 0.05)
        setProperty('dad.alpha', 0.05)
    end
    if curStep >= 2027 then
        setProperty('boyfriend.alpha', 0)
        setProperty('dad.alpha', 0)
    end
end