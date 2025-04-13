local dialogoTexto = {}
local dialogoNum = 1
local dialogoSpeed = 0
local dialogoFin = true
function onCreatePost()
makeLuaText('dialogo_texto', 'test ', 0, 0, (downscroll and 150 or 520))
setTextSize('dialogo_texto', 35)
setObjectCamera('dialogo_texto', 'camOther')
setProperty('dialogo_texto.alpha', 0)
addLuaText('dialogo_texto')
end
function onEvent(n, v1, v2)
if n == 'dialogue' then
cancelTimer('dialogo_fin')
dialogoFin = true
setProperty('dialogo_texto.alpha', 0)
doTweenAlpha('dialogo_texto_alpha', 'dialogo_texto', 1, 0.5, 'sineInOut')
dialogoNum = 1
dialogoSpeed = v2
dialogoTexto = {}
local currentLanguage = getPropertyFromClass('backend.ClientPrefs', 'data.language')
local currentialogue = 'dialogue_'..v1
local text = callMethodFromClass('tjson.TJSON', 'parse', {getTextFromFile('dialogues_song/'..songPath..'.json')})
local dialogo = ""
for i = 1,#text[currentLanguage][currentialogue] do
dialogo = dialogo .. text[currentLanguage][currentialogue]:sub(i, i)
table.insert(dialogoTexto, dialogo)
end
end
end
function onUpdatePost(elapsed)
dialogoNum = dialogoNum + dialogoSpeed
if dialogoNum < #dialogoTexto then
setTextString('dialogo_texto', dialogoTexto[math.ceil(dialogoNum)])
end
screenCenter('dialogo_texto', 'x')
if getTextString('dialogo_texto') == dialogoTexto[#dialogoTexto] and dialogoFin == true then
dialogoFin = false
runTimer('dialogo_fin', 0.5)
end
end
function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'dialogo_fin' then
doTweenAlpha('dialogo_texto_alpha', 'dialogo_texto', 0, 0.5, 'sineInOut')
end
end