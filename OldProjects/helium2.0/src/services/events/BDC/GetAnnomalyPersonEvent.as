package services.events.BDC
{
	import services.controller.AppController;
	import services.cairngorm.BaseEvent;

	public class GetAnnomalyPersonEvent extends BaseEvent
	{
		public var sDate:String;
		public function GetAnnomalyPersonEvent( )
		{
			super(AppController.BDC_GET_ANNOMALY_PERSON);
		}
	}
}