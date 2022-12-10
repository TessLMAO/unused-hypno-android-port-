--script by Shadow Mario lol
function onCreatePost()

	luaDebugMode = true;
	runHaxeCode([[
		game.dadGroup.y += -70;
		for (dad in game.dadGroup)
		{
			dad.cameraPosition[1] -= 40;
		}
		bfX = game.dadGroup.x;
		bfY = game.dadGroup.y;

		fakeDad = new Character(bfX + 325, bfY + 1300, 'steven_phase2');
		fakeDad.scrollFactor.set(0.97, 0.97);
		fakeDad.y += 80;
	]]);
end

function onCountdownTick(counter)
	runHaxeCode([[
		if (]]..counter..[[ % fakeDad.danceEveryNumBeats == 0 && fakeDad.animation.curAnim != null && !StringTools.startsWith(fakeDad.animation.curAnim.name, 'sing') && !fakeDad.stunned)
		{
			fakeDad.dance();
		}
	]]);
end

function onBeatHit()
	runHaxeCode([[
		if (]]..curBeat..[[ % fakeDad.danceEveryNumBeats == 0 && fakeDad.animation.curAnim != null && !StringTools.startsWith(fakeDad.animation.curAnim.name, 'sing') && !fakeDad.stunned)
		{
			fakeDad.dance();
		}
	]]);
end

function onStepHit()
	if curStep >= 917 then
		doTweenColor('fakeColorTween', 'fakeDad', 'ad3520', 80, 'linear')
		runHaxeCode([[
			game.add(fakeDad);
		]]);
	end
	
end

function onUpdate(elapsed)
	if curStep >= 917 then
		doTweenColor('fakeColorTween', 'fakeDad', 'ad3520', 80, 'linear')
	end
	runHaxeCode([[
		if (game.startedCountdown && game.generatedMusic)
		{
			if (!fakeDad.stunned && fakeDad.holdTimer > Conductor.stepCrochet * 0.0011 * fakeDad.singDuration && StringTools.startsWith(fakeDad.animation.curAnim.name, 'sing') && !StringTools.endsWith(fakeDad.animation.curAnim.name, 'miss'))
			{
				fakeDad.dance();
			}
		}
	]]);
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	runHaxeCode([[
		fakeDad.playAnim(game.singAnimations[]]..direction..[[], true);
		fakeDad.holdTimer = 0;
	]]);
end