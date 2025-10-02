
function createPost()
    -- makeSprite('topBar', 'topBar', -1200, 700, 1)
    --makeGraphic('topBar',4000,720,'0xFF000000')
    --actorScreenCenter('topBar')
    --setActorLayer('topBar', layershit)
    --setActorY(-650,'topBar')
   -- setObjectCamera('topBar', 'hud')
   -- setActorAlpha(1, "topBar")

   -- makeSprite('bottomBar', 'bottomBar', -1200, 700, 1)
   -- makeGraphic('bottomBar',4000,720,'0xFF000000')
   -- actorScreenCenter('bottombar')
   -- setActorLayer('bottomBar', layershit)
   -- setActorY(650,'bottomBar')
   -- setObjectCamera('bottomBar', 'hud')
    --setActorAlpha(1, "bottomBar")
    initShader('bars', 'bars')--
    setCameraShader('game', 'bars')
    setShaderProperty('bars', 'effect', 0.1)



end