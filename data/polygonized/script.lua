local puedecambirnota = false
local rtx = false
function onCreatePost()
addLuaScript('scripts/extras/3d_notes')
initLuaShader('bg_3d')

makeLuaSprite('bg_3d_red', 'bg/dave_house/redsky', -350, -200)
setScrollFactor('bg_3d_red', 0, 0)
setProperty('bg_3d_red.antialiasing', false)
addLuaSprite('bg_3d_red', false)

setSpriteShader('bg_3d_red', 'bg_3d')
loadGraphic('fondo', 'bg/sky/sky_night')
startTween('dad_Y', 'dad', {y = -100}, 2, {ease = 'sineInOut', type = 'PINGPONG'})
if getModSetting('shapeLOCO') then
makeLuaSprite('avertencialoca', 'notes_and_mechanics/shapeNoteWarning', 0, 800)
setObjectCamera('avertencialoca', 'other')
addLuaSprite('avertencialoca', true)
end
makeLuaSprite('rtx_ending', 'bg/dave_house/rtx_ending', 0, 0)
setProperty('rtx_ending.visible', false)
setObjectCamera('rtx_ending', 'other')
addLuaSprite('rtx_ending', true)
end
function onSongStart()
if getModSetting('shapeLOCO') then
doTweenY('avertencialocaY', 'avertencialoca', 450, 1, 'elasticOut')	
runTimer('avertencialocafin', 4)
end
end
function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'avertencialocafin' then
doTweenY('avertencialocaYfin', 'avertencialoca', 800, 1, 'elasticIn')	
end
end
function onTweenCompleted(tag, vars)
if tag == 'avertencialocaYfin' then
removeLuaSprite('avertencialoca', true)
end
end
function onUpdatePost(elapsed)
setShaderFloat('bg_3d_red', "uTime", getSongPosition()/1800)
setShaderFloat('bg_3d_red', "uWaveAmplitude", 0.04)
setShaderFloat('bg_3d_red', "uSpeed", 5)
setShaderFloat('bg_3d_red', "uFrequency", 5)
if not mustHitSection then
cameraSetTarget('dad')
end
for i = 0, getProperty('notes.length') - 1 do
if getModSetting('shapeLOCO') then
if keyboardPressed('SPACE') then
if getPropertyFromGroup('notes', i, 'mustPress') then
setPropertyFromGroup('notes', i, 'multAlpha', 0.5)
setPropertyFromGroup('notes', i, 'blockHit', true)
if getPropertyFromGroup('notes', i, 'noteType') == 'note shape' then
setPropertyFromGroup('notes', i, 'multAlpha', 1)
setPropertyFromGroup('notes', i, 'blockHit', false)
end
end
else
if getPropertyFromGroup('notes', i, 'mustPress') then
setPropertyFromGroup('notes', i, 'multAlpha', 1)
setPropertyFromGroup('notes', i, 'blockHit', false)
if getPropertyFromGroup('notes', i, 'noteType') == 'note shape' then
setPropertyFromGroup('notes', i, 'multAlpha', 0.5)
setPropertyFromGroup('notes', i, 'blockHit', true)
end
end
end
end
end
end
function onEvent(n,v1,v2)
if n == 'eyesores' and string.lower(v1) == 'on' then	  
rtx = true
end
if n == 'eyesores' and string.lower(v1) == 'of' then	 
rtx = false
end
if n == 'polygonized_end' then
cancelTween('dad_Y')
triggerEvent('Change Character', 'dad', 'dave')
triggerEvent('Hey!', 'bf', 1)
triggerEvent('Hey!', 'gf', 1)
removeLuaSprite('bg_3d_red', true)
for _, i in ipairs({'boyfriend', 'dad', 'gf', 'pasto', 'gate', 'pasto_fondo', 'montanas'}) do
setProperty(i..'.color', getColorFromHex('696969'))
end
end
end
function onGameOver()
if rtx == true then
openCustomSubstate('rtxEnding', true)
return Function_Stop
end
end
function onCustomSubstateCreatePost(name)
if name == 'rtxEnding' then
unlockAchievement('rtx')
cameraShake('camGAME', 0.01, 0.01)
runHaxeCode([[game.camGame.setFilters([]); game.camHUD.setFilters([]);]]);
setProperty('rtx_ending.visible', true)
playMusic('rtx', 0.8, true)
end
end
function onCustomSubstateUpdatePost(name)
if name == 'rtxEnding' then
if keyJustPressed('accept') then
playSound('confirmMenu')
endSong()
end
end
end
function onEndSong()
if callMethodFromClass('backend.Highscore', 'getScore', {songName, 'Hard'}) < 281230 then
if score > 281230 then
playSound('higher_score')
addAchievementScore('dave', 1)
end
end
end