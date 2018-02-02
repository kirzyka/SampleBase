package services.command.rates.packages
{
	import com.adobe.cairngorm.control.CairngormEvent;

	import services.business.rates.packages.PackageDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.rates.packages.SaveTransactionEvent;

	/**
	* The SaveTransactionCommand class is
	*
	* @author Anton Kirzyk / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2009-07-18 11:52:03 +0300 (Сб, 18 июл 2009) $
	*
	*/
	public class SaveTransactionCommand extends BaseCommand
	{

		override public function execute(event:CairngormEvent):void
		{
			_event = event as SaveTransactionEvent;
			var delegate:PackageDelegate = new PackageDelegate( this );
			delegate.saveTransaction(event as SaveTransactionEvent);
			super.execute(event);
		}

		override public function result(data:Object):void
		{
			model.ratesModule.barModule.currentPackage.iPackageId = data as int;
			super.result(data);
		}

	}
}