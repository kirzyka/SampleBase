package services.events.items.management
{
	import services.cairngorm.BaseEvent;
	import services.vo.items.VatPeriodVO;

	public class SaveVatPeriodEvent extends BaseEvent
	{
		public var oVatPeriod:VatPeriodVO = new VatPeriodVO();
		
		public function SaveVatPeriodEvent(type:String)
		{
			super(type);
		}		
	}
}