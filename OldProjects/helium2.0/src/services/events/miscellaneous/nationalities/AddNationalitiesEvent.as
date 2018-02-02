package services.events.miscellaneous.nationalities
{
	import services.cairngorm.BaseEvent;
	import services.vo.common.NationalityVO;

	public class AddNationalitiesEvent extends BaseEvent
	{		
		public var nationality:NationalityVO = new NationalityVO();
		
		public function AddNationalitiesEvent(type:String)
		{
			super(type);
		}
		
	}
}