contadordebf = 0
contadordad = 0
function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
local strumTime = getPropertyFromGroup('notes', membersIndex, 'strumTime')    
for i = 0, getProperty('notes.length')-1 do
if i ~= membersIndex and not getPropertyFromGroup('notes', i, 'mustPress') then
local otherStrumTime = getPropertyFromGroup('notes', i, 'strumTime')
local otherNoteData = getPropertyFromGroup('notes', i, 'noteData')
if math.abs(strumTime - otherStrumTime) < 0.05 and noteData ~= otherNoteData and not isSustainNote then
CrearFantasmaDAD()
break
end
end
end
end
function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
local currentTime = getSongPosition()
local strumTime = getPropertyFromGroup("notes", membersIndex, "strumTime")
for i = 0, getProperty('notes.length')-1 do
if i ~= membersIndex and getPropertyFromGroup('notes', i, 'mustPress') then
local otherStrumTime = getPropertyFromGroup('notes', i, 'strumTime')
local otherNoteData = getPropertyFromGroup('notes', i, 'noteData')
if math.abs(strumTime - otherStrumTime) < 0.05 and noteData ~= otherNoteData and not isSustainNote then
CrearFantasmaBF()
break
end
end
end
end
function CrearFantasmaBF()
contadordebf = contadordebf + 1
makeAnimatedLuaSprite('Fantasmabf'..contadordebf, getProperty('boyfriend.imageFile'), getProperty('boyfriend.x'), getProperty('boyfriend.y'))
addAnimationByPrefix('Fantasmabf'..contadordebf, 'animacion', getProperty('boyfriend.animation.frameName'), 0, false)
setProperty('Fantasmabf'..contadordebf..'.flipX', getProperty('boyfriend.flipX'))
setProperty('Fantasmabf'..contadordebf..'.color', getIconColor('boyfriend'))
setProperty('Fantasmabf'..contadordebf..'.angle', getProperty('boyfriend.angle'))
setProperty('Fantasmabf'..contadordebf..'.offset.x', getProperty('boyfriend.offset.x'))
setProperty('Fantasmabf'..contadordebf..'.offset.y', getProperty('boyfriend.offset.y'))
doTweenAlpha('borrar'..contadordebf, 'Fantasmabf'..contadordebf, 0, 0.7, 'sineInOut')
setProperty('Fantasmabf'..contadordebf..'.scale.x', getProperty('boyfriend.scale.x'))
setProperty('Fantasmabf.'..contadordebf..'scale.x', getProperty('boyfriend.scale.y'))
setObjectOrder('Fantasmabf'..contadordebf, getObjectOrder('boyfriendGroup') - 1)	
addLuaSprite('Fantasmabf'..contadordebf, false)
end
function CrearFantasmaDAD()
contadordad = contadordad + 1
makeAnimatedLuaSprite('Fantasmadad'..contadordad, getProperty('dad.imageFile'), getProperty('dad.x'), getProperty('dad.y'))
addAnimationByPrefix('Fantasmadad'..contadordad, 'animacion', getProperty('dad.animation.frameName'), 0, false)
setProperty('Fantasmadad'..contadordad..'.flipX', getProperty('dad.flipX'))
setProperty('Fantasmadad'..contadordad..'.color', getIconColor('dad'))
setProperty('Fantasmadad'..contadordad..'.angle', getProperty('dad.angle'))
setProperty('Fantasmadad'..contadordad..'.offset.x', getProperty('dad.offset.x'))
setProperty('Fantasmadad'..contadordad..'.offset.y', getProperty('dad.offset.y'))
doTweenAlpha('borrardad'..contadordad, 'Fantasmadad'..contadordad, 0, 0.7, 'sineInOut')
setProperty('Fantasmadad'..contadordad..'.scale.x', getProperty('dad.scale.x'))
setProperty('Fantasmadad.'..contadordad..'scale.x', getProperty('dad.scale.y'))
setObjectOrder('Fantasmadad'..contadordad, getObjectOrder('dadGroup') - 1)	
addLuaSprite('Fantasmadad'..contadordad, false)
end
function onTweenCompleted(tag, vars)
if string.find(tag, 'borrar') then
removeLuaSprite(tag:gsub('borrar', 'Fantasmabf'), true)
end		
if string.find(tag, 'borrardad') then
removeLuaSprite(tag:gsub('borrardad', 'Fantasmadad'), true)
end		
end
function getIconColor(chr)
local chr = chr or "dad"
return getColorFromHex(rgbToHex(getProperty(chr .. ".healthColorArray")))
end	
function rgbToHex(array)
return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end