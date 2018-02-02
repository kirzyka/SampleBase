package services.events.reservation
{
	/**
	* The GetComfLetterEvent class is 
	*
	* @author  Anton Kirzyk / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2010/02/08 $
	*
	*/	
	import services.controller.AppController;
	import services.cairngorm.BaseEvent;

	public class GetComfLetterEvent extends BaseEvent
	{
		public static const NAME:String = "reservationGetComfLetterEvent";
		
		public var rsvId:int;
		public var prsId:int;
		
		public function GetComfLetterEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(NAME, bubbles, cancelable);
		}		
	}
}