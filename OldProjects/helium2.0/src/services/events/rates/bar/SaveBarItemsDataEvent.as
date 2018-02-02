package services.events.rates.bar
{
	import services.cairngorm.BaseEvent;
	import services.vo.rates.bar.BARDateIntervalVO;
	import services.vo.rates.bar.BARSaveItemVO;
	
	public class SaveBarItemsDataEvent extends BaseEvent
	{
		//public var cells:Array = new Array();
		public var barDate:BARSaveItemVO;
		/**
		 *  This property contain interval for saving BARs
		 *  for hotel.
		 *  
		 *  @see framework.vo.backend.BARDateIntervalVO
		 */
		public var hotelDateInterval:BARDateIntervalVO;
		
		public var barItems:Array;
		
		public function SaveBarItemsDataEvent(type:String)
		{
			super(type);
		}
		
	}
}