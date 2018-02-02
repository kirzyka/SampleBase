package services.events.miscellaneous.salutation
{
	import services.cairngorm.BaseEvent;
	import services.vo.common.NationalityVO;
	import services.vo.common.SalutationVO;

	public class AddSalutationEvent extends BaseEvent
	{		
		public var salutation:SalutationVO = new SalutationVO();
		
		public function AddSalutationEvent(type:String)
		{
			super(type);
		}
		
	}
}