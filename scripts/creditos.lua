--script by Dave 27
local creditsText = 'Song by '
function readJson(file)
return callMethodFromClass('tjson.TJSON', 'parse', {getTextFromFile(file..'.json')})
end
local cartelSkinJson = readJson('data/'..songPath..'/credits').cartelSkin
local cartelANTIJson = readJson('data/'..songPath..'/credits').cartelAntialiasing
local cartelYJson = readJson('data/'..songPath..'/credits').cartelY
local isAnimatedJson = readJson('data/'..songPath..'/credits').isAnimated
local nameAnimJson = readJson('data/'..songPath..'/credits').nameAnim
local frameAnimeJson = readJson('data/'..songPath..'/credits').frameAnim
local creadorJson = readJson('data/'..songPath..'/credits').songCreator
local textFontJson = readJson('data/'..songPath..'/credits').TextFont
local isAnim = isAnimatedJson
function onUpdate(elapsed)
setProperty('por.x', getProperty('creditosbakanes.x') + 5)
setProperty('iconoloco.x', getProperty('creditosbakanes.x') + getProperty('por.width'))
end
function onCreatePost()
if getPropertyFromClass('backend.ClientPrefs', 'data.language') == 'pt-ESP' then
creditsText = 'Cancion por '
end
if getPropertyFromClass('backend.ClientPrefs', 'data.language') == 'pt-BR' then
creditsText = 'Canção de '
end
makeLuaText('por', creditsText..creadorJson, 0, 0, 100)
setObjectCamera('por', 'camOther')
setTextFont('por', textFontJson)
setTextSize('por', 25)
addLuaText('por')

makeLuaSprite('iconoloco', 'credits/'..creadorJson, -20, 80)
scaleObject('iconoloco', 0.6, 0.6)
setObjectCamera('iconoloco', 'camOther')
addLuaSprite('iconoloco', true)

if isAnim == false then
makeLuaSprite('creditosbakanes', 'credits_skin/'..cartelSkinJson, -screenWidth, cartelYJson)
scaleObject('creditosbakanes', getProperty('por.width') / screenWidth * 4.8, 0.8)
setObjectCamera('creditosbakanes', 'camOther')
setProperty('creditosbakanes.antialiasing', cartelANTIJson)
addLuaSprite('creditosbakanes', true)
else
makeAnimatedLuaSprite('creditosbakanes', 'credits_skin/'..cartelSkinJson, -screenWidth, cartelYJson)
addAnimationByPrefix('creditosbakanes', 'idle', nameAnimJson, frameAnimeJson, true)
scaleObject('creditosbakanes', getProperty('por.width') / screenWidth * 4.8, 0.8)
setObjectCamera('creditosbakanes', 'camOther')
setProperty('creditosbakanes.antialiasing', cartelANTIJson)
addLuaSprite('creditosbakanes', true)
end
setObjectOrder('por', getObjectOrder('creditosbakanes') + 1)
setObjectOrder('iconoloco', getObjectOrder('creditosbakanes') + 1)
end
function onSongStart()
doTweenX('pizaraX', 'creditosbakanes', -5, 0.5, 'backOut')	
runTimer('creditosfin', 3)
end
function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'creditosfin' then
doTweenX('pizaraXFIN', 'creditosbakanes', -screenWidth, 1, 'backIn')	
end
end
function onTweenCompleted(tag, vars)
if tag == 'pizaraXFIN' then
removeLuaSprite('creditosbakanes', true)
removeLuaSprite('iconoloco', true)
removeLuaText('por', true)
close(true)
end
end