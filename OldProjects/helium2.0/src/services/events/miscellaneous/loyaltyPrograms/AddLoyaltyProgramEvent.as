package services.events.miscellaneous.loyaltyPrograms
{
	import services.cairngorm.BaseEvent;
	import services.vo.common.loyaltyPrograms.LoyaltyProgramsVO;

	public class AddLoyaltyProgramEvent extends BaseEvent
	{		
		public var program:LoyaltyProgramsVO = new LoyaltyProgramsVO();
		
		public function AddLoyaltyProgramEvent(type:String)
		{
			super(type);
		}
		
	}
}