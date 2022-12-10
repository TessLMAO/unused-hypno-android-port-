function onEvent(n,v1,v2)

if not lowQuality then
	if n == 'Colour Flash Camera' then
		if v2 == '' and v1 ~= '' then
			makeLuaSprite('flash', '', 0, 0);
			makeGraphic('flash',1280,720,'ffffff')
			addLuaSprite('flash', true);
	    	setLuaSpriteScrollFactor('flash',0,0)
	    	setProperty('flash.scale.x',2)
	    	setProperty('flash.scale.y',2)
	    	setProperty('flash.alpha',0)
			setProperty('flash.alpha',1)
			doTweenAlpha('flTw','flash',0,v1+0.2,'linear')
		elseif v2 == '' and v1 == '' then
			makeLuaSprite('flash', '', 0, 0);
			makeGraphic('flash',1280,720,'ffffff')
			addLuaSprite('flash', true);
	    	setLuaSpriteScrollFactor('flash',0,0)
	    	setProperty('flash.scale.x',2)
	    	setProperty('flash.scale.y',2)
	    	setProperty('flash.alpha',0)
			setProperty('flash.alpha',1)
			doTweenAlpha('flTw','flash',0,0.7,'linear')
		elseif v2 ~= '' and v1 == '' then
			makeLuaSprite('flash', '', 0, 0);
			makeGraphic('flash',1280,720,v2)
			addLuaSprite('flash', true);
	    	setLuaSpriteScrollFactor('flash',0,0)
	    	setProperty('flash.scale.x',2)
	    	setProperty('flash.scale.y',2)
	    	setProperty('flash.alpha',0)
			setProperty('flash.alpha',1)
			doTweenAlpha('flTw','flash',0,0.7,'linear')
		elseif v2 ~= '' and v1 ~= '' then
			makeLuaSprite('flash', '', 0, 0);
			makeGraphic('flash',1280,720,v2)
			addLuaSprite('flash', true);
	    	setLuaSpriteScrollFactor('flash',0,0)
	    	setProperty('flash.scale.x',2)
	    	setProperty('flash.scale.y',2)
	    	setProperty('flash.alpha',0)
			setProperty('flash.alpha',1)
			doTweenAlpha('flTw','flash',0,v1+0.2,'linear')
		end
	end
end
end

function onTweenCompleted(tag)
if tag == 'flTw' then
removeLuaSprite('flash', true)
	end
end