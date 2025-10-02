-- Bv

function onEvent(name, position, argument1, argument2)
    if string.lower(name) == "camera-rotate" then
        tweenCameraAngleIn( argument1, argument2)
        playSound("cameraFlip", true)
    end
end

function onCreate()
	createSound('cameraFlip', 'cameraFlip')
end