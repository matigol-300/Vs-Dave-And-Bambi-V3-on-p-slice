function onCreatePost()
initLuaShader("eyesore")
makeLuaSprite("temporaryShader")
makeGraphic("temporaryShader", screenWidth, screenHeight)
setSpriteShader("temporaryShader", "eyesore")
setShaderFloat("temporaryShader", "uSpeed", 1)
setShaderFloat("temporaryShader", "uFrequency", 2)
setShaderFloat("temporaryShader", "uWaveAmplitude", 1)
addHaxeLibrary("ShaderFilter", "openfl.filters")
runHaxeCode([[
game.camGame.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
]])
end
function enableEyeSores(thing)
setShaderBool("temporaryShader", "uEnabled", thing)
end
function onEvent(n, v1, v2)
if n == 'eyesores' and string.lower(v1) == 'on' then	  
enableEyeSores(true)
end
if n == 'eyesores' and string.lower(v1) == 'of' then	  
enableEyeSores(false)
end
end
function onUpdate()
songPos = getSongPosition()
currentBeat = (songPos/5000)*(curBpm/60)
setShaderFloat("temporaryShader", "uTime", currentBeat)	
if getShaderBool("temporaryShader", "uEnabled") then
setShaderFloat("temporaryShader", "uampmul", 0.5)
else
setShaderFloat("temporaryShader", "uampmul", getShaderFloat("temporaryShader", "uampmul") - 0.01)
end
end
