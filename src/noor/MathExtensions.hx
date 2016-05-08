package noor;

import Math;

class MathExtensions
{
    // Returns an integer between a (inclusive) and b (exclusive)
    public static function randomBetween(clazz:Class<Math>, a:Int, b:Int):Int
    {
        var diff:Int = b - a;
        if (diff <= 0)
        {
            throw new Exception('Please specify numbers such that b (${b}) > a (${a})');
        }
        return a + Math.floor(Math.random() * diff);
    }
}