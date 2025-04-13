function onCreate()
{
	var randomIndex:Int = FlxG.random.int(1, 23);
	funkay = new FlxSprite(0, 0).loadGraphic(Paths.image('loading_screen/bgs/bg_' + randomIndex));
	funkay.antialiasing = ClientPrefs.data.antialiasing;
	funkay.setGraphicSize(0, FlxG.height);
	funkay.updateHitbox();
	FlxTween.color(funkay, 2, funkay.color, 0xFFD16FFF);		
	addBehindBar(funkay);
	texto = new FlxSprite(0, 0).loadGraphic(Paths.image('loading_screen/text'));
	texto.antialiasing = ClientPrefs.data.antialiasing;
	texto.scale.set(1, 1);
	texto.updateHitbox();	
	texto.screenCenter();
	texto.y += 200;
	addBehindBar(texto);	
	logo = new FlxSprite(0, 0).loadGraphic(Paths.image('loading_screen/logo'));
	logo.antialiasing = ClientPrefs.data.antialiasing;
	logo.screenCenter();
	logo.y -= 100;
	addBehindBar(logo);
}