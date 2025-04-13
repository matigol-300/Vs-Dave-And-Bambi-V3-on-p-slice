function onCreatePost()
initLuaShader('bg_3d')
setSpriteShader('bg', 'bg_3d')
end
function onUpdate()
setShaderFloat('bg', "uTime", getSongPosition()/1900)
setShaderFloat('bg', "uWaveAmplitude", 0.06)
setShaderFloat('bg', "uSpeed", 7)
setShaderFloat('bg', "uFrequency", 5)
end