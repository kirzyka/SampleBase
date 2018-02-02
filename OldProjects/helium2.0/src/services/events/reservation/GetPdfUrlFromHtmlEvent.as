package services.events.reservation
{
	import services.controller.AppController;
	import services.cairngorm.BaseEvent;

	public class GetPdfUrlFromHtmlEvent extends BaseEvent
	{
		public var html:String;
		public var rsvId:int;
		
		public function GetPdfUrlFromHtmlEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(AppController.GET_PDF_URL_FROM_HTML_EVENT, bubbles, cancelable);
		}
		
	}
}