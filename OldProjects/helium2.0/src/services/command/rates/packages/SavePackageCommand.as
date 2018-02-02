package services.command.rates.packages
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.rates.packages.PackageDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.rates.packages.SavePackageEvent;
	import services.vo.rates.packages.PackageGroupVO;

	/**
	* The SavePackageCommand class is
	*
	* @author Viktor Potapov / Ramada
	*
	* @version $Revision 1.1 $ $Date: 2009-11-5 15:35:03 +0300 (Чт, 5 ноября 2009) $
	*
	*/
	public class SavePackageCommand extends BaseCommand
	{
		private var _packageOriginal:PackageGroupVO;
		private var isAddOperation:Boolean;
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = event as SavePackageEvent;
			var delegate:PackageDelegate = new PackageDelegate(this);
			_packageOriginal = (event as SavePackageEvent).packageOriginal;
			if((event as SavePackageEvent).packageForSave.iPackageId == 0)
			{
				isAddOperation = true;
			}
			else
			{
				isAddOperation = false;
			}
			delegate.savePackage(event as SavePackageEvent);

			super.execute(event);
		}

		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			if(data != null)
			{
				model.ratesModule.barModule.currentPackage = data as PackageGroupVO;
				if(isAddOperation)
				{
					model.ratesModule.barModule.packages.addItem(data as PackageGroupVO);
				}
				else
				{
					model.ratesModule.barModule.packages.removeItemAt(model.ratesModule.barModule.packages.getItemIndex(_packageOriginal));
					model.ratesModule.barModule.packages.addItem(data as PackageGroupVO);
				}
			}
			super.result(data);
		}


	}
}