package utils;

import flash.Lib;
import flash.net.URLRequest;
import flixel.util.FlxStringUtil;

/**
 * ...
 * @author Julien Samama
 */

class Utils
{
	/**
	 * Traverse through an array and changes all the occurences of the selected value to 1,
	 * and all the other values to 0.
	 * @param	The array to traversa
	 * @param	The value to keep as one
	 * @return	The random Int. Can include both endpoints.
	 */
	public static inline function parseArrayBinaryForValue(data:Array<Int>, toKeep:Int):Array<Int>
	{
		for (i in 0...data.length)
		{
			if (data[i] == toKeep)
				data[i] = 1;
			else
				data[i] = 0;
		}
		return data;
	}
	
	/**
	 * Returns a random Int between min <= Int <= max.
	 * @param	min
	 * @param	max
	 * @return	The random Int. Can include both endpoints.
	 */
	public static function randint(min:Int, max:Int):Int
	{
		return (Math.floor(Math.random() * (max - min + 1)) + min);
	}
	
	/**
	 * Returns a random Int between min <= Int < max.
	 * @param	min
	 * @param	max
	 * @return	The random Int.
	 */
	public static inline function randrange(min:Int, max:Int):Int
	{
		return (Math.floor(Math.random() * (max - min)) + min);
	}
	
	/**
	 * Random choice in an array.
	 */
	public static inline function choice<T>(array:Array<T>):T 
	{
		return array[Std.random(array.length)];
	}
	
	/**
	 * Get all values from a 2D array and return them in a 1 dimensional array.
	 */
	public static inline function values<T>(array:Array<Array<T>>):Array<T>
	{
		var newArray:Array<T> = new Array<T>();
		for (y in 0...array.length) {
			for (x in 0...array[y].length) {
				newArray.push(array[y][x]);
			}
		}
		return newArray;
	}
	
	/**
	 * Sort array.
	 * @param   array   Array to sort.
	 * @return  Return a sorted copy of the given array.
	 */
	public static inline function sorted(array:Array<Int>):Array<Int>
	{
		var newArray = array.copy();
		newArray.sort(function (a:Int, b:Int) {
			if (a < b) return -1;
			if (a > b) return 1;
			return 0;
		});
		return newArray;
	}
	
	/**
	 * Fills an array given a shape and a content. Default content is 0.
	 * @param	shape	The shape.
	 * @param	with	The content. Can be an Int, a Float, a String...
	 * @return	The array filled with content given the shape.
	 */
	public static function fillArray(shape:Array<Int>, with:Dynamic=0):Array<Dynamic>
	{
		var newArray:Array<Dynamic> = new Array<Dynamic>();
		
		if (shape.length < 1) return null;
		
		if (shape.length < 2)
		{
			for (i in 0...shape[0]) {
				newArray.push(with);
			}
			return newArray;
		}
		else if (shape.length < 3) {
			for (i in 0...shape[0]) {
				var newArray2:Array<Dynamic> = new Array<Dynamic>();
				for (i in 0...shape[1]) {
					newArray2.push(with);
				}
				newArray.push(newArray2);
			}
			return newArray;
		}
		return null;
	}
	
	/**
	 * Scale a DisplayObject (like Sprite) from the center.
	 * @param	dis     DisplayObject to scale.
	 * @param	sX      New x scale.
	 * @param	sY      New y scale.
	 */
	public static inline function scaleFromCenter(displayObject:Dynamic, sX:Float, sY:Float):Void
	{
		var prevW:Float = displayObject.width;
		var prevH:Float = displayObject.height;
		displayObject.scaleX = sX;
		displayObject.scaleY = sY;
		displayObject.x += (prevW - displayObject.width) / 2;
		displayObject.y += (prevH - displayObject.height) / 2;
	}
	
	/**
	 * Clamps the value within the minimum and maximum values. Stolen from haxepunk :)
	 * @param	value		The Float to evaluate.
	 * @param	min			The minimum range.
	 * @param	max			The maximum range.
	 * @return	The clamped value.
	 */
	public static function clamp(value:Float, min:Float, max:Float):Float
	{
		if (max > min)
		{
			if (value < min) return min;
			else if (value > max) return max;
			else return value;
		}
		else
		{
			// Min/max swapped
			if (value < max) return max;
			else if (value > min) return min;
			else return value;
		}
	}
}