package services.events.common
{
	import services.cairngorm.BaseEvent;

	public class GetDataListByTypeEvent extends BaseEvent
	{
		public var sDictionaryType:String; //type of dictionary
		
		public function GetDataListByTypeEvent(type:String)
		{
			super(type);
		}
		
	}
}