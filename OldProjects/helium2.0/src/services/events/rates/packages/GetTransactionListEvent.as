package services.events.rates.packages
{
	import services.controller.AppController;
	import services.cairngorm.BaseEvent;
	
	/**
	* The GetTransactionListEvent class is 
	*
	* @author Anton Kirzyk / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2009-07-18 11:52:03 +0300 (Сб, 18 июл 2009) $
	*
	*/
	public class GetTransactionListEvent extends BaseEvent
	{
		public var iPackageId:int = 0;
		public function GetTransactionListEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(AppController.PACKAGES_GET_TRANSACTION_LIST_EVENT, bubbles, cancelable);
		}
		
	}
}