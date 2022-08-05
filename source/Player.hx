package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class Player extends FlxSprite
{
	public static var allowGravity:Bool = true;

	public var speed:Int = 130;
	public var deceleration:Float;

	public function new(x:Float, y:Float)
	{
		super(x, y);

		// makeGraphic(48, 64, FlxColor.BLUE);
		loadGraphic("assets/images/holoplayer.png", true, 48, 64);
		antialiasing = false;
		animation.add("idle", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], 12, true);

		animation.play("idle");

		if (allowGravity)
			acceleration.y = 500;
	}

	public function updateMovement()
	{
		var left = FlxG.keys.anyPressed([LEFT, A]);
		var right = FlxG.keys.anyPressed([RIGHT, D]);

		if (left)
			velocity.x = speed * -1;
		else if (right)
			velocity.x = speed;

		// Deceleration
		if (velocity.x != 0 && !left && !right)
		{
			if (deceleration != speed / 5)
				deceleration = speed / 5;

			if (velocity.x > 0)
				velocity.x -= deceleration;
			else if (velocity.x < 0)
				velocity.x += deceleration;
		}
	}

	function jumping()
	{
		var jump = FlxG.keys.anyPressed([UP, W, SPACE]);

		if (this.isTouching(FLOOR) && jump)
		{
			velocity.y = speed * -1.5; // probably not gonna keep it like this
		}
	}

	override public function update(elapsed:Float)
	{
		jumping();

		super.update(elapsed);
		updateMovement();
	}
}
