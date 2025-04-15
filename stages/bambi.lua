function onBeatHit()
if curBeat % 0.4 == 0 and getProperty('dave_y_bambi.animation.curAnim.name') == 'dave_bruh' then
playAnim('dave_y_bambi', 'dave_bruh', true)
elseif curBeat % 0.4 == 0 and getProperty('dave_y_bambi.animation.curAnim.name') == 'dave_happy' then
playAnim('dave_y_bambi', 'dave_happy', true)
elseif curBeat % 0.4 == 0 and getProperty('dave_y_bambi.animation.curAnim.name') == 'bambi_corn' then
playAnim('dave_y_bambi', 'bambi_corn', true)
elseif curBeat % 0.4 == 0 and getProperty('dave_y_bambi.animation.curAnim.name') == 'bambi_idle' then
playAnim('dave_y_bambi', 'bambi_idle', true)
end
end