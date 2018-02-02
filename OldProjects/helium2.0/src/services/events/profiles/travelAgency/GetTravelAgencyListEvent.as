package services.events.profiles.travelAgency
{
	import services.cairngorm.BaseEvent;

	public class GetTravelAgencyListEvent extends BaseEvent
	{
		public var page:int;
		public var count:int;
		public var pattern:String = "";
		
		public function GetTravelAgencyListEvent(type:String)
		{
			super(type);
		}
	}
}