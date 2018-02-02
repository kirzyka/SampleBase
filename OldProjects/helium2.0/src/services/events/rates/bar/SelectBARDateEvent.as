package services.events.rates.bar
{
	import flash.events.Event;
	
	import services.vo.rates.bar.BARSaveItemVO;
	
	public class SelectBARDateEvent extends Event
	{
		public static const SELECT_DATA:String = "selectDate";
		
		public var startDateObj:BARSaveItemVO;
		public var endDateObj:BARSaveItemVO;
		public var startDate:Date=null;
		public var endDate:Date=null;
		public var selectedCells:Array = new Array();
		
		public function SelectBARDateEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}