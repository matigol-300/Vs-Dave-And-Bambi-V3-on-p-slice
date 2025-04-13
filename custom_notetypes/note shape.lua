function onCreate()
for i = 0, getProperty('unspawnNotes.length') - 1 do
if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'note shape' then	
if getModSetting('shapeLOCO') then    
setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes_and_mechanics/NOTE_assets_Shape')	
setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', false)	
if getPropertyFromGroup('unspawnNotes', i, 'noteData') == 0 then
setPropertyFromGroup('unspawnNotes', i, 'offsetX', 10)	
elseif getPropertyFromGroup('unspawnNotes', i, 'noteData') == 1 then
setPropertyFromGroup('unspawnNotes', i, 'offsetX', 10)	
elseif getPropertyFromGroup('unspawnNotes', i, 'noteData') == 2 then
setPropertyFromGroup('unspawnNotes', i, 'offsetX', 10)	
end
end
end
end	 
end