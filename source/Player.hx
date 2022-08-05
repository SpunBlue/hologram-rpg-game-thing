package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class Player extends FlxSprite
{
	public var defaultPlayerSpeed:Int = 130;

	public var Decelleration:Int = 0;
	public var Acceleration:Int = 0;

	public function new(x:Float, y:Float)
	{
		super(x, y);

		makeGraphic(24, 24, FlxColor.BLUE);
	}

	public function updateMovement()
	{
		var leftP:Bool = FlxG.keys.justPressed.LEFT;
		var rightP:Bool = FlxG.keys.justPressed.RIGHT;
		var upP:Bool = FlxG.keys.justPressed.UP;

		if (leftP && !rightP)
		{
			velocity.x = -defaultPlayerSpeed;
		}
		else if (rightP && !leftP)
		{
			velocity.x = defaultPlayerSpeed;
		}
	}
}
