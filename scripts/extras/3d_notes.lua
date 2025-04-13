local puedecambirnota = false
function onCreatePost()
for i = 0, getProperty('opponentStrums.length')-1 do
setPropertyFromGroup('opponentStrums', i, 'texture', 'notes_and_mechanics/NOTE_assets-3D');			
end
for i = 0, getProperty('unspawnNotes.length')-1 do
if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') and getPropertyFromGroup('unspawnNotes', i, 'texture') ~= 'notes_and_mechanics/NOTE_assets_Shape' then
setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes_and_mechanics/NOTE_assets-3D');	
setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', true)		
end			
end
end
function onSpawnNote(membersIndex, noteData, noteType, isSustainNote, strumTime)
if puedecambirnota == true and getPropertyFromGroup('unspawnNotes', membersIndex, 'texture') ~= 'notes_and_mechanics/NOTE_assets_Shape' then
setPropertyFromGroup('unspawnNotes', membersIndex, 'texture', 'notes_and_mechanics/NOTE_assets-3D');
setPropertyFromGroup('unspawnNotes', membersIndex, 'rgbShader.enabled', true)	
end
end
function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
if getPropertyFromGroup('notes', membersIndex, 'texture') == 'notes_and_mechanics/NOTE_assets-3D' or getPropertyFromGroup('notes', membersIndex, 'texture') == 'notes_and_mechanics/NOTE_assets_Shape' then
setProperty('ratingsData[0].image', 'rating/3D/sick')
setProperty('ratingsData[1].image', 'rating/3D/good')
setProperty('ratingsData[2].image', 'rating/3D/bad')
setProperty('ratingsData[3].image', 'rating/3D/shit')
else
setProperty('ratingsData[0].image', 'sick')
setProperty('ratingsData[1].image', 'good')
setProperty('ratingsData[2].image', 'bad')
setProperty('ratingsData[3].image', 'shit')
end
end
function onBeatHit()
puedecambirnota = getRandomBool(50)
end	 
function onSongStart()
for i = 0, getProperty('opponentStrums.length')-1 do
setPropertyFromGroup('opponentStrums', i, 'texture', 'notes_and_mechanics/NOTE_assets-3D');			
end
end