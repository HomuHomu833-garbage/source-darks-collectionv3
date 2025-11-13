function createPost()
     makeSprite('blackBG', '', 0, 0, 1)
    makeGraphic('blackBG', 1920 / getCamZoom(), 1080 / getCamZoom(), '#ffffff')
    actorScreenCenter('blackBG')
    setActorScroll(0, 0, 'blackBG')
    setActorAlpha(0, 'blackBG')
    setActorLayer('blackBG', getActorLayer('dadCharacter0'))
end
function badApple(s)
    if s then
     setActorAlpha(1, 'blackBG')
     setActorRTXProperty("dad","CFred",0)
    setActorRTXProperty("dad","CFgreen",0)
    setActorRTXProperty("dad","CFblue",0)
    setActorRTXProperty("dad","CFfade",0) 

     setActorRTXProperty("boyfriend","CFred",0)
    setActorRTXProperty("boyfriend","CFgreen",0)
    setActorRTXProperty("boyfriend","CFblue",0)
    setActorRTXProperty("boyfriend","CFfade",0) 
    else
        setActorAlpha(0, 'blackBG')
          setActorRTXProperty("boyfriend","CFred",255)
    setActorRTXProperty("boyfriend","CFgreen",255)
    setActorRTXProperty("boyfriend","CFblue",255)
    setActorRTXProperty("boyfriend","CFfade",1) 
     setActorRTXProperty("dad","CFred",255)
    setActorRTXProperty("dad","CFgreen",255)
    setActorRTXProperty("dad","CFblue",255)
    setActorRTXProperty("dad","CFfade",1) 
    end
end