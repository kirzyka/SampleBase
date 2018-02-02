package services.events.profiles.company
{
	import services.cairngorm.BaseEvent;

	public class GetCompanyByIdEvent extends BaseEvent
	{
		public var id:Number;
		
		public function GetCompanyByIdEvent(type:String)
		{
			super(type);
		}
	}
}