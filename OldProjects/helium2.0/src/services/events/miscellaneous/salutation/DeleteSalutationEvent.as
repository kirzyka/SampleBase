package services.events.miscellaneous.salutation
{
	import services.cairngorm.BaseEvent;
	import services.vo.common.NationalityVO;
	import services.vo.common.SalutationVO;
	
	import mx.collections.ArrayCollection;

	public class DeleteSalutationEvent extends BaseEvent
	{
		public var salutation:SalutationVO = new SalutationVO();
				
		public function DeleteSalutationEvent(type:String)
		{
			super(type);
		}
		
	}
}