package noor;

class Exception #if js extends js.Error #end 
{
    #if !js
        // Already exists in JS and can't be re-defined
        public var message(default, null):String;
    #end
    
    public function new(message:String = "An exception occurred")
    {
        #if js
            super(message);
        #end
        
        this.message = message;
    }
}