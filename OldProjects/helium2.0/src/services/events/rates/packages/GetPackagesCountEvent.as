package services.events.rates.packages
{
	import services.controller.AppController;
	import services.cairngorm.BaseEvent;
	import services.vo.backend.PackageRequestVO;
	/**
	* The GetPackagesCountEvent class is
	*
	* @author Anton Kirzyk / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2009-07-18 11:52:03 +0300 (Сб, 18 июл 2009) $
	*
	*/
	public class GetPackagesCountEvent extends BaseEvent
	{
		public var packageRequest:PackageRequestVO;

		public function GetPackagesCountEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(AppController.PACKAGES_GET_PACKAGES_COUNT_EVENT, bubbles, cancelable);
		}

	}
}