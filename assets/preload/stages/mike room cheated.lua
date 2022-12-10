function onCreatePost()
    setProperty('cameraSpeed', 1.5)
    
    makeLuaSprite('bg', 'mike room/back', -50, 320);
    scaleObject('bg', 1.1, 1.1)
    setLuaSpriteScrollFactor('bg', 0.7, 0.7);

    setProperty('gf.visible', false);
    setProperty('boyfriend.visible', false);
    setProperty('camHUD.alpha', 0);

    doTweenZoom('hey', 'camGame', 0.50, 0.40, 'linear')
    setProperty('defaultCamZoom', 0.50) 

    makeLuaSprite('bedR', 'mike room/bed', 200, 700);
    scaleObject(0.5, 0.5)

    setPropertyFromClass('flixel.FlxG', 'mouse.visible', false)

    makeLuaSprite('blackScreen', nil, 0,0);
	makeGraphic('blackScreen',screenWidth, screenHeight,'000000');
    setObjectCamera('blackScreen', 'game');
	screenCenter('blackScreen');

    makeLuaSprite('blackScreenALT', nil, 0,0);
	makeGraphic('blackScreenALT',screenWidth, screenHeight,'000000');
	screenCenter('blackScreenALT');

    makeLuaText('textWhite', '', 650, 250, 500);
	setTextString('textWhite', 'Good');
	setTextColor('textWhite', 'FFFFFF');
	setTextSize('textWhite', '25');
    setTextFont('textWhite', 'PokemonGB.TTF')

    makeLuaText('textRed', '', 650, 250, 500);
	setTextString('textRed', 'Good');
	setTextColor('textRed', 'FF0000');
	setTextSize('textRed', '25');
    setTextFont('textRed', 'PokemonGB.TTF')

    makeLuaText('text2', '', 650, 350, 490);
	setTextString('text2', 'bye');
	setTextColor('text2', 'FF0000');
	setTextSize('text2', '25');
    setTextFont('text2', 'PokemonGB.TTF')

    makeLuaText('text2White', '', 650, 350, 500);
	setTextString('text2White', 'bye');
	setTextColor('text2White', 'FFFFFF');
	setTextSize('text2White', '25');
    setTextFont('text2White', 'PokemonGB.TTF')

    doTweenZoom('hey', 'camGame', 1.70, 0.30, 'linear');
    setProperty('defaultCamZoom', 1.70);
end
function onCreate()
    setProperty('skipCountdown', true)
    precacheImage('characters/dissension/BRO_DEAD')
    precacheImage('characters/dissension/StevenBehindTheBed')
precacheImage('characters/dissension/StevenChokingMarkiplier')
precacheImage('characters/dissension/StevenLookinAtYouPart2')
precacheImage('no-miss')
precacheImage('Steven-Notes')
precacheImage('Mike-Notes')
precacheImage('mike room/redoverlay')
end

function onBeatHit()
    if curBeat > 228 and curBeat < 64 then
        setProperty('camHUD.zoom' , 1.20)
        --triggerEvent('Add Camera Zoom', '0.25', '0.001')
    end
end        

function onStepHit()
    if curStep >= 54 then
        doTweenAlpha('whaaaa-no', 'camHUD', 0.75, 1, 'linear')

    end
    if curStep >= 128 then
        addLuaSprite('bg', false)
        addLuaSprite('bedR', false)
        setObjectOrder('bedR', getObjectOrder('dadGroup') + 1);
        setProperty('boyfriend.visible', true)
        setProperty('defaultCamZoom', 1.00)
        doTweenZoom('hey', 'camGame', 1.00, 0.40, 'linear')

        if not mustHitSection then
            doTweenZoom('hey', 'camGame', 1.20, 0.70, 'linear')
            setProperty('defaultCamZoom', 1.20)
        elseif mustHitSection then
            doTweenZoom('hey', 'camGame', 1.10, 0.70, 'linear')
            setProperty('defaultCamZoom', 1.10)
        end
    end
    if curStep >= 512 then
        setProperty('bg.visible', false)
        setProperty('bedR.visible', false)
        setProperty('help.visible', false)
        setProperty('photo.visible', false)

        doTweenZoom('hey', 'camGame', 0.85, 0.40, 'linear')
        setProperty('defaultCamZoom', 0.85)

        if not mustHitSection then
            doTweenZoom('hey', 'camGame', 0.85, 0.40, 'linear')
            setProperty('defaultCamZoom', 0.85)
        elseif mustHitSection then
            doTweenZoom('hey', 'camGame', 0.85, 0.40, 'linear')
            setProperty('defaultCamZoom', 0.85)
        end
    end
    if curStep >= 656 then
        setProperty('bg.visible', true)
        setProperty('bedR.visible', true)
        setProperty('help.visible', true)
        setProperty('photo.visible', true)
        setProperty('boyfriend.X', 630);
        setProperty('boyfriend.Y', 900);
        setProperty('dad.Y', 666);
    end
    
    if curStep >= 927 then
        setProperty('boyfriend.X', 630);
        setProperty('boyfriend.Y', 900);
        removeLuaSprite('bg', true)
        removeLuaSprite('bedR', true)
    end
end 

-- crash prevention
function onUpdate() end
function onUpdatePost() end