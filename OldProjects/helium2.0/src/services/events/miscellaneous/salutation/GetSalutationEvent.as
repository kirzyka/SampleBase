package services.events.miscellaneous.salutation
{
	import services.cairngorm.BaseEvent;

	public class GetSalutationEvent extends BaseEvent
	{
		public var languageId:Number;
		public function GetSalutationEvent(type:String)
		{
			super(type);
		}
	}
}