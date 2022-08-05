package;

import flixel.FlxState;

class PlayState extends FlxState
{
	var sillyPlayer:Player;

	override public function create()
	{
		sillyPlayer = new Player(16, 16);
		add(sillyPlayer);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
