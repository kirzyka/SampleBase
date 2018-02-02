package framework.view.components.popups.events
{
	import flash.events.Event;

	public class PopupEvent extends Event
	{
		public static const CONFIRM:String = "confirm";
		public static const DECLINE:String = "decline";
		public static const DELETE_HANDLER:String = "delete";
		public static const CLOSE:String = "closePopup";
		
		public function PopupEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		/**
		 *  @override
		 */
		override public function clone():Event
		{
			return new PopupEvent(type);
		}
		
	}
}