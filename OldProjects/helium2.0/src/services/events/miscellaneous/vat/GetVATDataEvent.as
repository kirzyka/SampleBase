package services.events.miscellaneous.vat
{
	import services.cairngorm.BaseEvent;

	public class GetVATDataEvent extends BaseEvent
	{
		public function GetVATDataEvent(type:String)
		{
			super(type);
		}
		
	}
}