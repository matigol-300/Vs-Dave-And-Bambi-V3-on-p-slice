function onCreatePost()
makeLuaSprite('luzbakan', 'bg/spotLight', -50, -200);
setProperty('luzbakan.alpha', 0)
addLuaSprite('luzbakan', true)
end
function onSongStart()
for _, i in ipairs({'boyfriend', 'dad', 'gf', 'GM', 'paja', 'casa', 'piso', 'maiz_1', 'maiz_2', 'cartel_bambi', 'bolsa'}) do
doTweenColor(i..'_colorr', i, 'ffc799', 60, 'sineInOut')
doTweenAlpha('fondo_2_alpha', 'fondo_2', 1, 60, 'sineInOut')
end
end
function onTweenCompleted(tag, vars)
if tag == 'fondo_2_alpha' then
for _, i in ipairs({'boyfriend', 'dad', 'gf', 'GM', 'paja', 'casa', 'piso', 'maiz_1', 'maiz_2', 'cartel_bambi', 'bolsa'}) do
doTweenColor(i..'_colorr', i, '696969', 50, 'sineInOut')
doTweenAlpha('fondo_3_alpha', 'fondo_3', 1, 50, 'sineInOut')
end
end
end
function onMoveCamera(focus)
if focus == 'boyfriend' then
doTweenX('luzbakan_X', 'luzbakan', 820, 1, 'cubeOut')
end
if focus == 'dad' then
doTweenX('luzbakan_X', 'luzbakan', 30, 1, 'cubeOut')
end
end