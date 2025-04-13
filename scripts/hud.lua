function onCreatePost()
makeLuaText('songName', songName:gsub('-', ' '), 0, 3)
setProperty('songName.y', screenHeight - getProperty 'songName.height')
setProperty('songName.borderSize', 1.25)
addLuaText 'songName'
setPropertyFromClass('backend.ClientPrefs', 'data.timeBarType', 'Time Left')
setProperty('timeBar.x', -10000)
setProperty('timeBarBG.x', -10000)
close(true)
end