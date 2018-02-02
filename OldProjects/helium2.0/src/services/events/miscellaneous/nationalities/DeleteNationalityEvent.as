package services.events.miscellaneous.nationalities
{
	import services.cairngorm.BaseEvent;
	import services.vo.common.NationalityVO;
	
	import mx.collections.ArrayCollection;

	public class DeleteNationalityEvent extends BaseEvent
	{
		public var nationality:NationalityVO = new NationalityVO();
		public var index:int = 0;
		public var listNationalities: ArrayCollection = new ArrayCollection();
		
		public function DeleteNationalityEvent(type:String)
		{
			super(type);
		}
		
	}
}