package services.events.rates.packages
{
	import services.controller.AppController;
	import services.cairngorm.BaseEvent;
	import services.vo.backend.PackageVO;
	import services.vo.rates.packages.PackageGroupVO;
	/**
	* The SavePackageEvent class is
	*
	* @author Anton Kirzyk / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2009-07-18 11:52:03 +0300 (Сб, 18 июл 2009) $
	*
	*/
	public class SavePackageEvent extends BaseEvent
	{
		public var packageOriginal:PackageGroupVO;
		public var packageForSave:PackageGroupVO;

		public function SavePackageEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(AppController.PACKAGES_SAVE_PACKAGE_EVENT, bubbles, cancelable);
		}

	}
}