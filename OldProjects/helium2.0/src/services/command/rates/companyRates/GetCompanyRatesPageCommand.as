package services.command.rates.companyRates
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.rates.companyRates.CompanyRatesDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.rates.companyRates.GetCompanyRatesPageEvent;
	
	import mx.collections.ArrayCollection;

	public class GetCompanyRatesPageCommand extends BaseCommand
	{
		override public function execute(event:CairngormEvent):void
		{
			_event = GetCompanyRatesPageEvent( event );
			var delegate:CompanyRatesDelegate = new CompanyRatesDelegate( this );
			
			delegate.getCompanyRatesPage( _event as GetCompanyRatesPageEvent );
			
			super.execute(event);
		}
		
		override public function result(data:Object):void
		{
			var items:ArrayCollection = new ArrayCollection( data as Array );
			model.ratesModule.ratesData.removeAll();
			for(var i:int = 0; i < items.length; i++)
			{				
				model.ratesModule.ratesData.addItem( items[i] );
			}
			super.result(data);
		}		
		
		
	}
}