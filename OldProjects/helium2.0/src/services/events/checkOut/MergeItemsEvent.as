package services.events.checkOut
{
	import services.cairngorm.BaseEvent;
	import framework.view.pages.checkOut.events.CheckOutEvent;

	public class MergeItemsEvent extends CheckOutEvent
	{
		public var itemMergeIds:/* Number */Array = [];
		public var argId:Number;
		
		public var selectedIndexes:Array = [];
		public var selectedItems:Array = [];
		
		public function MergeItemsEvent(type:String)
		{
			super(type);
		}
		
	}
}