function onEndSong()
if callMethodFromClass('backend.Highscore', 'getFCState', {songName, 'Hard'}) == false then
if misses == 0 then
if week == 'dave' then
playSound('higher_score')
addAchievementScore('dave', 1)
end
if week == 'bambi' then
playSound('higher_score')
addAchievementScore('bambi', 1)
end
end
end
end