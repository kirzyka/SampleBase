package services.command.rates.companyRates
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.rates.companyRates.CompanyRatesDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.rates.companyRates.DeleteCompanyRateEvent;

	public class DeleteCompanyRateCommand extends BaseCommand
	{	
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = DeleteCompanyRateEvent( event );
			var delegate:CompanyRatesDelegate = new CompanyRatesDelegate( this );
			
			delegate.deleteCompanyRate(_event as DeleteCompanyRateEvent);
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			super.result(data);
		}		
	}
}