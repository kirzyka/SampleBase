package h2olib.control
{
    import services.vo.GlobalImageAssets;
    
    import mx.controls.Alert;

    public class Confirmation extends Alert 
    {
        /**
         * Shows confirmation alert.
         *
         * @param text
         * @param title
         * @param closeHandler
         *
         * @return Alert
         *
         */
        public static function show(title:String = "", text:String = "", closeHandler:Function = null):Alert 
        {
            //Alert.yesLabel = rb.getString(..
            return Alert.show(text, title, Alert.YES | Alert.NO, null, closeHandler, GlobalImageAssets.getInstance().infoIcon)
        }
    }
}
