package services.command.rates.companyRates
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.rates.companyRates.CompanyRatesDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.rates.companyRates.SaveTransactionCompanyRateEvent;

	public class SaveTransactionCompanyRateCommand extends BaseCommand
	{
		override public function execute(event:CairngormEvent):void
		{
			_event = SaveTransactionCompanyRateEvent( event );
			var delegate:CompanyRatesDelegate = new CompanyRatesDelegate( this );
			
			delegate.saveTransaction( _event as  SaveTransactionCompanyRateEvent);
			super.result( event );

		}
		
		override public function result(data:Object):void
		{			
			model.ratesModule.currentRate.iRateId = int(data);
			super.result( data ); 
		}
	}
}