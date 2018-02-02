package services.events.miscellaneous.langueges
{
	import services.cairngorm.BaseEvent;
	import services.vo.common.LanguageVO;
	
	import mx.collections.ArrayCollection;

	public class DeleteLanguageEvent extends BaseEvent
	{
		public var language:LanguageVO = new LanguageVO();
		public var index:int = 0;
		public var listLanguage:ArrayCollection = new ArrayCollection();
		
		public function DeleteLanguageEvent(type:String)
		{
			super(type);
		}
		
	}
}