package services.events
{
    import com.adobe.cairngorm.control.CairngormEvent;

    /**
     *  The LocaleEvent class represents the event object dispatched by the LocaleManager.
     *
     * @author Anton Kirzyk / Ramada
     * @version $Revision 1.0 $ $Date: 2009/06/20
     */
    public class LocaleEvent extends CairngormEvent 
    {
        public static const INIT:String = "localeInit";
        public static const CHANGE:String = "localeChange";
        public static const ERROR:String = "localeError";        
        public static const UPDATE:String = "localeUpdate";
        
        public var localeCode:String;
        
        /**
        *   Constructor.
        */
        public function LocaleEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
        {
            super(type, bubbles, cancelable);
        } 
        
	    public function LocaleCode():String
		{
            return localeCode;
        }
  
    }
}
