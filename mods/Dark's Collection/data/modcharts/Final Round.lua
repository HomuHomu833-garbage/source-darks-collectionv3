local time = 0
local perlinX = 0
local perlinY = 0
local perlinZ = 0
local perlinSpeed = 0.5 
local perlinXRange = 0.01
local perlinYRange = 0.01
local perlinZRange = 0.1

function start (song)

	print(song)
    
    makeSprite("BlackBox", "BlackBox", -500, -500, 10)
    setObjectCamera("BlackBox", "hud")
    setActorAlpha(1, "BlackBox")
	makeSprite("Final Round Credits", "Final Round Credits", -1500, -1100, 1)
    setObjectCamera("Final Round Credits", "hud")
    setActorAlpha(1, "Final Round Credits")
	makeSprite("Final Round","Final Round",0,0,0.5)
    setObjectCamera("Final Round","hud")
    setActorAlpha(0,"Final Round")
end

function createPost()

	initShader('mirrorGame', 'MirrorRepeatEffect') 
	setCameraShader('game', 'mirrorGame')
	setShaderProperty('mirrorGame', 'zoom', 1)
	setShaderProperty('mirrorGame','x',0)
	setShaderProperty('mirrorGame','y',0)
	setShaderProperty('mirrorGame','angle', 0)
	initShader('MirrorRepeatEffect', 'BarrelBlurEffect')
	setCameraShader('game', 'MirrorRepeatEffect')
	setCameraShader('hud', 'MirrorRepeatEffect')
	setShaderProperty('MirrorRepeatEffect', 'zoom', 1)
	setShaderProperty('MirrorRepeatEffect','x',0)
	setShaderProperty('MirrorRepeatEffect','y',0)
	setShaderProperty('MirrorRepeatEffect','angle', 0)
	setShaderProperty('MirrorRepeatEffect', 'barrel', 0.0)
	setShaderProperty('MirrorRepeatEffect', 'doChroma', true)
	initShader('chroma', 'ChromAbEffect')
    setCameraShader('game', 'chroma')
    setCameraShader('hud', 'chroma')
    setCustomShaderFloat('chroma', 'strength', 0.006)
	initShader("grayscale","GreyscaleEffect")
    setCameraShader('game', 'grayscale')
    setCameraShader('hud', 'grayscale')
    setShaderProperty("grayscale","strength", 1)
	initShader('PerlinSmokeEffect', 'PerlinSmokeEffect')
    setCameraShader('game', 'PerlinSmokeEffect')
    setCameraShader('hud', 'PerlinSmokeEffect')
    setShaderProperty("PerlinSmokeEffect","waveStrength",0)
    setShaderProperty("PerlinSmokeEffect","smokeStrength",0.7)
	initShader('bloom', 'BloomEffect')
	setCameraShader('game', 'bloom')
	setCameraShader('hud', 'bloom')
	setShaderProperty("bloom","contrast",1)
	initShader('barrel', 'BarrelBlurEffect')
	setCameraShader('game', 'barrel')
	setCameraShader('hud', 'barrel')
	setShaderProperty('barrel', 'barrel', 0.0)
	setShaderProperty('barrel', 'zoom', 1.0)
	setShaderProperty('barrel', 'doChroma', true)
	initShader('blur', 'BlurEffect')
    setCameraShader('game', 'blur')
    setCameraShader('hud', 'blur')
    setShaderProperty('blur', 'strength', 5)
	initShader('ScanlineEffect', 'ScanlineEffect')
    setCameraShader('game', 'ScanlineEffect')
    setShaderProperty('ScanlineEffect', 'strength', 0)
    setShaderProperty('ScanlineEffect', 'pixelsBetweenEachLine', 10)
	initShader('vignette', 'VignetteEffect')
    setCameraShader('hud', 'vignette')
    setCameraShader('game', 'vignette')
    setShaderProperty('vignette', 'strength', 8)
    setShaderProperty('vignette', 'size', 0)

end

function bloomBurst()
    setShaderProperty("bloom","contrast",7)
    tweenShaderProperty("bloom","contrast",1,stepCrochet*0.001*8,"cubeOut")
end

