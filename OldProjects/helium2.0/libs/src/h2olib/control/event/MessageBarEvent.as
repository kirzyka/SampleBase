package h2olib.control.event 
{
    import flash.events.Event;

	/**
	* The MessageEvent class used to signal about message to the
	* <code>MessageBox</code> component.
	* @author Anton Kirzyk / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2009/06/23 $
	*
	*/

    public class MessageBarEvent extends Event {
        public static const MESSAGE:String = "message";
        public static const HIDE:String = "hideMessage";

        public var kind:uint;
        public var message:String;
        public var details:String;
        public var stackTrace:String;
        public var autoHide:Boolean;

        /**
         * Constructor.
         *
         * @param type Event type.
         * @param kind Message kind.
         * @param message Message text.
         * @param details Message details.
         * @param stackTrace Stack Trace string.
         * @param autoHide Autohide flag.
         * @param bubbles
         * @param cancelable
         */
        public function MessageBarEvent(type:String,
                kind:uint = 0,
                message:String = null,
                details:String = null,
                stackTrace:String = null,
                autoHide:Boolean = false,
                bubbles:Boolean=false, cancelable:Boolean=false) 
        {
            super(type, bubbles, cancelable);

            this.kind = kind;
            this.message = message;
            this.details = details;
            this.stackTrace = stackTrace;
            this.autoHide = autoHide;
        }

        public var _currentTarget:Object;

        public function set currentTarget(value:Object):void 
        {
            _currentTarget = value;
        }

        override public function get currentTarget():Object 
        {
            return _currentTarget;
        }

        override public function clone():Event 
        {
            var event:MessageBarEvent = new MessageBarEvent(type, kind, message, details, stackTrace, autoHide, bubbles, cancelable);
            event.currentTarget = currentTarget;
            return event;
        }
    }
}
