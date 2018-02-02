package services.events.checkOut
{
	import services.cairngorm.BaseEvent;

	public class DeleteItemEvent extends BaseEvent
	{
		public var id:Number = 0;
		public var index:int;
		
		public function DeleteItemEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}