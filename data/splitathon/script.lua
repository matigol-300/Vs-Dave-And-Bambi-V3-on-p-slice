function onCreatePost()
makeLuaSprite('icono_bambi', nil, -200, getProperty('iconP2.y'))
loadGraphic('icono_bambi', 'icons/icon-bambi', 150, 150)
setObjectCamera('icono_bambi', 'other')
addLuaSprite('icono_bambi', true)

setProperty('picni.alpha', 1)
setProperty('fondo_3.alpha', 1)
for _, i in ipairs({'boyfriend', 'dad', 'gf', 'GM', 'paja', 'casa', 'piso', 'maiz_1', 'maiz_2', 'cartel_bambi', 'bolsa', 'picni'}) do
setProperty(i..'.color', getColorFromHex('696969'))
end
end
function onUpdate(elapsed)
setProperty('icono_bambi.angle', getProperty('iconP2.angle'))
setProperty('icono_bambi.scale.x', getProperty('iconP2.scale.x'))
setProperty('icono_bambi.scale.y', getProperty('iconP2.scale.y'))
end
function onEvent(n,v1,v2)
if n == 'Change Character' then
setProperty('dave_y_bambi.color', getColorFromHex('696969'))
setProperty('dad.color', getColorFromHex('696969'))
end
if n == 'events_splitathon' and string.lower(v1) == 'dave_achievement' then	
if misses <= 10 then
unlockAchievement('dave_Splitathon')
end
end
if n == 'events_splitathon' and string.lower(v1) == 'bambi_icon' then	
doTweenX('icono_bambi_X', 'icono_bambi', getProperty('iconP2.x'), 0.3, 'circOut')
end
if n == 'events_splitathon' and string.lower(v1) == 'bambi_idle' then	
playAnim('dave_y_bambi', 'bambi_idle', true)
end
if n == 'events_splitathon' and string.lower(v1) == 'dave_happy' then	
playAnim('dave_y_bambi', 'dave_happy', true)
end
if n == 'events_splitathon' and string.lower(v1) == 'bambi_achievement' then	
if misses <= 20 then
unlockAchievement('Bambi_Splitathon')
end
end
if n == 'events_splitathon' and string.lower(v1) == 'bambi_corn' then	
playAnim('dave_y_bambi', 'bambi_corn', true)
end
end
function onTweenCompleted(tag, vars)
if tag == 'icono_bambi_X' then
removeLuaSprite('icono_bambi', true)
makeLuaSprite('icono_dave', 'icons/icon-dave-ohno', getProperty('iconP2.x'), getProperty('iconP2.y'))
setObjectCamera('icono_dave', 'other')
doTweenY('icono_dave_Y', 'icono_dave', (downscroll and -50 or 200), 0.5, 'cubeOut')
doTweenX('icono_dave_X', 'icono_dave', 0, 3, 'sineInOut')
addLuaSprite('icono_dave', true)
end
if tag == 'icono_dave_Y' then
doTweenY('icono_daveYfin', 'icono_dave', 900, 2, 'cubeIn')
end
end