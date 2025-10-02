local perlinX = 0
local perlinY = 0
local perlinZ = 0
local perlinSpeed = 0.5
local perlinXRange = 0.01
local perlinYRange = 0.01
local perlinZRange = 0.1
local bloomCums = {192}
local downscroll = 1
local shift = 1
local mattBarrel = false
local waitTime = 0
function createPost()
	if downscrollBool then
		downscroll = -1
	end
	initShader('bloom', 'BloomEffect')
    setCameraShader('game', 'bloom')
    setCameraShader('hud', 'bloom')
    setShaderProperty('bloom', 'contrast', 1)
	initShader('bn', 'GreyscaleEffect')
	setCameraShader('game', 'bn')
	setCameraShader('hud', 'bn')
	setShaderProperty('bn', 'strength', 1)
	initShader('mirror', 'MirrorRepeatEffect')
	setCameraShader('game', 'mirror')
	setCameraShader('hud', 'mirror')
    setShaderProperty('mirror', 'zoom', 2.5)
    setShaderProperty("mirror","angle",30)
    setShaderProperty("mirror","x",4)
    setShaderProperty("mirror","y",2)
	initShader('barrel', 'BarrelBlurEffect')
	setCameraShader('game', 'barrel')
	setCameraShader('hud', 'barrel')
    setShaderProperty('barrel', 'barrel', 0.00)
	setShaderProperty('barrel', 'zoom', 1.0)
    setShaderProperty("barrel","angle",0)
    setShaderProperty("barrel","x",0)
    setShaderProperty("barrel","y",0)
	setShaderProperty('barrel', 'doChroma', true)
	initShader('ca', 'ChromAbEffect')
    setCameraShader('hud', 'ca')
    setCameraShader('game', 'ca')
    setShaderProperty('ca', 'strength', 0)
	initShader('lineas', 'ScanlineEffect')
	setCameraShader('hud', 'lineas')
	setShaderProperty('lineas', 'strength', 0.5)
    setShaderProperty('lineas', 'pixelsBetweenEachLine', 5.0)
	initShader('blur', 'BlurEffect')
	setCameraShader('game', 'blur')
	setCameraShader('hud', 'blur')
    setShaderProperty('blur', 'strength', 10)
	setShaderProperty('blur', 'strengthY', 5)
	initShader('vignette', 'VignetteEffect')
    setCameraShader('hud', 'vignette')
    setCameraShader('game', 'vignette')
    setShaderProperty('vignette', 'strength', 1)
    setShaderProperty('vignette', 'size', 0.3)
end
function start()
	makeSprite("noteAngle","",0,0,1)
    setObjectCamera("noteAngle","hud")
    makeGraphic('noteAngle',1,1,'#000000')

	makeSprite("o","",0.01,0.01,1)
    setObjectCamera("o","hud")
    makeGraphic('o',1,1,'#000000')
    setActorAngle(0.1,"o")
    setProperty("o","width",0.5)

    defaultCamZoom = getCamZoom()
    makeSprite('Black', '', 0, 0, 1)
    makeGraphic("Black",1920/defaultCamZoom, 1080/defaultCamZoom, "#000000")
    setCamera("Black","hud")
end
function songStart()
	tween("Black",{alpha = 0},stepCrochet*0.001*64,"linear")
	tweenShaderProperty("blur","strength",0,stepCrochet*0.001*64,"backIn")
	tweenShaderProperty("blur","strengthY",0,stepCrochet*0.001*64,"backIn")
	tweenShaderProperty("vignette","size",0.15,stepCrochet*0.001*63,"backIn")
	tweenShaderProperty("mirror","x",0,stepCrochet*0.001*64,"cubeOut")
	tweenShaderProperty("mirror","y",0,stepCrochet*0.001*64,"cubeOut")
	tweenShaderProperty("mirror","angle",0,stepCrochet*0.001*64,"cubeOut")
	tweenShaderProperty("mirror","zoom",1,stepCrochet*0.001*64,"cubeOut")
	set("camZooming",true)
