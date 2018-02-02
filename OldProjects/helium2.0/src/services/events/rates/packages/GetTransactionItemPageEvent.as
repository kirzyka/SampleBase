package services.events.rates.packages
{
	import services.controller.AppController;
	import services.cairngorm.BaseEvent;
	
	/**
	* The GetTransactionItemPageEvent class is 
	*
	* @author Anton Kirzyk / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2009-07-18 11:52:03 +0300 (Сб, 18 июл 2009) $
	*
	*/

	public class GetTransactionItemPageEvent extends BaseEvent
	{	
		public var iGroupId:int; 
		public var sItemName:String;
		public var iPage:int; 
		public var iCount:int;
		
		public function GetTransactionItemPageEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(AppController.PACKAGES_GET_TRANSACTION_ITEM_PAGE_EVENT, bubbles, cancelable);
		}
		
	}
}