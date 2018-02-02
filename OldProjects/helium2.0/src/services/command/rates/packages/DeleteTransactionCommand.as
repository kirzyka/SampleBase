package services.command.rates.packages
{
	import com.adobe.cairngorm.control.CairngormEvent;

	import services.business.rates.packages.PackageDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.rates.packages.DeleteTransactionEvent;
	import services.vo.backend.PackageItemVO;

	/**
	* The DeleteTransactionCommand class is
	*
	* @author Anton Kirzyk / Ramada
	*
	* @version $Revision 1.0 $ $Date: 2009-07-18 11:52:03 +0300 (Сб, 18 июл 2009) $
	*
	*/
	public class DeleteTransactionCommand extends BaseCommand
	{
		private var transactionForDelete:PackageItemVO;

		override public function execute(event:CairngormEvent):void
		{
			_event = event as DeleteTransactionEvent;
			var delegate:PackageDelegate= new PackageDelegate( this );
			this.transactionForDelete = (event as DeleteTransactionEvent).transactionForDelete;
			delegate.deleteTransaction(event as DeleteTransactionEvent);
			super.execute(event);
		}

		override public function result(data:Object):void
		{
			var deleteItemItem:int = model.ratesModule.barModule.packageTransactionList.getItemIndex(transactionForDelete);
			model.ratesModule.barModule.packageTransactionList.removeItemAt(deleteItemItem);
			super.result(data);
		}

	}
}