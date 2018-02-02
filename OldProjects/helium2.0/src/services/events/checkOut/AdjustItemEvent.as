package services.events.checkOut
{
	import services.cairngorm.BaseEvent;
	import framework.view.pages.checkOut.events.CheckOutEvent;

	public class AdjustItemEvent extends CheckOutEvent
	{
		public var id:Number;
		public var absolute:Boolean;
		public var value:String;
		public var reason:String;
		
		public var index:int;
		
		public function AdjustItemEvent(type:String)
		{
			super(type);
		}
	}
}