package services.command.rates.companyRates
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.rates.companyRates.CompanyRatesDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.rates.companyRates.GetTransactionListCompanyRateEvent;
	
	import mx.collections.*;

	public class GetTransactionListCompanyRateCommand extends BaseCommand
	{
		override public function execute(event:CairngormEvent):void
		{
			_event = GetTransactionListCompanyRateEvent( event );
			var delegate:CompanyRatesDelegate = new CompanyRatesDelegate( this );
			
			delegate.getTransactionList( _event as GetTransactionListCompanyRateEvent );
			super.execute( event );
		}
		
		override public function result(data:Object):void
		{
			var items:ArrayCollection = new ArrayCollection( data as Array );			
			model.ratesModule.currentTransactionList.removeAll();
			for(var i:int = 0; i < items.length; i++)
			{				
				model.ratesModule.currentTransactionList.addItem( items[i] );
			}
			super.result( data );
		}
		
	}
}