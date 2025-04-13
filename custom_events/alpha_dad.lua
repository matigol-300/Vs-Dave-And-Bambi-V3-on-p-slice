function onEvent(name, value1, value2)
if name == 'alpha_dad' then
doTweenAlpha('dad_alpha', 'dad', value1, value2, 'sineInOut')
end
end