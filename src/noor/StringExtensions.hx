package noor;

using StringTools;

class StringExtensions
{
    public static function isNullOrWhitespace(s:String):Bool
    {
        return s == null || s.trim().length == 0;
    }
}