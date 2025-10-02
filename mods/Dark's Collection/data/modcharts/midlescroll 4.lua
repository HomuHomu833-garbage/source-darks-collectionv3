

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
end