function update(elapsed)

    time = time + elapsed
    setCustomShaderFloat('PerlinSmokeEffect', 'iTime', time)

	perlinX = perlinX + elapsed*math.random()*perlinSpeed
	perlinY = perlinY + elapsed*math.random()*perlinSpeed
	perlinZ = perlinZ + elapsed*math.random()*perlinSpeed
    setShaderProperty('barrel', 'x', ((-0.5 + perlin(perlinX, 0, 0))*perlinXRange))
	setShaderProperty('barrel', 'y', ((-0.5 + perlin(0, perlinY, 0))*perlinYRange))
	setShaderProperty('barrel', 'angle', ((-0.5 + perlin(0, 0, perlinZ))*perlinZRange))

end

function stepHit( step )
	if curStep == 1280 or curStep == 2560 then
        if not middlescroll then
			tweenPosOut("ratingsGroup",-280,getActorY("ratingsGroup"),0.85)
				for i = 0,3 do
					tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+320,0.01,"linear")
					tweenActorProperty(i,"alpha",0.2,1,"linear")
				end
				for i = 4,7 do
					tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-320,0.3,"linear")
				end
			end
		end
	if curStep == 1536 or curStep == 2816 then
        if not middlescroll then
			tweenPosOut("ratingsGroup",0,getActorY("ratingsGroup"),0.85)
            for i = 0,3 do
                tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]-20,0.01,"linear")
				tweenActorProperty(i,"alpha",1,1,"linear")
            end
            for i = 4,7 do
                tweenActorProperty(i,"x",_G["defaultStrum"..i.."X"]+20,0.3,"linear")
            end
        end
    end
	if curStep == 256 or curStep == 248 or curStep == 375 or curStep == 632 or curStep == 696 or curStep == 824 or curStep == 952 or curStep == 1208 then
        for i = 0, 18 do
            tweenPosXAngle(i, _G['defaultStrum'..i..'X'],getActorAngle(i) + 360, 0.6, 'setDefault')
        end
	end
	if curStep == 128 then 
        tweenPosOut("Final Round Credits",0,0,0.5)
		tweenShaderProperty('chroma', 'strength', 0, stepCrochet*0.001*2, 'cubeOut')
		tweenShaderProperty('blur', 'strength', 0, stepCrochet*0.001*2, 'cubeOut')
    end
    if curStep == 256 then 
        tweenPosOut("Final Round Credits",1610,0,0.5)
    end
	if curStep == 512 or curStep == 1792 then
		tweenFadeOut("Final Round",0.5,0.1,"")
    end
    if curStep == 767 or curStep == 2047 then
		tweenFadeIn("Final Round",0,0.1,"")
		tweenShaderProperty('vignette', 'size', 0.3, stepCrochet*0.001*4, 'cubeIn')
	elseif curStep == 1023 or curStep == 2303 then
		tweenShaderProperty('vignette', 'size', 0, stepCrochet*0.001*4, 'cubeOut')
	end
	if curStep == 512 or curStep == 1791 then
        perlinXRange = 0.2 
        perlinYRange = 0.2 
        perlinZRange = 10 
        perlinSpeed = 1.5 
    end
    if curStep == 767 or curStep == 2047 then
        perlinXRange = 0.01 
        perlinYRange = 0.01
        perlinZRange = 0.1
        perlinSpeed = 0.5
    end
	if curStep == 3136 or curStep == 4288 then
        perlinXRange = 0.3 
        perlinYRange = 0.2 
        perlinZRange = 10 
        perlinSpeed = 3 
    end
    if curStep == 3647 or curStep == 4800 then
        perlinXRange = 0.01 
        perlinYRange = 0.01
        perlinZRange = 0.1
        perlinSpeed = 0.5
    end
	if curStep == 3776 then
        perlinXRange = 0.3 
        perlinYRange = 0.2 
        perlinZRange = 12.5 
        perlinSpeed = 1.5 
    end
    if curStep == 4032 then
        perlinXRange = 0.01 
        perlinYRange = 0.01
        perlinZRange = 0.1
        perlinSpeed = 0.5
    end
	if curStep == 112 or curStep == 240 or curStep == 496 or curStep == 752 or curStep == 1008 or curStep == 1264 or curStep == 1520 or curStep == 1775 or curStep == 2032 or curStep == 2288 or curStep == 2544 or curStep == 2800 or curStep == 3632 or curStep == 4016 or curStep == 4784 then -- brillito tio
		tweenShaderProperty('bloom','contrast', 50, stepCrochet*0.001*20, 'cubeIn')
	end
	if curStep == 129 or curStep == 256 or curStep == 512 or curStep == 768 or curStep == 1024 or curStep == 1280 or curStep == 1536 or curStep == 1791 or curStep == 2047 or curStep == 2304 or curStep == 2560 or curStep == 2815 or curStep == 3647 or curStep == 4032 or curStep == 4800 then -- adios brillito
		tweenShaderProperty('bloom','contrast', 1, stepCrochet*0.001*20, 'cubeOut')
	end
	if curStep == 77 then
        tweenFadeOut("BlackBox",0,5,"")
		tweenShaderProperty("grayscale", "strength", 0, stepCrochet*0.001*16, "cubeIn")
	end
    if curStep == 187 then
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 4.5, crochet*0.001*17, 'cubeIn')
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 360, crochet*0.001*20, 'cubeIn')
		tweenShaderProperty("grayscale", "strength", 0.8, stepCrochet*0.001*15, "cubeIn")
	elseif curStep == 256 then
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.003*2, 'cubeOut')
		tweenShaderProperty("grayscale", "strength", 0, stepCrochet*0.001*10, "cubeIn")
		tweenShaderProperty('chroma', 'strength', 0, stepCrochet*0.001*2, 'cubeOut')
		tweenShaderProperty('blur', 'strength', 0, stepCrochet*0.001*2, 'cubeOut')
	end
	if curStep == 315 then
		setShaderProperty('MirrorRepeatEffect', 'barrel', -8)
		tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*4, 'cubeOut')
	end
	if curStep == 480 or curStep == 1760 or curStep == 3616 or curStep == 4000 or curStep == 4768 then
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1.6, stepCrochet*0.001*11, 'cubeIn')
		tweenShaderProperty('MirrorRepeatEffect', 'barrel', 3, crochet*0.001*11, 'cubeIn')
	elseif curStep == 511 or curStep == 1792 or curStep == 3648 or curStep == 4032 or curStep == 4800 then
		setShaderProperty('MirrorRepeatEffect', 'barrel', -8)
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.002*2, 'cubeOut')
		tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.002*4, 'cubeOut')
	end

	-- de un lado a otro del bf y del matt

	if curStep == 528 or curStep == 592 or curStep == 656 or curStep == 720 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 370, crochet*0.001*1, 'cubeIn')
	elseif curStep == 536 or curStep == 600 or curStep == 664 or curStep == 727 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 360, crochet*0.001*2, 'cubeOut')
	elseif curStep == 560 or curStep == 624 or curStep == 688 or curStep == 752 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 350, crochet*0.001*1, 'cubeIn')
	elseif curStep == 568 or curStep == 631 or curStep == 695 or curStep == 760 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 360, crochet*0.001*2, 'cubeOut')
	end
	if curStep == 736 or curStep == 992 or curStep == 2048 then
		tweenShaderProperty("grayscale", "strength", 0.8, stepCrochet*0.001*15, "cubeIn")
	elseif curStep == 769 or curStep == 1024 or curStep == 2288 then
		tweenShaderProperty("grayscale", "strength", 0, stepCrochet*0.001*10, "cubeOut")
	end
	if curStep == 768 or curStep == 2048 then
		tweenShaderProperty('ScanlineEffect', 'strength', 5, crochet*0.001*2, 'cubeOut')
	elseif curStep == 1024 or curStep == 2304 then
		tweenShaderProperty('ScanlineEffect', 'strength', 0, crochet*0.001*2, 'cubeOut')
	end
	if curStep == 771 then
		tweenShaderProperty("grayscale", "strength", 0.6, stepCrochet*0.001*4, "cubeIn")
	end
	if curStep == 1024 then
		tweenShaderProperty('chroma', 'strength', 0.006, stepCrochet*0.001*2, 'cubeOut')
	end

	-- parte del 0:42 nose como lo hice gg

	if curStep == 1024 or curStep == 1040 or curStep == 1052 or curStep == 1072 or curStep == 1096 or curStep == 1112 or curStep == 1128 or curStep == 1144 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 375, crochet*0.001*1, 'cubeIn')
	elseif curStep == 1028 or curStep == 1044 or curStep == 1056 or curStep == 1076 or curStep == 1100 or curStep == 1116 or curStep == 1132 or curStep == 1148 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 360, crochet*0.001*1, 'cubeOut')
	elseif curStep == 1032 or curStep == 1046 or curStep == 1064 or curStep == 1088 or curStep == 1104 or curStep == 1120 or curStep == 1136 or curStep == 1152 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 345, crochet*0.001*1, 'cubeIn')
	elseif curStep == 1036 or curStep == 1050 or curStep == 1068 or curStep == 1092 or curStep == 1108 or curStep == 1124 or curStep == 1140 or curStep == 1156 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 360, crochet*0.001*1, 'cubeOut')
	end

	-- el zoom 

	if curStep == 1080 or curStep == 2360 then 
		tweenShaderProperty('mirrorGame', 'zoom', 8, crochet*0.001*3, 'backOut')
	elseif curStep == 1088 or curStep == 2368 then
		tweenShaderProperty('mirrorGame', 'zoom', 1, crochet*0.001*2, 'backIn')
	end

	-- parte del bf nose como lo hice gg

	if curStep == 1160 or curStep == 1174 or curStep == 1190 or curStep == 1206 or curStep == 1222 or curStep == 1238 or curStep == 1254 or curStep == 1270 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 375, crochet*0.001*1, 'cubeIn')
	elseif curStep == 1164 or curStep == 1178 or curStep == 1194 or curStep == 1210 or curStep == 1226 or curStep == 1242 or curStep == 1258 or curStep == 1274 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 360, crochet*0.001*1, 'cubeOut')
	elseif curStep == 1168 or curStep == 1182 or curStep == 1198 or curStep == 1214 or curStep == 1230 or curStep == 1246 or curStep == 1262 or curStep == 1278 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 345, crochet*0.001*1, 'cubeIn')
	elseif curStep == 1172 or curStep == 1186 or curStep == 1202 or curStep == 1218 or curStep == 1234 or curStep == 1250 or curStep == 1266 or curStep == 1282 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 360, crochet*0.001*1, 'cubeOut')
	end

	-- parte del 0:53 nose como lo hice gg
	
	if curStep == 1288 or curStep == 1303 or curStep == 1315 or curStep == 1327 or curStep == 1339 or curStep == 1351 or curStep == 1363 or curStep == 1375 or curStep == 1387 or curStep == 1399 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 370, crochet*0.001*1, 'cubeOut')
	elseif curStep == 1292 or curStep == 1306 or curStep == 1318 or curStep == 1330 or curStep == 1342 or curStep == 1354 or curStep == 1366 or curStep == 1378 or curStep == 1390 or curStep == 1402 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 360, crochet*0.001*1, 'cubeOut')
	elseif curStep == 1296 or curStep == 1309 or curStep == 1321 or curStep == 1333 or curStep == 1345 or curStep == 1357 or curStep == 1369 or curStep == 1381 or curStep == 1393 or curStep == 1405 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 350, crochet*0.001*1, 'cubeOut')
	elseif curStep == 1300 or curStep == 1312 or curStep == 1324 or curStep == 1336 or curStep == 1348 or curStep == 1360 or curStep == 1372 or curStep == 1384 or curStep == 1396 or curStep == 1408 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 360, crochet*0.001*1, 'cubeOut')
	end

	-- parte del bf nose como lo hice gg 2 (del 0:53)

	if curStep == 1411 or curStep == 1423 or curStep == 1435 or curStep == 1447 or curStep == 1459 or curStep == 1471 or curStep == 1483 or curStep == 1495 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 370, crochet*0.001*1, 'cubeOut')
	elseif curStep == 1414 or curStep == 1426 or curStep == 1438 or curStep == 1450 or curStep == 1462 or curStep == 1474 or curStep == 1486 or curStep == 1498 or curStep == 1529 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 360, crochet*0.001*1, 'cubeOut')
	elseif curStep == 1417 or curStep == 1429 or curStep == 1441 or curStep == 1453 or curStep == 1465 or curStep == 1477 or curStep == 1489 or curStep == 1501 or curStep == 1532 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 350, crochet*0.001*1, 'cubeOut')
	elseif curStep == 1420 or curStep == 1432 or curStep == 1444 or curStep == 1456 or curStep == 1468 or curStep == 1480 or curStep == 1492 or curStep == 1504 or curStep == 1535 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 360, crochet*0.001*1, 'cubeOut')
	elseif curStep == 1506 or curStep == 1514 or curStep == 1522 then
     	tweenShaderProperty('MirrorRepeatEffect', 'angle', 370, crochet*0.001*1, 'cubeOut')
    elseif curStep == 1510 or curStep == 1518 or curStep == 1526 then
	    tweenShaderProperty('MirrorRepeatEffect', 'angle', 350, crochet*0.001*1, 'cubeOut')
	end

	if curstep == 1536 then
		tweenShaderProperty('chroma', 'strength', 0, stepCrochet*0.001*2, 'cubeOut')
	end

	-- de un lado a otro del bf y del matt segunda parte

	if curStep == 1808 or curStep == 1872 or curStep == 1936 or curStep == 2000 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 370, crochet*0.001*1, 'cubeIn')
	elseif curStep == 1816 or curStep == 1880 or curStep == 1944 or curStep == 2008 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 360, crochet*0.001*2, 'cubeOut')
	elseif curStep == 1840 or curStep == 1904 or curStep == 1968 or curStep == 2032 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 350, crochet*0.001*1, 'cubeIn')
	elseif curStep == 1848 or curStep == 1912 or curStep == 1976 or curStep == 2042 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 360, crochet*0.001*2, 'cubeOut')
	end

	-- parte del 1:36 nose como lo hice gg2

	if curStep == 2304 or curStep == 2320 or curStep == 2336 or curStep == 2352 or curStep == 2376 or curStep == 2392 or curStep == 2408 or curStep == 2424 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 375, crochet*0.001*1, 'cubeIn')
	elseif curStep == 2308 or curStep == 2324 or curStep == 2340 or curStep == 2356 or curStep == 2380 or curStep == 2396 or curStep == 2412 or curStep == 2428 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 360, crochet*0.001*1, 'cubeOut')
	elseif curStep == 2312 or curStep == 2328 or curStep == 2344 or curStep == 2368 or curStep == 2384 or curStep == 2400 or curStep == 2416 or curStep == 2432 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 345, crochet*0.001*1, 'cubeIn')
	elseif curStep == 2316 or curStep == 2332 or curStep == 2348 or curStep == 2372 or curStep == 2388 or curStep == 2404 or curStep == 2420 or curStep == 2436 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 360, crochet*0.001*1, 'cubeOut')
	end

	-- bf parte del 1:36

	if curStep == 2440 or curStep == 2456 or curStep == 2472 or curStep == 2488 or curStep == 2504 or curStep == 2520 or curStep == 2536 or curStep == 2552 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 375, crochet*0.001*1, 'cubeIn')
	elseif curStep == 2444 or curStep == 2460 or curStep == 2476 or curStep == 2492 or curStep == 2508 or curStep == 2524 or curStep == 2540 or curStep == 2556 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 360, crochet*0.001*1, 'cubeOut')
	elseif curStep == 2448 or curStep == 2464 or curStep == 2480 or curStep == 2496 or curStep == 2512 or curStep == 2528 or curStep == 2544 or curStep == 2560 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 345, crochet*0.001*1, 'cubeIn')
	elseif curStep == 2452 or curStep == 2468 or curStep == 2484 or curStep == 2500 or curStep == 2516 or curStep == 2532 or curStep == 2548 or curStep == 2564 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 360, crochet*0.001*1, 'cubeOut')
    end

    if curStep == 2560 then
		tweenShaderProperty('chroma', 'strength', 0.02, stepCrochet*0.001*2, 'cubeOut')
	elseif curStep == 2816 then
		tweenShaderProperty('chroma', 'strength', 0, stepCrochet*0.001*2, 'cubeOut')
	end
	-- parte del 1:46 

	if curStep == 2568 or curStep == 2583 or curStep == 2595 or curStep == 2607 or curStep == 2619 or curStep == 2631 or curStep == 2643 or curStep == 2655 or curStep == 2667 or curStep == 2679 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 370, crochet*0.001*1, 'cubeOut')
	elseif curStep == 2572 or curStep == 2586 or curStep == 2598 or curStep == 2610 or curStep == 2622 or curStep == 2634 or curStep == 2646 or curStep == 2658 or curStep == 2670 or curStep == 2682 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 360, crochet*0.001*1, 'cubeOut')
	elseif curStep == 2576 or curStep == 2589 or curStep == 2601 or curStep == 2613 or curStep == 2625 or curStep == 2637 or curStep == 2649 or curStep == 2661 or curStep == 2673 or curStep == 2685 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 350, crochet*0.001*1, 'cubeOut')
	elseif curStep == 2580 or curStep == 2592 or curStep == 2604 or curStep == 2616 or curStep == 2628 or curStep == 2640 or curStep == 2652 or curStep == 2664 or curStep == 2676 or curStep == 2688 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 360, crochet*0.001*1, 'cubeOut')
	end

	-- parte del bf del 1:46

	if curStep == 2691 or curStep == 2703 or curStep == 2715 or curStep == 2727 or curStep == 2739 or curStep == 2751 or curStep == 2763 or curStep == 2775 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 370, crochet*0.001*1, 'cubeOut')
	elseif curStep == 2694 or curStep == 2706 or curStep == 2718 or curStep == 2730 or curStep == 2742 or curStep == 2754 or curStep == 2766 or curStep == 2778 or curStep == 2809 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 360, crochet*0.001*1, 'cubeOut')
	elseif curStep == 2697 or curStep == 2709 or curStep == 2721 or curStep == 2733 or curStep == 2745 or curStep == 2757 or curStep == 2769 or curStep == 2781 or curStep == 2812 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 350, crochet*0.001*1, 'cubeOut')
	elseif curStep == 2700 or curStep == 2712 or curStep == 2724 or curStep == 2736 or curStep == 2748 or curStep == 2760 or curStep == 2772 or curStep == 2784 or curStep == 2815 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 360, crochet*0.001*1, 'cubeOut')
	elseif curStep == 2786 or curStep == 2794 or curStep == 2802 then
     	tweenShaderProperty('MirrorRepeatEffect', 'angle', 370, crochet*0.001*1, 'cubeOut')
    elseif curStep == 2790 or curStep == 2798 or curStep == 2806 then
	    tweenShaderProperty('MirrorRepeatEffect', 'angle', 350, crochet*0.001*1, 'cubeOut')
	end

	-- los colores
	local section = math.floor(curStep/16)

	if (section >= 80 and section < 96) then 
        if curStep  % 20 == 0 then 
            --green
            setStageColorSwap('hue', 0.6)
        elseif curStep  % 20  == 3 then 
            --green
            setStageColorSwap('hue', 0.8)
        elseif curStep  % 20 == 6 then 
            --green
            setStageColorSwap('hue', 0.4)
        elseif curStep  % 20 == 9 then 
            --green
            setStageColorSwap('hue', 0.2)
        elseif curStep  % 20 == 12 then 
            --green
            setStageColorSwap('hue', 0.9)
        elseif curStep  % 20 == 15 then
                --green
            setStageColorSwap('hue', 0)
        elseif curStep  % 20 == 18 then
			--nose
			setStageColorSwap('hue', 0.5)
        elseif curStep  % 20 == 21 then
        end
    end
	if (section >= 160 and section < 176) then 
        if curStep  % 20 == 0 then 
            --green
            setStageColorSwap('hue', 0.6)
        elseif curStep  % 20  == 3 then 
            --green
            setStageColorSwap('hue', 0.8)
        elseif curStep  % 20 == 6 then 
            --green
            setStageColorSwap('hue', 0.4)
        elseif curStep  % 20 == 9 then 
            --green
            setStageColorSwap('hue', 0.2)
        elseif curStep  % 20 == 12 then 
            --green
            setStageColorSwap('hue', 0.9)
        elseif curStep  % 20 == 15 then
                --green
            setStageColorSwap('hue', 0)
        elseif curStep  % 20 == 18 then
		    --que
			setStageColorSwap('hue', 0.5)
        elseif curStep  % 20 == 21 then
        end
    end

   -- cambio a la segunda parte
   
   if curStep == 2848 then
	    tweenShaderProperty('MirrorRepeatEffect', 'zoom', 0.3, stepCrochet*0.001*30, 'backIn')
		tweenShaderProperty('MirrorRepeatEffect', 'barrel', 1, crochet*0.001*12, 'cubeIn')
		tweenShaderProperty('bloom','contrast', 50, stepCrochet*0.001*30, 'cubeIn')
   elseif curStep == 2880 then
    	setShaderProperty('MirrorRepeatEffect', 'barrel', -8)
	    tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.002*4, 'cubeOut')
	    tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.002*4, 'cubeOut')
		tweenShaderProperty('bloom','contrast', 1, stepCrochet*0.001*10, 'cubeOut')
    end
	if curStep == 3136 or curStep == 4288 then
	    tweenShaderProperty('vignette', 'size', 0.3, stepCrochet*0.001*4, 'cubeIn')
	elseif curStep == 3391 or curStep == 4543 then
		tweenShaderProperty('vignette', 'size', 0, stepCrochet*0.001*4, 'cubeOut')
	end
	if curStep == 2896 or curStep == 2960 or curStep == 3024 or curStep == 3088 or curStep == 3664 or curStep == 3728 or curStep == 4044 or curStep == 4108 or curStep == 4172 or curStep == 4236 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 325, stepCrochet*0.001*4, 'cubeInOut')
	elseif curStep == 2900 or curStep == 2964 or curStep == 3028 or curStep == 3092 or curStep == 3668 or curStep == 3732 or curStep == 4048 or curStep == 4112 or curStep == 4176 or curStep == 4240 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 360, stepCrochet*0.001*25, 'cubeOut')
	elseif curStep == 2928 or curStep == 2992 or curStep == 3056 or curStep == 3120 or curStep == 3696 or curStep == 3760 or curStep == 4076 or curStep == 4140 or curStep == 4204 or curStep == 4268 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 395, stepCrochet*0.001*4, 'cubeInOut')
	elseif curStep == 2932 or curStep == 2996 or curStep == 3060 or curStep == 3124 or curStep == 3700 or curStep == 3764 or curStep == 4080 or curStep == 4144 or curStep == 4208 or curStep == 4272 then
		tweenShaderProperty('MirrorRepeatEffect', 'angle', 360, stepCrochet*0.001*25, 'cubeOut')
	elseif curStep == 2908 or curStep == 2942 or curStep == 2972 or curStep == 3004 or curStep == 3036 or curStep == 3068 or curStep == 3100 or curStep == 3132 then
	    tweenShaderProperty('mirrorGame', 'zoom', 1.4, stepCrochet*0.001*4, 'cubeIn')
	elseif curStep == 2912 or curStep == 2946 or curStep == 2976 or curStep == 3008 or curStep == 3040 or curStep == 3072 or curStep == 3104 or curStep == 3136 then 
		tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.002*10, 'cubeOut')
	elseif curStep == 3676 or curStep == 3708 or curStep == 3740 or curStep == 3772 or curStep == 4060 or curStep == 4092 or curStep == 4124 or curStep == 4156 or curStep == 4188 or curStep == 4220 or curStep == 4252 or curStep == 4284 then
	    tweenShaderProperty('mirrorGame', 'zoom', 1.4, stepCrochet*0.001*4, 'cubeIn')
		tweenShaderProperty('bloom','contrast', 40, stepCrochet*0.001*3, 'cubeIn')
	elseif curStep == 3680 or curStep == 3712 or curStep == 3744 or curStep == 3776 or curStep == 4064 or curStep == 4096 or curStep == 4128 or curStep == 4160 or curStep == 4192 or curStep == 4224 or curStep == 4256 or curStep == 4288 then 
		tweenShaderProperty('mirrorGame', 'zoom', 1, stepCrochet*0.002*10, 'cubeOut')
		tweenShaderProperty('bloom','contrast', 1, stepCrochet*0.002*3, 'cubeOut')
	end

	-- primer fase lento

	if curStep == 2893 or curStep == 3021 or curStep == 2926 or curStep == 2958 or curStep == 2990 or curStep == 3054 or curStep == 3086 or curStep == 3118 or curStep == 4044 or curStep == 4076 or curStep == 4108 or curStep == 4140 or curStep == 4172 or curStep == 4204 or curStep == 4236 or curStep == 4268 then
		tweenShaderProperty('bloom','contrast', 40, stepCrochet*0.001*4, 'cubeIn')
	elseif curStep == 2896 or curStep == 3025 or curStep == 2930 or curStep == 2962 or curStep == 2994 or curStep == 3058 or curStep == 3090 or curStep == 3122 or curStep == 4048 or curStep == 4080 or curStep == 4112 or curStep == 4144 or curStep == 4176 or curStep == 4208 or curStep == 4240 or curStep == 4272 then
		tweenShaderProperty('bloom','contrast', 1, stepCrochet*0.002*4, 'cubeOut')
	elseif curStep == 2908 or curStep == 2940 or curStep == 2972 or curStep == 3004 or curStep == 3036 or curStep == 3068 or curStep == 3100 or curStep == 3132 then
		tweenShaderProperty('bloom','contrast', 40, stepCrochet*0.001*3, 'cubeIn')
	elseif curStep == 2912 or curStep == 2944 or curStep == 2976 or curStep == 3008 or curStep == 3040 or curStep == 3072 or curStep == 3104 or curStep == 3136 then
		tweenShaderProperty('bloom','contrast', 1, stepCrochet*0.002*3, 'cubeOut')
	end

	if curStep == 3553 or curStep == 3616 or curStep == 3936 or curStep == 4000 then
		tweenShaderProperty("grayscale", "strength", 1, stepCrochet*0.001*4, "cubeIn")
	elseif curStep == 3584 or curStep == 3648 or curStep == 3968 or curStep == 4032 then
		tweenShaderProperty("grayscale", "strength", 0, stepCrochet*0.001*4, "cubeOut")
	elseif curStep == 4800 then
		tweenShaderProperty("grayscale", "strength", 1, stepCrochet*0.001*115, "cubeIn")
	end

	-- segunda fase lento 

	if curStep == 3662 or curStep == 3694 or curStep == 3726 or curStep == 3758 or curStep == 3774 then
		tweenShaderProperty('bloom','contrast', 40, stepCrochet*0.001*4, 'cubeIn')
	elseif curStep == 3664 or curStep == 3698 or curStep == 3730 or curStep == 3762 or curStep == 3778 then
		tweenShaderProperty('bloom','contrast', 1, stepCrochet*0.002*4, 'cubeOut')
	end
	if curStep == 4832 then
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 15, stepCrochet*0.001*250, 'cubeIn')
		tweenShaderProperty('blur', 'strength', 30, stepCrochet*0.001*212, 'cubeIn')
	end
	if curStep == 4832 then
		tweenFadeIn("BlackBox",3,12,"")
	end
	if curStep == 3391 or curStep == 3776 then
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, stepCrochet*0.001*4, 'linear')
		tweenShaderProperty('MirrorRepeatEffect', 'barrel', 1, crochet*0.001*4, 'linear')
	elseif curStep == 3520 or curStep == 3904 then
		setShaderProperty('MirrorRepeatEffect', 'barrel', -8)
		tweenShaderProperty('MirrorRepeatEffect', 'zoom', 1, crochet*0.001*4, 'cubeOut')
		tweenShaderProperty('MirrorRepeatEffect', 'barrel', 0, crochet*0.001*4, 'cubeOut')
	 end

	if (section >= 180 and section < 196) then 
        if curStep  % 20 == 0 then 
            --green
            setStageColorSwap('hue', 0.6)
        elseif curStep  % 20  == 3 then 
            --green
            setStageColorSwap('hue', 0.8)
        elseif curStep  % 20 == 6 then 
            --green
            setStageColorSwap('hue', 0.4)
        elseif curStep  % 20 == 9 then 
            --green
            setStageColorSwap('hue', 0.2)
        elseif curStep  % 20 == 12 then 
            --green
            setStageColorSwap('hue', 0.9)
        elseif curStep  % 20 == 15 then
                --green
            setStageColorSwap('hue', 0)
        elseif curStep  % 20 == 18 then
		    --que
			setStageColorSwap('hue', 0.5)
        elseif curStep  % 20 == 21 then
        end
    end
	if (section >= 228 and section < 237) then 
        if curStep  % 20 == 0 then 
            --green
            setStageColorSwap('hue', 0.6)
        elseif curStep  % 20  == 3 then 
            --green
            setStageColorSwap('hue', 0.8)
        elseif curStep  % 20 == 6 then 
            --green
            setStageColorSwap('hue', 0.4)
        elseif curStep  % 20 == 9 then 
            --green
            setStageColorSwap('hue', 0.2)
        elseif curStep  % 20 == 12 then 
            --green
            setStageColorSwap('hue', 0.9)
        elseif curStep  % 20 == 15 then
                --green
            setStageColorSwap('hue', 0)
        elseif curStep  % 20 == 18 then
		    --que
			setStageColorSwap('hue', 0.5)
        elseif curStep  % 20 == 21 then
        end
    end
	if (section >= 252 and section < 268) then 
        if curStep  % 20 == 0 then 
            --green
            setStageColorSwap('hue', 0.6)
        elseif curStep  % 20  == 3 then 
            --green
            setStageColorSwap('hue', 0.8)
        elseif curStep  % 20 == 6 then 
            --green
            setStageColorSwap('hue', 0.4)
        elseif curStep  % 20 == 9 then 
            --green
            setStageColorSwap('hue', 0.2)
        elseif curStep  % 20 == 12 then 
            --green
            setStageColorSwap('hue', 0.9)
        elseif curStep  % 20 == 15 then
                --green
            setStageColorSwap('hue', 0)
        elseif curStep  % 20 == 18 then
		    --que
			setStageColorSwap('hue', 0.5)
        elseif curStep  % 20 == 21 then
        end
    end
end

function playerTwoSing(data, time, type)
    if getHealth() - 0.035 > 0 then
        setHealth(getHealth() - 0.020)
    else
        setHealth(0.020)
    end
end