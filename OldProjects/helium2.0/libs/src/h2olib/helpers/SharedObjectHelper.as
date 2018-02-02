package h2olib.helpers
{
    import flash.net.SharedObject;

    /**
     * The SharedObjectHelper class is used for ..
     *
     * @author Anton Kirzyk / Ramada
     * @version $Revision 1.0 $ $Date: 2009/09/19
     */
    public class SharedObjectHelper 
    {

        public static var userSharedObject:SharedObject;

        private static function formatString(value:String):String 
        {
            var hash:String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefjijklmnopqrstuvwxyz";
            var result:String = "";
            var index:int;

            var i:int;
            for (i = 0; i < value.length; i++) 
            {
                if (hash.indexOf(value.charAt(i)) < 0) 
                {
                    index = value.charCodeAt(i);

                    while (index > hash.length) 
                    {
                        index -= hash.length;
                    }

                    result += hash.charAt(index);
                } 
                else 
                {
                    result += value.charAt(i);
                }
            }

            return result;
        }

        public static function parseUID(value:String):String 
        {
            var buf:String = new String(value);
            //var result:Array = new Array();
            var result:String = new String();
            var substr:String;
            while(buf.indexOf(".") != -1) 
            {
                substr = buf.substring(0,buf.indexOf("."));
                buf = buf.substring(buf.indexOf(".")+1,buf.length);
                //result.push(removeNumbers(substr));
                result += removeNumbers(substr)+".";
            }
            //result.push(removeNumbers(buf));
            result += removeNumbers(buf);
            return result;

            function removeNumbers(value:String):String 
            {
                var result:String = new String(value);
                for (var i:int = value.length-1;i>=0;i--) 
                {
                    var val:int = value.charCodeAt(i);
                    if ((val<48) || (val>57)) 
                    {
                        result = value.substring(0,i+1);
                        break;
                    }
                }
                return result;
            }
        }

        public static function save(componentUID:String, value:Object):void 
        {
            userSharedObject.data[componentUID] = value;
            userSharedObject.flush();
        }

        public static function load(componentUID:String):Object 
        {
            if (componentUID in userSharedObject.data) 
            {
                return userSharedObject.data[componentUID];
            }
            return null;
        }

    }
}
