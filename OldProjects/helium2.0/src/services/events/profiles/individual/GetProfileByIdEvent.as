package services.events.profiles.individual
{
	import services.cairngorm.BaseEvent;

	public class GetProfileByIdEvent extends BaseEvent
	{
		/**
		 *  This property contain id of hotel.
		 */
		public var hotelId:int;
		/**
		 *  This property contain id of profile by person.
		 */
		public var profileId:int;
		
		public function GetProfileByIdEvent(type:String)
		{
			super(type);
		}
		
	}
}