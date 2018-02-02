package services.command.rates.packages
{
	import com.adobe.cairngorm.control.CairngormEvent;

	import services.business.rates.packages.PackageDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.rates.packages.GetTransactionItemCountEvent;

	/**
	* The GetTransactionItemCountCommand class is
	*
	* @author Anton Kirzyk / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2009-07-18 11:52:03 +0300 (Сб, 18 июл 2009) $
	*
	*/
	public class GetTransactionItemCountCommand extends BaseCommand
	{

		override public function execute(event:CairngormEvent):void
		{
			_event = event as GetTransactionItemCountEvent;
			var delegate:PackageDelegate = new PackageDelegate( this );
			delegate.getItemCount(event as GetTransactionItemCountEvent);
			super.execute(event);
		}

		override public function result(data:Object):void
		{
			model.ratesModule.barModule.groupItemCount = data != null ? data as int : 0;
			super.result(data);
		}

	}
}