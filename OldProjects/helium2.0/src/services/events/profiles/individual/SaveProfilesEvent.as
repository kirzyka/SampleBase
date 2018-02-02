package services.events.profiles.individual
{
	import services.cairngorm.BaseEvent;
	import services.vo.profiles.ProfilePersonalVO;

	public class SaveProfilesEvent extends BaseEvent
	{
		public var hotelId:Number;
		public var profile:ProfilePersonalVO;
		public var index:int = 0;
		
		public function SaveProfilesEvent(type:String)
		{
			super(type);
		}
	}
}