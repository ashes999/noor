package noor.web;

// Extensions for web.Request. Use it via "import noor.web.Request"
class Request
{
    /**
    Gets the URL parameters. Works across Flash/JS and Neko.
    until the Flash movie initializes itself (browser-dependent).
    */
    public static function getUrlParameters():Map<String, String>
    {
        #if neko
            return haxe.web.Request.getParams();
        #elseif js
            return haxe.web.Request.getParams();
        #elseif flash
            // Dynamic<String>; it has properties like a Map<String, String>.
            var params:Dynamic<String> = flash.Lib.current.loaderInfo.parameters;
            if (params == null)
            {
                throw new Exception("Flash loaderInfo isn't initialized yet. You may be embedding your SWF incorrectly.");
            }
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
