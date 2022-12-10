-- some stuff in here is from gabi's forever hud
-- gabi don't kill me please i beg

local foreverLetters = {'S+', 'S', 'A', 'B', 'C', 'D', 'E', 'F'};
local foreverPercents = {100, 95, 90, 85, 80, 75, 70, 65};
local foreverRating = 'N/A';

----------------Settings---------------
local centerDisplayType = 'Song Name'; -- default is Song Name
-- set to Song Time to change the text to a timer example: - [0:00 / 1:00] - --
local scoreBarColorTween = true; -- toggles the color tween on the scoreBar on note hit
---------------------------------------------------------------------------------

------------------------------------------------------------------------Da Script-----------------------------------------------------------------------------------------

function onDestroy()
    setPropertyFromClass('lime.app.Application', 'current.window.title',"Friday Night Funkin': Psych Engine")

    runHaxeCode([[
		Main.fpsVar.defaultTextFormat = new openfl.text.TextFormat("_sans", 14, 0x000000);
	]]);
end

function onCreatePost()
    setProperty('scoreTxt.visible', false)
    setProperty('timeBar.visible', false)
    setProperty('timeTxt.visible', false)
    setProperty('timeBarBG.visible', false)
    setProperty('botplayTxt.visible', false)

    makeLuaText('foreverScore', 'Score: 0 • Accuracy: 0% • Combo Breaks: 0 • Rank: N/A', 1280, 0, (downscroll and 114 or 680));
    setTextBorder("foreverScore", 1.5, '000000')
    setTextAlignment('foreverScore', 'CENTER')
    setTextSize('foreverScore', 18)
    if not getPropertyFromClass('ClientPrefs', 'hideHud') then addLuaText('foreverScore') end

    addHaxeLibrary('Main');
	runHaxeCode([[
		Main.fpsVar.defaultTextFormat = new openfl.text.TextFormat("VCR OSD Mono", 16, -1);
	]]);

    makeLuaText('scoreBar','', getTextWidth('scoreTxt'), math.floor(getProperty('healthBarBG.y') + 40), getProperty('scoreTxt.y') + 10)
    setTextSize('scoreBar', 18)
    setTextBorder('scoreBar', 1.5,'000000')
    addLuaText('scoreBar')

    makeLuaText('cornerMark','PSYCH ENGINE v 0.6.3')
    setTextSize('cornerMark', 18)
    setTextBorder('cornerMark', 2,'000000')
    setProperty('cornerMark.x', screenWidth - (getTextWidth('cornerMark') + 5))
    setProperty('cornerMark.y', 5)
    setProperty('cornerMark.antialiasing', true)
    addLuaText('cornerMark')

    makeLuaText('centerMark','', 0, 0, 680)
    if centerDisplayType == 'Song Name' then
        setTextString('centerMark',' - '..songName..' ['..difficultyName:upper()..']'..' - ')
    end
    setTextSize('centerMark', 24)
    setTextBorder('centerMark', 2,'000000')
    setProperty('centerMark.x', math.floor((screenWidth / 2) - (getTextWidth('centerMark') / 2)))
    if centerDisplayType == 'Song Time' then setProperty('centerMark.alpha', 0) end
    addLuaText('centerMark')

    if botPlay then
        setProperty('scoreBar.visible', false)

        makeLuaText('autoplayMark','[get strangled biatch]', screenWidth - 800, -5, getProperty('centerMark.y') - 60)
        setTextSize('autoplayMark', 32)
        setTextBorder('autoplayMark', 2,'000000')
        setTextAlignment('autoplayMark','CENTER')
        screenCenter('autoplayMark','x')
        addLuaText('autoplayMark')
    end

    if not downscroll then
        setProperty('centerMark.y', 20)
        setProperty('autoplayMark.y',getProperty('autoplayMark.y') - 510)
    end

    if middlescroll then
        setProperty('autoplayMark.y', 190)
    end

    if middlescroll then
        if downscroll then
            setProperty('autoplayMark.y', 505)
        end
    end
    updateScoreTxt();
end

function onRecalculateRating()
    updateScoreTxt();
