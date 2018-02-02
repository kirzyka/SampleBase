package services.events.checkOut
{
	import framework.view.pages.checkOut.events.CheckOutEvent;

	public class SplitItemEvent extends CheckOutEvent
	{
		public var itemId:Number;
		public var absolute:Boolean;
		public var value:Number;
		
		public var index:int;
		
		public function SplitItemEvent(type:String)
		{
			super(type);
		}
	}
}