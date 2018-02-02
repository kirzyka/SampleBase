package services.events.rates.packages
{
	import services.controller.AppController;
	import services.cairngorm.BaseEvent;
	import services.vo.backend.PackageRequestVO;
	/**
	* The GetPackagesPageEvent class is
	*
	* @author Anton Kirzyk / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2009-07-18 11:52:03 +0300 (Сб, 18 июл 2009) $
	*
	*/
	public class GetPackagesPageEvent extends BaseEvent
	{
		public var packageRequest:PackageRequestVO;
		public var iPage:int;
		public var iCount:int;

		public function GetPackagesPageEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(AppController.PACKAGES_GET_PACKAGES_PAGE_EVENT, bubbles, cancelable);
		}

	}
}