end
function stepHit(curStep)
	local section = math.floor(curStep/16)
	if curStep == 56 then
		tweenShaderProperty("barrel","barrel",2,stepCrochet*0.001*8,"cubeIn",0, function ()
			setShaderProperty("barrel","barrel",-1)
			setShaderProperty("bn","strength",0)
			setShaderProperty("lineas","strength",0)
			setShaderProperty("vignette","size",0)
			tweenShaderProperty("barrel","barrel",0.2,stepCrochet*0.001*8,"cubeOut")
			triggerEvent("Screen Shake",(stepCrochet*0.001*56)..",0.002",(stepCrochet*0.001*56)..",0.002")
			flashCamera("hud","white",1)
		end)
	elseif curStep == 120 then
		tweenShaderProperty("vignette","size",0.1,stepCrochet*0.001*4,"cubeOut")
		tweenShaderProperty("bn","strength",1,stepCrochet*0.001*4,"cubeOut")
		tweenShaderProperty("mirror","zoom",2,stepCrochet*0.001*8,"cubeIn",0, function ()
			setShaderProperty("mirror","zoom",0.85)
			tweenShaderProperty("mirror","zoom",1,stepCrochet*0.001*4,"cubeOut")
		end)
		tweenShaderProperty("mirror","angle",360,stepCrochet*0.001*8,"cubeIn",0, function ()
			setShaderProperty("mirror","angle",0)
		end)
		tweenShaderProperty("barrel","barrel",-0.75,stepCrochet*0.001*8,"cubeIn",0, function ()
			flashCamera("hud","white",(stepCrochet*0.001*4))
			setShaderProperty("barrel","barrel",0.35)
			setShaderProperty("bn","strength",0)
			setShaderProperty("vignette","size",0)
			tweenShaderProperty("barrel","barrel",0,stepCrochet*0.001*4,"cubeOut")
		end)
	end
	if curStep == 224 then
		tweenShaderProperty("mirror","angle",7.5,stepCrochet*0.001*4,"cubeOut",0, function ()
			tweenShaderProperty("mirror","angle",-7.5,stepCrochet*0.001*4,"cubeOut",0, function ()
				tweenShaderProperty("mirror","angle",7.5,stepCrochet*0.001*4,"cubeOut",0, function ()
					tweenShaderProperty("mirror","angle",0,stepCrochet*0.001*4,"cubeOut")
				end)
			end)
		end)
	elseif curStep == 256 then
		tweenShaderProperty("vignette","size",0.1,stepCrochet*0.001*4,"cubeOut")
		tweenShaderProperty("bn","strength",1,stepCrochet*0.001*4,"cubeOut")
		tweenShaderProperty("mirror","zoom",2,stepCrochet*0.001*4,"backOut",0, function ()
			tweenShaderProperty("mirror","zoom",1,stepCrochet*0.001*4,"backIn",0, function ()
			end)
		end)
		tweenShaderProperty("mirror","y",-1,stepCrochet*0.001*8,"cubeOut",0, function ()
			setShaderProperty("mirror","y",0)
		end)
		tweenShaderProperty("mirror","x",-1,stepCrochet*0.001*8,"cubeOut",0, function ()
			setShaderProperty("mirror","x",0)
		end)
		tweenShaderProperty("mirror","angle",180,stepCrochet*0.001*8,"cubeOut",0, function ()
			bloomBurst(16,3,1)
			setShaderProperty("bn","strength",0)
			setShaderProperty("vignette","size",0)
			setShaderProperty("mirror","angle",0)
		end)
	elseif curStep == 384 then
		bloomBurst(16,3,1)
		tweenShaderProperty("bn","strength",1,stepCrochet*0.001*4,"cubeOut")
		tweenShaderProperty("lineas","strength",0.5,stepCrochet*0.001*4,"cubeOut")
		tweenShaderProperty("vignette","size",0.1,stepCrochet*0.001*4,"cubeOut")
	elseif curStep == 416 or curStep == 1056 or curStep == 1568 then
		tweenShaderProperty("mirror","angle",7.5,stepCrochet*0.001*4,"cubeOut",0, function ()
			tweenShaderProperty("mirror","angle",-7.5,stepCrochet*0.001*4,"cubeOut")
		end)
	elseif curStep == 428 or curStep == 1068 or curStep == 1580 then
		tweenShaderProperty("mirror","angle",7.5,stepCrochet*0.001*4,"cubeOut",0, function ()
			tweenShaderProperty("mirror","angle",-7.5,stepCrochet*0.001*4,"cubeOut",0, function ()
				tweenShaderProperty("mirror","angle",7.5,stepCrochet*0.001*4,"cubeOut")
			end)
		end)
	elseif curStep == 444 then
		tweenShaderProperty("mirror","angle",-7.5,stepCrochet*0.001*4,"cubeOut",0, function ()
			tweenShaderProperty("mirror","angle",0,stepCrochet*0.001*4,"cubeOut")
			bloomBurst(16,3,1)
			setShaderProperty("bn","strength",0.5)
			setShaderProperty("vignette","size",0)
			setShaderProperty("lineas","strength",0)
			tweenShaderProperty("barrel","barrel",-1.25,stepCrochet*0.001*64,"cubeIn",0, function()
				bloomBurst(16,3,1)
				set("o.x",0.1)
				set("o.y",0.1)
				set("o.angle",10)
				set("o.width",2.5)
				setShaderProperty("barrel","barrel",0.75)
				setShaderProperty("bn","strength",0)
				tweenShaderProperty("barrel","barrel",0.2,stepCrochet*0.001*4,"cubeOut")
			end)
		end)
	end
	if curStep == 568 or curStep == 696 or curStep == 760 or curStep == 952 or curStep == 1016 or curStep == 1144 then
		bloomBurst(8,3,1.5)
		triggerEvent("Screen Shake",(stepCrochet*0.001*8)..",0.003",(stepCrochet*0.001*8)..",0.003")
		setShaderProperty("mirror","angle",-15)
		tween("camGame",{zoom = get("defaultCamZoom")+0.1},stepCrochet*0.001*2,"cubeOut")
		tweenShaderProperty("mirror","angle",0,stepCrochet*0.001*4,"cubeOut",0, function ()
			setShaderProperty("mirror","angle",15)
			tween("camGame",{zoom = get("defaultCamZoom")+0.1},stepCrochet*0.001*2,"cubeOut")
			tweenShaderProperty("mirror","angle",0,stepCrochet*0.001*4,"cubeOut",0, function ()
				tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*4,"cubeOut")
			end)
		end)
	elseif curStep == 632 then
		tween("o",{x = 0.01, y = 0.01, angle = 0.1, width = 0.5},stepCrochet*0.001*7.8,"linear")
		tweenShaderProperty("barrel","barrel",0,stepCrochet*0.001*4,"cubeOut")
		tweenShaderProperty("bn","strength",0.75,stepCrochet*0.001*4,"cubeOut")
		tweenShaderProperty("vignette","size",0.125,stepCrochet*0.001*4,"cubeOut")
	elseif curStep == 640 then
		bloomBurst(8,3,1.15)
		set("o.x",0.1)
		set("o.y",0.1)
		set("o.angle",10)
		set("o.width",2.5)
		setShaderProperty("bn","strength",0)
		setShaderProperty("vignette","size",0)
		setShaderProperty("barrel","barrel",0.2)
	elseif curStep == 704 or curStep == 720 then
		tweenShaderProperty("mirror","zoom",1.2,stepCrochet*0.001*4,"cubeOut",0, function ()
			tweenShaderProperty("mirror","zoom",1.4,stepCrochet*0.001*4,"cubeOut",stepCrochet*0.001*4)
		end)
		tweenShaderProperty("mirror","angle",7.5,stepCrochet*0.001*4,"cubeOut",0, function ()
			tweenShaderProperty("mirror","angle",-7.5,stepCrochet*0.001*4,"cubeOut",stepCrochet*0.001*4)
		end)
	elseif curStep == 736 then
		tweenShaderProperty("mirror","zoom",1.5,stepCrochet*0.001*4,"cubeOut",0, function ()
			tweenShaderProperty("mirror","zoom",1.35,stepCrochet*0.001*4,"cubeOut",stepCrochet*0.001*4, function ()
				tweenShaderProperty("mirror","zoom",1,stepCrochet*0.001*4,"cubeOut")
			end)
		end)
		tweenShaderProperty("mirror","angle",7.5,stepCrochet*0.001*4,"cubeOut",0, function ()
			tweenShaderProperty("mirror","angle",-7.5,stepCrochet*0.001*4,"cubeOut",stepCrochet*0.001*4, function ()
				tweenShaderProperty("mirror","angle",0,stepCrochet*0.001*4,"cubeOut")
			end)
		end)
	elseif curStep == 768 then
		bloomBurst(16,3,1)
		tween("o",{x = 0.01, y = 0.01, angle = 0.1, width = 0.5},stepCrochet*0.001*16,"linear")
		setShaderProperty("bn","strength",1)
		setShaderProperty("blur","strength",2.5)
		setShaderProperty("blur","strengthY",1.25)
		setShaderProperty("ca","strength",0.0015)
		setShaderProperty("vignette","size",0.125)
		setShaderProperty("barrel","barrel",-0.75)
		setShaderProperty("lineas","strength",0.75)
		tweenShaderProperty("barrel","barrel",0,stepCrochet*0.001*4,"cubeOut")
	end
	if curStep == 832 then
		bloomBurst(8,3,1)
		setShaderProperty("bn","strength",0.65)
		setShaderProperty("blur","strength",1)
		setShaderProperty("blur","strengthY",0.5)
		setShaderProperty("ca","strength",0.00075)
		setShaderProperty("vignette","size",0.075)
		setShaderProperty("barrel","barrel",-1.75)
		tweenShaderProperty("barrel","barrel",0,stepCrochet*0.001*4,"cubeOut")
		tweenShaderProperty("lineas","strength",0,stepCrochet*0.001*64,"linear")
		tweenShaderProperty("bn","strength",0.3,stepCrochet*0.001*64,"cubeIn",0, function ()
			bloomBurst(8,3,1)
			setShaderProperty("ca","strength",0)
			setShaderProperty("bn","strength",0)
		end)
		tweenShaderProperty("vignette","size",0,stepCrochet*0.001*64,"cubeIn")
		tweenShaderProperty("blur","strength",0,stepCrochet*0.001*64,"cubeIn")
		tweenShaderProperty("blur","strengthY",0,stepCrochet*0.001*64,"cubeIn")
	end
	if curStep == 1024 or curStep == 1408 then
		tweenShaderProperty("bn","strength",1,stepCrochet*0.001*4,"cubeOut")
		tweenShaderProperty("mirror","y",-2,stepCrochet*0.001*8,"cubeOut",0, function ()
			setShaderProperty("mirror","y",0)
		end)
		tweenShaderProperty("mirror","zoom",1.5,stepCrochet*0.001*4,"cubeOut",0, function ()
			tweenShaderProperty("mirror","zoom",1,stepCrochet*0.001*4,"backOut",0, function ()
				bloomBurst(16,2.5,1)
				setShaderProperty("barrel","barrel",-1)
				setShaderProperty("bn","strength",0)
				tweenShaderProperty("barrel","barrel",0,stepCrochet*0.001*4,"cubeOut")
			end)
		end)
	elseif curStep == 1084 or curStep == 1596 then
		tweenShaderProperty("mirror","angle",-7.5,stepCrochet*0.001*4,"cubeOut",0, function ()
			tweenShaderProperty("mirror","angle",0,stepCrochet*0.001*4,"cubeOut")
		end)
	elseif curStep == 1136 then
		tweenShaderProperty("bn","strength",0.75,stepCrochet*0.001*16,"cubeIn")
		tweenShaderProperty("blur","strength",1.5,stepCrochet*0.001*16,"cubeIn")
		tweenShaderProperty("blur","strengthY",0.5,stepCrochet*0.001*16,"cubeIn")
		tweenShaderProperty("ca","strength",0.0015,stepCrochet*0.001*16,"cubeIn")
		tweenShaderProperty("vignette","size",0.15,stepCrochet*0.001*16,"cubeIn")
	elseif curStep == 1152 then
		set("defaultCamZoom",get("defaultCamZoom")+0.15)
	elseif curStep == 1216 then
		bloomBurst(16,3,1)
		set("defaultCamZoom",get("defaultCamZoom")-0.15)
		tweenShaderProperty("bn","strength",0,stepCrochet*0.001*64,"linear")
		tweenShaderProperty("blur","strength",0,stepCrochet*0.001*64,"linear")
		tweenShaderProperty("blur","strengthY",0,stepCrochet*0.001*64,"linear")
		tweenShaderProperty("ca","strength",0,stepCrochet*0.001*64,"linear")
		tweenShaderProperty("vignette","size",0,stepCrochet*0.001*64,"linear")
	end
	if curStep == 1312 then
		flashCamera("game","white",1)
	end
	if curStep == 1348 or curStep == 1360 or curStep == 1380 or curStep == 1392 then
		tweenShaderProperty("mirror","zoom",1.5,stepCrochet*0.001*4,"cubeOut")
	elseif curStep == 1354 or curStep == 1386 then
		tweenShaderProperty("mirror","zoom",1.25,stepCrochet*0.001*4,"cubeOut")
	elseif curStep == 1366 or curStep == 1398 then
		tweenShaderProperty("mirror","angle",10,stepCrochet*0.001*2,"cubeOut",0, function ()
			tweenShaderProperty("mirror","angle",-10,stepCrochet*0.001*4,"cubeOut",0, function ()
				tweenShaderProperty("mirror","zoom",1,stepCrochet*0.001*4,"cubeOut")
				tweenShaderProperty("mirror","angle",0,stepCrochet*0.001*4,"cubeOut")
			end)
		end)
	end
	if curStep == 1440 then
		tweenShaderProperty("mirror","y",-1,stepCrochet*0.001*8,"cubeOut")
		tweenShaderProperty("mirror","angle",180,stepCrochet*0.001*8,"cubeOut")
	end
	if curStep == 1472 or curStep == 1488 or curStep == 1504 or curStep == 1520 then
		tweenShaderProperty("mirror","zoom",1.25,stepCrochet*0.001*4,"cubeOut",0, function ()
			tweenShaderProperty("mirror","zoom",1.5,stepCrochet*0.001*4,"cubeOut",0, function ()
				tweenShaderProperty("mirror","zoom",1.25,stepCrochet*0.001*4,"cubeOut",0, function ()
					tweenShaderProperty("mirror","zoom",1,stepCrochet*0.001*4,"cubeOut")
				end)
			end)
		end)
		if curStep == 1472 then
			tweenShaderProperty("mirror","x",-1,stepCrochet*0.001*4,"cubeOut",0, function ()
				setShaderProperty("mirror","x",0)
				setShaderProperty("mirror","y",0)
				setShaderProperty("mirror","angle",0)
			end)
		end
	end
	-- coso
	if curStep == 1560 then
		waitTime = stepCrochet*0.001*4
	else
		waitTime = 0
	end
	--
	if curStep == 1536 then
		bloomBurst(16,3,1)
		set("o.x",0.15)
		set("o.y",0.15)
		set("o.angle",12)
		set("o.width",3)
		setShaderProperty("barrel","barrel",0.15)
	end
	if curStep == 1560 or curStep == 1648 then
		tweenShaderProperty("mirror","zoom",1.5,stepCrochet*0.001*4,"cubeOut",0, function ()
			tweenShaderProperty("mirror","zoom",1,stepCrochet*0.001*4,"cubeOut",waitTime)
		end)
	end
	if curStep == 1664 then
		tween("o",{x = 0.01, y = 0.01, angle = 0.1, width = 0.5},stepCrochet*0.001*4,"cubeOut")
		tweemShaderProperty("barrel","barrel",0,stepCrochet*0.001*4,"cubeOut")
		tweenShaderProperty("bn","strength",1,stepCrochet*0.001*4,"cubeOut")
	end
	if curStep == 1672 or curStep == 1728 then
		set("o.x",0.15)
		set("o.y",0.15)
		set("o.angle",12)
		set("o.width",3)
		setShaderProperty("barrel","barrel",0.15)
		bloomBurst(16,3,1)
		setShaderProperty("bn","strength",0)
	end
	if curStep == 1712 then
		tween("o",{x = 0.01, y = 0.01, angle = 0.1, width = 0.5},stepCrochet*0.001*12,"cubeOut")
	end
	if curStep == 1792 then
		tweenShaderProperty("bn","strength",1,stepCrochet*0.001*4,"cubeOut")
		tweenShaderProperty("mirror","zoom",1.5,stepCrochet*0.001*8,"cubeOut",0, function ()
			tweenShaderProperty("mirror","zoom",1,stepCrochet*0.001*8,"cubeOut")
			bloomBurst(16,3,1)
			setShaderProperty("bn","strength",0)
		end)
		tweenShaderProperty("mirror","angle",360,stepCrochet*0.001*16,"cubeOut",0, function ()
			setShaderProperty("mirror","angle",0)
		end)
		tween("o",{x = 0.01, y = 0.01, angle = 0.1, width = 0.5},stepCrochet*0.001*12,"cubeOut")
	end
	if curStep == 1840 then
		tween("Black",{alpha = 1},stepCrochet*0.001*20,"cubeIn")
		tweenShaderProperty("bn","strength",1,stepCrochet*0.001*16,"cubeOut")
		tweenShaderProperty("barrel","barrel",0,stepCrochet*0.001*16,"cubeOut")
	end
	-- Screen Shake
	if curStep == 1544 or curStep == 1608 then -- 16
		triggerEvent("Screen Shake",(stepCrochet*0.001*16)..",0.003",(stepCrochet*0.001*16)..",0.003")
		tween("camGame",{zoom = get("defaultCamZoom")+0.1},stepCrochet*0.001*16,"cubeOut")
	end
	if curStep == 1576 or curStep == 1592 or curStep == 1656 then -- 8
		triggerEvent("Screen Shake",(stepCrochet*0.001*8)..",0.003",(stepCrochet*0.001*8)..",0.003")
		tween("camGame",{zoom = get("defaultCamZoom")+0.1},stepCrochet*0.001*8,"cubeOut")
	end
	if curStep == 1672 then -- 40
		triggerEvent("Screen Shake",(stepCrochet*0.001*40)..",0.003",(stepCrochet*0.001*40)..",0.003")
		tween("camGame",{zoom = get("defaultCamZoom")+0.2},stepCrochet*0.001*40,"cubeOut")
	end
	if curStep == 1728 then -- 64
		triggerEvent("Screen Shake",(stepCrochet*0.001*64)..",0.003",(stepCrochet*0.001*64)..",0.003")
		tween("camGame",{zoom = get("defaultCamZoom")+0.35},stepCrochet*0.001*64,"cubeOut")
	end
	-- notas lkasdjflakjsdflakfjdslkfjslkdfjaslkfdjasklfdjasd
	if curStep == 1152 or curStep == 1192 then -- 1152
		set("1.y",defaultStrum0Y-(40*downscroll))
		tweenActorProperty(1,"angle",get("1.angle")+360,stepCrochet*0.001*8,"cubeOut")
		tween(1,{y = defaultStrum0Y},stepCrochet*0.001*8,"cubeOut")
		set("2.y",defaultStrum0Y-(40*downscroll))
		tweenActorProperty(2,"angle",get("2.angle")+360,stepCrochet*0.001*8,"cubeOut")
		tween(2,{y = defaultStrum0Y},stepCrochet*0.001*8,"cubeOut")
	end
	if curStep  == 1160 or curStep == 1184 then
		set("5.y",defaultStrum0Y-(40*downscroll))
		tweenActorProperty(5,"angle",get("5.angle")+360,stepCrochet*0.001*8,"cubeOut")
		tween(5,{y = defaultStrum0Y},stepCrochet*0.001*8,"cubeOut")
		set("6.y",defaultStrum0Y-(40*downscroll))
		tweenActorProperty(6,"angle",get("6.angle")+360,stepCrochet*0.001*8,"cubeOut")
		tween(6,{y = defaultStrum0Y},stepCrochet*0.001*8,"cubeOut")
	end
	if curStep == 1172 or curStep == 1208 then
		set("0.y",defaultStrum0Y-(40*downscroll))
		tweenActorProperty(0,"angle",get("0.angle")+360,stepCrochet*0.001*8,"cubeOut")
		tween(0,{y = defaultStrum0Y},stepCrochet*0.001*8,"cubeOut")
		set("3.y",defaultStrum0Y-(40*downscroll))
		tweenActorProperty(3,"angle",get("3.angle")+360,stepCrochet*0.001*8,"cubeOut")
		tween(3,{y = defaultStrum0Y},stepCrochet*0.001*8,"cubeOut")
	end
	if curStep == 1176 or curStep == 1204 then
		set("4.y",defaultStrum0Y-(40*downscroll))
		tweenActorProperty(4,"angle",get("4.angle")+360,stepCrochet*0.001*8,"cubeOut")
		tween(4,{y = defaultStrum0Y},stepCrochet*0.001*8,"cubeOut")
		set("7.y",defaultStrum0Y-(40*downscroll))
		tweenActorProperty(7,"angle",get("7.angle")+360,stepCrochet*0.001*8,"cubeOut")
		tween(7,{y = defaultStrum0Y},stepCrochet*0.001*8,"cubeOut")
	end
	if (section >= 0 and section < 8) or (section >= 24 and section < 28) or (section >= 48 and section < 56) or (section >= 112) then
		addZoom(0,"-0.015","-0.03",16)
	elseif (section >= 8 and section < 24) or (section >= 40 and section < 48) or (section >= 82 and section < 112) then
		addZoom(1,"0.03","0.045")
	elseif (section >= 28 and section < 30) or (section >= 32 and curStep < 632) or (section >= 56 and curStep < 1024) or (curStep >= 1032 and section < 72) or (section == 81) then
		addZoom(0,"0.025","0.035",4)
	elseif section == 30 then
		addZoom(0,"0.02","0.03",2)
	elseif section == 31 then
		addZoom(0,"0.015","0.0275",1)
	elseif (section >= 72 and section < 76) then
		addZoom(2,"-0.02","-0.04")
	elseif (section >= 76 and section < 80) then
		addZoom(0,"0.03","0.045",8)
	end
	if (section >= 76 and curStep < 1276) then
		mattBarrel = true
	else
		mattBarrel = false
	end
	if section == 81 then
		if curStep % 4 == 0 then
			shift = shift * -1
			setShaderProperty("barrel","barrel",0.5*shift)
			tweenShaderProperty("barrel","barrel",0,stepCrochet*0.001*4,"cubeOut")
		end
	end
	for i = 1,#bloomCums do
		if curStep == bloomCums[i] then
			bloomBurst(8,3,1)
		end
	end
