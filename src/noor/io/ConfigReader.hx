package noor.io;

import haxe.Json;
import noor.web.Request;
import sys.io.File;

/**
  Reads configuration from a JSON file and exposes it as parameters.
  These parameters can be overriden by URL parameters of the same name.
*/
class ConfigReader {
    
    private static var jsonData:Map<String, Dynamic> = new Map<String, Dynamic>();
    private static var urlParameters:Map<String, Dynamic> = new Map<String, String>();
    
    /**
      Load a JSON file. We expose values from this file.
      They can be overriden by URL parameters.
    */
    public static function load(jsonContents:String, urlParameters:Map<String, String>):Void
    {
        var json:Dynamic = Json.parse(jsonContents);
        var fields:Array<String> = Reflect.fields(json);
        for (field in fields)
        {
            var value:Dynamic = Reflect.field(json, field);
            ConfigReader.jsonData[field] = value;
        }
        
        // Try to convert URL parameters into typed values
        for (key in urlParameters.keys())
        {
            var raw:String = urlParameters.get(key).toUpperCase();
            var value:Dynamic = raw;
            if (raw == "TRUE") {
                value = true;
            }
            else if (raw == "FALSE")
            {
                value = false;                
            }
            else if (Std.parseFloat(raw) != null)
            {
                value = Std.parseFloat(raw);
            }
            ConfigReader.urlParameters[key] = value;
        }        
    }
    
    public static function get(key:String):String
    {
        var value = null;
        
        // Check the URL parameters first (they override)
        if (ConfigReader.urlParameters.exists(key))
        {
            return ConfigReader.urlParameters.get(key);
        }
        else
        {
            return ConfigReader.jsonData[key]; // null or data
        }
    }
    
    private static function clear():Void
    {
        ConfigReader.jsonData = new Map<String, Dynamic>();
        ConfigReader.urlParameters = new Map<String, String>();
    }
}