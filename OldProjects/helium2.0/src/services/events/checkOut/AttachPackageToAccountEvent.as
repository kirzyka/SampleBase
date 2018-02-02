package services.events.checkOut
{
	import services.cairngorm.BaseEvent;

	public class AttachPackageToAccountEvent extends BaseEvent
	{
		public var packageIds:Array = [];
		public var paymentLineId:Number;
		public var accountId:Number;
		public var accountType:int;
		
		public function AttachPackageToAccountEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}