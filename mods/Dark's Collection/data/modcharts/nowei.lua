function stepHit(curStep)
    if curStep == 0 then -- middle scroll lado enemigo
        if not middlescroll then
            for i = 1,9 do 
                for i = 1,9 do
                    tweenPosOut(i-1,getActorX(i-1)+330,getActorY(i-1),0.85)
                end
            end
            for i = 9,17 do
                tweenFadeOut(i,0,0.85)
            end
        end
    end
    if curStep == 0 then -- middle scroll bf IMPORTANTE PONERLO DESPUES DEL EL DEL LADO DEL ENEMIGO
        if not middlescroll then
            tweenPosOut("ratingsGroup",-280,getActorY("ratingsGroup"),0.85)
            for i = 10,18 do
                for i = 10,18 do
                    tweenPosOut(i-1,getActorX(i-1)-300,getActorY(i-1),0.85)
                    tweenFadeIn(i-1,1,0.85)
                end
            end
            for i= 1,9 do
                for i = 1,9 do
                    tweenPosOut(i-1,getActorX(i-1)-350,getActorY(i-1),0.85)
                end
                tweenFadeOut(i-1,0,0.85)
            end
        end
    end
    if curStep == 0 then -- normal
        tweenPosOut("ratingsGroup",0,getActorY("ratingsGroup"),0.85)
        if not middlescroll then
            for i = 10,18 do
                for i = 10,18 do
                    tweenPosOut(i-1,getActorX(i-1)+300,getActorY(i-1),0.85)
                end
            end
            for i = 0,9 do
                for i = 0,9 do
                    tweenPosOut(i-1,getActorX(i-1)+20,getActorY(i-1),0.85)
                end
            end
            for i = 0,8 do
                tweenFadeIn(i,1,0.85)
            end
        end
    end
end