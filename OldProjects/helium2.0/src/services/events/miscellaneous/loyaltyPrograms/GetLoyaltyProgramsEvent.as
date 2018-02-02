package services.events.miscellaneous.loyaltyPrograms
{
	import services.cairngorm.BaseEvent;

	public class GetLoyaltyProgramsEvent extends BaseEvent
	{		
		public function GetLoyaltyProgramsEvent(type:String)
		{
			super(type);
		}
		
	}
}