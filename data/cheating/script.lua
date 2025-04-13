function onCreatePost()
addLuaScript('scripts/extras/3d_notes')
startTween('dad_Y', 'dad', {y = 100}, 2, {ease = 'sineInOut', type = 'PINGPONG'})
if getModSetting('CheatingLOCO') then
noteTweenX('notadad_0', 0, 1100, 3, 'sineInOut')
noteTweenX('notadad_1', 1, 1100, 2, 'sineInOut')
noteTweenX('notadad_2', 2, 1100, 2, 'sineInOut')
noteTweenX('notadad_3', 3, 1100, 3, 'sineInOut')

noteTweenX('notabf_0', 4, 100, 3, 'sineInOut')
noteTweenX('notabf_1', 5, 100, 2, 'sineInOut')
noteTweenX('notabf_2', 6, 100, 2, 'sineInOut')
noteTweenX('notabf_3', 7, 100, 3, 'sineInOut')
end
end
function onTweenCompleted(tag, vars)
if tag == 'dadyloco0' then
doTweenY('dadyloco1', 'dad', -100, 2, 'sineInOut')
end
if tag == 'dadyloco1' then
doTweenY('dadyloco0', 'dad', 200, 2, 'sineInOut')
end
if tag == 'notadad_0' then
noteTweenX('notadad_4', 0, defaultOpponentStrumX0, 3, 'sineInOut')
noteTweenX('notabf_0', 4, defaultPlayerStrumX0, 3, 'sineInOut')
end
if tag == 'notadad_1' then
noteTweenX('notadad_5', 1, defaultOpponentStrumX1, 2, 'sineInOut')
noteTweenX('notabf_1', 5, defaultPlayerStrumX1, 2, 'sineInOut')
end
if tag == 'notadad_2' then
noteTweenX('notadad_6', 2, defaultOpponentStrumX2, 3, 'sineInOut')
noteTweenX('notabf_2', 6, defaultPlayerStrumX2, 2, 'sineInOut')
end
if tag == 'notadad_3' then
noteTweenX('notadad_7', 3, defaultOpponentStrumX3, 2, 'sineInOut')
noteTweenX('notabf_3', 7, defaultPlayerStrumX3, 3, 'sineInOut')
end
if tag == 'notadad_4' then
noteTweenX('notadad_0', 0, 1100, 3, 'sineInOut')
noteTweenX('notabf_0', 4, 100, 3, 'sineInOut')
end
if tag == 'notadad_5' then
noteTweenX('notadad_1', 1, 1100, 2, 'sineInOut')
noteTweenX('notabf_1', 5, 100, 2, 'sineInOut')
end
if tag == 'notadad_6' then
noteTweenX('notadad_2', 2, 1100, 2, 'sineInOut')
noteTweenX('notabf_2', 6, 100, 2, 'sineInOut')
end
if tag == 'notadad_7' then
noteTweenX('notadad_3', 3, 1100, 3, 'sineInOut')
noteTweenX('notabf_3', 7, 100, 3, 'sineInOut')
end
end
function onUpdate(elapsed)
if not mustHitSection then
cameraSetTarget('dad')
end
end
function onSongStart()
if getModSetting('CheatingLOCO') == false then
unlockAchievement('cheating')
end
end