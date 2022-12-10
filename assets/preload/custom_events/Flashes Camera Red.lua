function onEvent(n,v1,v2)

if not lowQuality then
	if n == 'Flashes Camera' then

	   makeLuaSprite('flash', 'flash', 0, 0);
        makeGraphic('flash',1280,720,'FF0000')
	      addLuaSprite('flash', true);
	      setLuaSpriteScrollFactor('flash',0,0)
	      setProperty('flash.scale.x',2)
	      setProperty('flash.scale.y',2)
	      setProperty('flash.alpha',0)
		setProperty('flash.alpha',1)
		doTweenAlpha('flTw','flash',0,0.5,'linear')
	end



end
end

function onTweenCompleted(tag)
if tag == 'flTw' then
removeLuaSprite('flash', true)
	end
end