end
autoplaySine = 0;
function onUpdate(elapsed)
    if centerDisplayType == 'Song Time' and curStep > 0 then
        updateTime();
    end

    setTextString('sick','Sick: ' .. getProperty('sicks'))
	setTextString('good','Good: ' .. getProperty('goods'))
	setTextString('bad','Bad: ' .. getProperty('bads'))
	setTextString('shit','Shit: ' .. getProperty('shits'))
	setTextString('miss','Miss: ' .. getProperty('songMisses'))

    for i = 0,getProperty('strumLineNotes.length')-1 do
        setPropertyFromGroup('strumLineNotes', i,'alpha', 0.85)
    end

    autoplaySine = autoplaySine + 180 * (elapsed / 4);
    setProperty('autoplayMark.alpha', 1 - math.sin((math.pi * autoplaySine) / 80))
end


function updateScoreTxt()
    setProperty('scoreBar.x', math.floor((screenWidth / 2) - (getProperty('scoreBar.width') / 2)))
    reloadRating(round((rating * 100), 2))

    setTextString('scoreBar','Score: '..score..' • Combo Breaks: '..misses ..' • Accuracy: '..round(rating * 100, 2)..'%'..
    (((hits > 0) or (misses > 0)) and ' ['..ratingFC..' | '..foreverRating..']' or ' [N/A]'))
    --setProperty('scoreBar.text', getProperty('scoreBar.text') + '\n')
end

function updateTime()
    currentTime = milliToHuman(math.floor(getSongPosition() - noteOffset))
    totalTime = milliToHuman(math.floor(songLength));
    setTextString('centerMark','- ['..currentTime..' / '..totalTime..'] -')

    setProperty('centerMark.x', math.floor((screenWidth / 2) - (getProperty('centerMark.width') / 2)));
end

function onSongStart()
    if centerDisplayType == 'Song Time' then
        doTweenAlpha('1','centerMark', 1, 0.5,'linear')
    end
end

function onBeatHit()
    if curBeat % 1 == 0 then
        bop(60 / bpm);
    end
end

function goodNoteHit(id, dir, type, sus)
daRate = getPropertyFromGroup('notes', id,'rating')
    if not sus and scoreBarColorTween then
        tweenScoreColor(daRate);
    end
end

function bop(time)
    scaleObject('iconP1', 1.2, 1.2)
    scaleObject('iconP2', 1.2, 1.2)

    doTweenX('lol','iconP1.scale', 1, time / getProperty('playbackRate'),'expoOut')
    doTweenY('lol2','iconP1.scale', 1, time / getProperty('playbackRate'),'expoOut')
    doTweenX('lol3','iconP2.scale', 1, time / getProperty('playbackRate'),'expoOut')
    doTweenY('lol4','iconP2.scale', 1, time / getProperty('playbackRate'),'expoOut')
end

function tweenScoreColor(daRate)
    if ratingName == 'Sick!' then
        rankColor = '00FFFF';
    elseif ratingName == 'Perfect!!' then
        rankColor = 'F8D482';
    end

    if daRate == 'sick' then
        rankColor = rankColor;
    elseif daRate == 'good' then
        rankColor = '32CD32';
    elseif daRate == 'bad' then
        rankColor = 'FFA500';
    elseif daRate == 'shit' then
        rankColor = 'A020F0';
    end

        doTweenColor('scoreColor','scoreBar', rankColor, 0.3)
end

function onTweenCompleted(tag)
    if tag == 'scoreColor' then
        doTweenColor('scoreColor2','scoreBar','FFFFFF', 0.3)
        cancelTween('scoreColor')
    elseif tag == 'scoreColor3' then
        doTweenColor('scoreColor4','scoreBar','FFFFFF', 0.3)
        cancelTween('scoreColor3')
    end
end

function noteMiss()
    doTweenColor('scoreColor3','scoreBar','FF0000', 0.3)
end


function round(x, n)
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
    return  x / n
end

function milliToHuman(milliseconds) -- https://forums.mudlet.org/viewtopic.php?t=3258
	local totalseconds = math.floor(milliseconds / 1000)
	local seconds = totalseconds % 60
	local minutes = math.floor(totalseconds / 60)
	minutes = minutes % 60
	return string.format("%02d:%02d", minutes, seconds)  
end

-- stol- I mean borrowed from gabi's forever hud
function reloadRating(percent)
    for i = 1,#foreverLetters do
      if foreverPercents[i] <= percent then
        foreverRating = foreverLetters[i]
        break
      end
    end
end