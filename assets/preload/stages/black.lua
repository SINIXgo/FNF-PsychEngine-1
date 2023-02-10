local Mechanic = false
local SineElap = 0
local DanceAmt = 3.4
function onCreatePost()
    	setPropertyFromClass('openfl.Lib', 'application.window.y', 180)
    	setPropertyFromClass('openfl.Lib', 'application.window.x', 320)
    	windowy = getPropertyFromClass("openfl.Lib", "application.window.y")
    	windowx = getPropertyFromClass("openfl.Lib", "application.window.x")
	setPropertyFromClass('openfl.Lib','application.window.title','NO MORE INNOCENCE')

	makeLuaSprite('nofing','stage/verganegra_1',0,0)
	addLuaSprite('nofing',false)

	makeLuaSprite('bg','stage/Innocence_bg_1',-645,-495)
	addLuaSprite('bg',false)
	setProperty('bg.antialiasing',false)
	scaleObject('bg',1.1,1.1)

	makeLuaSprite('stageFront','stage/Ilustracion8',-1170,789)
	addLuaSprite('stageFront',false)
	scaleObject('stageFront',1.6,1.6)

	shader()
end

function onUpdate(elapsed)
	setShaderFloat('bg','uTime',elapsed)
	setProperty('timeBar.visible',false)
	setProperty('timeBarBG.visible',false)
	setProperty('timeTxt.visible',false)
    	if Mechanic == true then
        	setPropertyFromClass('openfl.Lib', 'application.window.y', 270*math.sin(SineElap)/10+windowy)
    	end
end

function onUpdatePost(elapsed)
	setProperty('grpNoteSplashes.visible',false)
	SineElap = SineElap + (elapsed * DanceAmt)
end

function onStepHit()
	if curStep >= 1693 then
		Mechanic = true
	end
end

function onEvent(name, value1, value2)
	if name == 'Innocence FPV Apparition' then
		removeLuaSprite('nofing',true)
		removeLuaSprite('bg',true)
		removeLuaSprite('stageFront',true)
		setProperty('boyfriend.visible',false)
		setProperty('defaultCamZoom',1)
		setProperty('iconP1.visible',false)
		setProperty('iconP2.visible',false)
		setProperty('healthBar.angle',90)
		setProperty('healthBar.x',900)
		screenCenter('healthBar','y')
	end
end

function onEndSong()
	os.execute('nircmd.exe infobox GOODBYE Error')
	os.exit()
	return Function_Continue
end

function onGameOver()
	os.execute('nircmd.exe infobox "YOU ARE DEAD MEAT" "YOU ARE DEAD"')
	os.exit()
	return Function_Continue;
end


function shader()
	initLuaShader('waveShader')
	setSpriteShader('bg','waveShader')
	setShaderFloat('bg','uSpeed',2)
	setShaderFloat('bg','uFrequency',5)
	setShaderFloat('bg','uWaveAmplitude',0.1)
end