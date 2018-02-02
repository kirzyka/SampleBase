package services.events.items.management
{
	import services.cairngorm.BaseEvent;
	import services.vo.items.HotelItemVO;

	public class SaveHotelArticleEvent extends BaseEvent
	{
		public var hotelId:Number;
		public var hotelSubGroupId:Number;
		public var hotelTransactionId:Number;
		public var hotelItem:HotelItemVO;
		public var index:int;
		
		public function SaveHotelArticleEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}