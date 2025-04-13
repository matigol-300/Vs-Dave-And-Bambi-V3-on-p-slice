function onEndSong()
if callMethodFromClass('backend.Highscore', 'getScore', {songName, 'Hard'}) < 144350 then
if score > 144350 then
playSound('higher_score')
addAchievementScore('dave', 1)
end
end
end