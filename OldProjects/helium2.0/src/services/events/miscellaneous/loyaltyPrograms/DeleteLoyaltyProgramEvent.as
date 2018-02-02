package services.events.miscellaneous.loyaltyPrograms
{
	import services.cairngorm.BaseEvent;
	import services.vo.common.loyaltyPrograms.LoyaltyProgramsVO;
	
	import mx.collections.ArrayCollection;

	public class DeleteLoyaltyProgramEvent extends BaseEvent
	{
		public var program:LoyaltyProgramsVO = new LoyaltyProgramsVO();
		public var index:int = 0;
		public var listProgram: ArrayCollection = new ArrayCollection();
		
		public function DeleteLoyaltyProgramEvent(type:String)
		{
			super(type);
		}
		
	}
}