function onEvent(name, value1, value2)
if not lowQuality then
	if name == 'noteskinchangeDAD' then
	if value1 == '' then
	-- do nothing lol
	else
		for i = 0, getProperty('opponentStrums.length')-1 do
		setPropertyFromGroup('opponentStrums', i, 'texture', value1);
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') == false then
			setPropertyFromGroup('unspawnNotes', i, 'texture', value1);
			end
		end
	end
end
	if value2 == '' then
	-- do nothing lol
	else
if not lowQuality then
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', value2);
			end
		end
	end
end
end
end