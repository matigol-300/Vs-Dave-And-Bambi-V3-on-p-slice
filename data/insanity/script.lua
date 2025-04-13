function onCreatePost()
initLuaShader('bg_3d')

makeLuaSprite('bg_3d', 'bg/dave_house/redsky_insanity', -350, -200)
setScrollFactor('bg_3d', 0, 0)
setProperty('bg_3d.visible', false)
setProperty('bg_3d.antialiasing', false)
addLuaSprite('bg_3d', false)

makeLuaSprite('bg_3d_red', 'bg/dave_house/redsky', -350, -200)
setScrollFactor('bg_3d_red', 0, 0)
setProperty('bg_3d_red.visible', false)
setProperty('bg_3d_red.antialiasing', false)
addLuaSprite('bg_3d_red', false)

setSpriteShader('bg_3d', 'bg_3d')
setSpriteShader('bg_3d_red', 'bg_3d')
end
function onUpdate()
setShaderFloat('bg_3d', "uTime", getSongPosition()/1800)
setShaderFloat('bg_3d', "uWaveAmplitude", 0.04)
setShaderFloat('bg_3d', "uSpeed", 5)
setShaderFloat('bg_3d', "uFrequency", 5)

setShaderFloat('bg_3d_red', "uTime", getSongPosition()/1800)
setShaderFloat('bg_3d_red', "uWaveAmplitude", 0.04)
setShaderFloat('bg_3d_red', "uSpeed", 5)
setShaderFloat('bg_3d_red', "uFrequency", 5)
end