package services.events.miscellaneous.langueges
{
	import services.cairngorm.BaseEvent;
	import services.vo.common.LanguageVO;

	public class AddLanguageEvent extends BaseEvent
	{		
		public var language:LanguageVO = new LanguageVO();
		
		public function AddLanguageEvent(type:String)
		{
			super(type);
		}
		
	}
}