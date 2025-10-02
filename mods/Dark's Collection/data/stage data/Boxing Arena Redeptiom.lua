-- posiciones originales
origY1, origY2, origY3 = 0, 0, 0
timer, step,time = 0, 0,0

function createPost()
    initShader("ajedrez","chess")
    setActorShader("undefinedSprite0","ajedrez") 
    setShaderProperty("ajedrez","transparency",0.2)
    setShaderProperty("ajedrez","chessSize",0.03)
    setShaderProperty("ajedrez","direction",-1)
    origY1 = get("undefinedSprite1.y")
    origY2 = get("undefinedSprite2.y")
    origY3 = get("undefinedSprite3.y")
end

function update(elapsed)
    timer = timer + elapsed
    time = time + elapsed * 0.5
    setShaderProperty("ajedrez","iTime",time)
    if step == 0 and timer >= 3 then
        tween("undefinedSprite3", {y = origY3 + 150}, 0.3, "cubeIn", 0)
        step, timer = 1, 0
    elseif step == 1 and timer >= 0.3 then
        tween("undefinedSprite3", {y = origY3}, 0.3, "cubeOut", 0)
        step, timer = 2, 0
    elseif step == 2 and timer >= 0.3 then
        tween("undefinedSprite2", {y = origY2 + 150}, 0.3, "cubeIn", 0)
        step, timer = 3, 0
    elseif step == 3 and timer >= 0.3 then
        tween("undefinedSprite2", {y = origY2}, 0.3, "cubeOut", 0)
        step, timer = 4, 0
    elseif step == 4 and timer >= 0.3 then
        tween("undefinedSprite1", {y = origY1 + 150}, 0.3, "cubeIn", 0)
        step, timer = 5, 0
    elseif step == 5 and timer >= 0.3 then
        tween("undefinedSprite1", {y = origY1}, 0.3, "cubeOut", 0)
        step, timer = 6, 0
    elseif step == 6 and timer >= 0.3 then
        step, timer = 0, 0 -- reinicia
    end
end
