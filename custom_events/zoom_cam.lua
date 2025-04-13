function onEvent(name, value1, value2)
 if name == 'zoom_cam' then
doTweenZoom('cam_zoom','camGame', value1, value2, 'sineInOut')
end            
end
function onTweenCompleted(tag, object)
if tag == 'cam_zoom' then
setProperty('defaultCamZoom', getProperty('camGame.zoom')) 
end
end