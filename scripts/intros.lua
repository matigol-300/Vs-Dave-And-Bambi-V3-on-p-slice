--script by Dave 27
local TagsCounter = {'intro_3', 'intro_2', 'intro_1', 'intro_go'}
function readJson(file)
return callMethodFromClass('tjson.TJSON', 'parse', {getTextFromFile(file..'.json')})
end
function onCreatePost()
if checkFileExists('data/'..songPath..'/introSkin.json') then
for i = 1,#TagsCounter do
local sptitesJson = readJson('data/'..songPath..'/introSkin').counter
local SoundJson = readJson('data/'..songPath..'/introSkin').counterSounds
local sizeJson = readJson('data/'..songPath..'/introSkin').counterSize
local AntialiasingJson = readJson('data/'..songPath..'/introSkin').counterAntialiasing
setProperty('introSoundsSuffix', '-'..SoundJson)
makeLuaSprite(TagsCounter[i], 'intros/'..sptitesJson..'/'..TagsCounter[i], 0, 0)
setObjectCamera(TagsCounter[i], 'camOther')
setProperty(TagsCounter[i]..'.alpha', 0)
setProperty(TagsCounter[i]..'.scale.x', sizeJson)
setProperty(TagsCounter[i]..'.scale.y', sizeJson)
setProperty(TagsCounter[i]..'.antialiasing', AntialiasingJson)
screenCenter(TagsCounter[i], 'xy')
addLuaSprite(TagsCounter[i], true)
end
else
close(true)
end
end
function onCountdownTick(counter)
if checkFileExists('data/'..songPath..'/introSkin.json') then
local fadeEaseJson = readJson('data/'..songPath..'/introSkin').counterFadeEase
local fadeTimeJson = readJson('data/'..songPath..'/introSkin').counterFadeTime
if counter == 0 then
setProperty('intro_3.alpha', 1)
doTweenAlpha('intro_3_alpha', 'intro_3', 0, fadeTimeJson, fadeEaseJson)
elseif counter == 1 then
setProperty('intro_2.alpha', 1)
doTweenAlpha('intro_2_alpha', 'intro_2', 0, fadeTimeJson, fadeEaseJson)
setProperty('countdownReady.visible', false)
elseif counter == 2 then
setProperty('intro_1.alpha', 1)
doTweenAlpha('intro_1_alpha', 'intro_1', 0, fadeTimeJson, fadeEaseJson)
setProperty('countdownSet.visible', false)
elseif counter == 3 then
setProperty('intro_go.alpha', 1)
doTweenAlpha('intro_go_alpha', 'intro_go', 0, fadeTimeJson, fadeEaseJson)
setProperty('countdownGo.visible', false)
elseif counter == 4 then
removeLuaSprite('intro_3', true)
removeLuaSprite('intro_2', true)
removeLuaSprite('intro_1', true)
removeLuaSprite('intro_go', true)
close(true)
end
end
end