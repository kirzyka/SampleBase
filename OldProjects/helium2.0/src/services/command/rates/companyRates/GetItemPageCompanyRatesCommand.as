package services.command.rates.companyRates
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.rates.companyRates.CompanyRatesDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.rates.companyRates.GetItemPageCompanyRatesEvent;
	
	import mx.collections.ArrayCollection;

	public class GetItemPageCompanyRatesCommand extends BaseCommand
	{
		override public function execute(event:CairngormEvent):void
		{
			_event = GetItemPageCompanyRatesEvent(event);
			var delegate:CompanyRatesDelegate= new CompanyRatesDelegate(this);			
			delegate.getItemPageCompanyRates(_event as GetItemPageCompanyRatesEvent);
			super.execute( event );
		}
		
		override public function result(data:Object):void
		{
			var items:ArrayCollection = new ArrayCollection( data as Array );
			model.ratesModule.transactionListforAdd.removeAll();
			for(var i:int = 0; i < items.length; i++)
			{				
				model.ratesModule.transactionListforAdd.addItem( items[i] );
			}
			super.result( data );
		}		
	}
}