end
function playerTwoSing(data, time, type)
    if getHealth() - 0.01 > 0.01 then
        setHealth(getHealth() - 0.01)
    else
        setHealth(0.01)
    end
	triggerEvent("Screen Shake","0.1,0.002","0.1,0.002")
	if mattBarrel then
		shift = shift * -1
		setShaderProperty("mirror","zoom",1.3)
		setShaderProperty("mirror","angle",7.5*shift)
		setShaderProperty("barrel","barrel",-0.5*shift)
		tweenShaderProperty("barrel","barrel",0,stepCrochet*0.001*4,"cubeOut")
		tweenShaderProperty("mirror","angle",0,stepCrochet*0.001*4,"cubeOut")
		tweenShaderProperty("mirror","zoom",1,stepCrochet*0.001*4,"cubeOut")
	end
end
function updatePost(elapsed)
	perlinX = perlinX + elapsed*math.random()*perlinSpeed
	perlinY = perlinY + elapsed*math.random()*perlinSpeed
	perlinZ = perlinZ + elapsed*math.random()*perlinSpeed
    setShaderProperty('barrel', 'x', ((-0.5 + perlin(perlinX, 0, 0))*perlinXRange))
	setShaderProperty('barrel', 'y', ((-0.5 + perlin(0, perlinY, 0))*perlinYRange))
	setShaderProperty('barrel', 'angle', ((-0.5 + perlin(0, 0, perlinZ))*perlinZRange))

    perlinXRange = get("o.x")
    perlinYRange = get("o.y")
    perlinZRange = get("o.angle")
    perlinSpeed = get("o.width")
end
function addZoom(mode,camZoom,hudZoom,steps)
	local noseola = -1
	if mode == 0 then
		if curStep % steps == 0 then
			triggerEvent("Add Camera Zoom",camZoom,hudZoom)
		end
	elseif mode == 1 then
		if curStep % 16 == 0 then
			triggerEvent("Add Camera Zoom","-0.015","-0.03")
		elseif curStep % 16 == 8 then
			triggerEvent("Add Camera Zoom",camZoom,hudZoom)
		end
	elseif mode == 2 then
		if curStep % 32 == 8 or curStep % 32 == 24 then
			triggerEvent("Add Camera Zoom",camZoom,hudZoom)
		elseif curStep % 32 == 16 then
			triggerEvent("Add Camera Zoom","-0.015","-0.03")
		elseif curStep % 32 == 20 then
			triggerEvent("Add Camera Zoom",camZoom*tonumber(noseola),hudZoom*tonumber(noseola))
		end
	end
end
function bloomBurst(steps,contrast,contrastTo)
	setShaderProperty("bloom","contrast",contrast)
	tweenShaderProperty("bloom","contrast",contrastTo,stepCrochet*0.001*steps,"cubeOut")
end