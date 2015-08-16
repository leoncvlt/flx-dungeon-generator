package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.tile.FlxTilemap;
import flixel.util.FlxStringUtil;

import openfl.Assets;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	private static inline var ROOM_WIDTH:Int = 80;
	private static inline var ROOM_HEIGHT:Int = 60;

	private static inline var TILE_WIDTH:Int = 8;
	private static inline var TILE_HEIGHT:Int = 8;

	private var _tiles:FlxTilemap;
	private var _dungeon:MiscDungeonGenerator;


	/**
	 * Function that is called up when to state is created to set it up.  
	 */
	override public function create():Void
	{
		super.create();
		
		_tiles = new FlxTilemap();
		generateDungeon(ROOM_WIDTH, ROOM_HEIGHT);
		add(_tiles);

		var _button = new FlxButton(8, 8, "Regenerate", generateCallback);
		add(_button);
	}

	/**
	 * Function that call the dungeon generation method from MiscDungeonGenerator.hx 
	 *
	 * usage: generate(mapWidth, mapHeight, minSize, maxSize, fail, corrBias, maxRooms)
	 *
	 * mapWidth    Width of the map area.
	 * mapHeight   Height of the map area.
	 * fail        A value from 1 upwards. The higer the value of fail, the greater the chance of larger dungeons being created. A low value (>10) tends to produce only a few rooms, a high value (<50) raises the chance that the whole map area will be used to create rooms (up to the value of maxRooms).
	 * corrBias    corridor bias. This is a value from 0 to 100 and represents the %chance a feature will be a corridor instead of a room. A value of 0 will produce rooms only, a value of 100 will produce corridors only.
	 * maxRooms	Maximum number of rooms to create. This, combined with fail, can be used to create a specific number of rooms.
	 */
	private function generateDungeon(width:Int, height:Int):Void
	{
		_dungeon = new MiscDungeonGenerator();
		_dungeon.generate(ROOM_WIDTH, ROOM_HEIGHT, 3, 11, 400, 50, 40);
		_tiles.loadMap(FlxStringUtil.arrayToCSV(_dungeon.getFlixelData(), ROOM_WIDTH), "assets/images/tiles.png", TILE_WIDTH, TILE_HEIGHT, FlxTilemap.OFF);

	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();

		if (FlxG.keys.justPressed.SPACE) generateDungeon(ROOM_WIDTH, ROOM_HEIGHT);
	}	

	/**
	 * Button callback.
	 */
	private function generateCallback():Void
	{
		generateDungeon(ROOM_WIDTH, ROOM_HEIGHT);
	}
}