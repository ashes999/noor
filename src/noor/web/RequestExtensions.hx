package noor.web;

import haxe.web.Request;

// Extensions for web.Request. Use it via "using noor.web.RequestExtensions"
class RequestExtensions
{
    /**
    Gets the URL parameters. Works across Flash/JS and Neko.
    until the Flash movie initializes itself (browser-dependent).
    */
    public static function getUrlParameters(clazz:Class<Request>):Map<String, String>
    {
        #if neko
            return Request.getParams();
        #elseif js
            return Request.getParams();
        #elseif flash
            // Dynamic<String>; it has properties like a Map<String, String>.
            var params:Dynamic<String> = flash.Lib.current.loaderInfo.parameters;
            var properties = Reflect.fields(params);        
            var map = new Map<String, String>();
            for (property in properties)
            {
                var value:String = Reflect.field(params, property);
                map[property] = value;
            }
            return map;
        #end
    }
}
