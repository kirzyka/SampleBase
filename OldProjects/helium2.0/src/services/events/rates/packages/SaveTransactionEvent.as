package services.events.rates.packages
{
	import services.controller.AppController;
	import services.cairngorm.BaseEvent;
	import services.vo.backend.PackageItemVO;
	/**
	* The SaveTransactionEvent class is
	*
	* @author Anton Kirzyk / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2009-07-18 11:52:03 +0300 (Сб, 18 июл 2009) $
	*
	*/
	public class SaveTransactionEvent extends BaseEvent
	{
		public var iPackageId:int;
		public var oMapTransaction:PackageItemVO;

		public function SaveTransactionEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(AppController.PACKAGES_SAVE_TRANSACTION_EVENT, bubbles, cancelable);
		}

	}
}