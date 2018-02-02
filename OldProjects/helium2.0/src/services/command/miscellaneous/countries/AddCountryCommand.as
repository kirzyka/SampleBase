package services.command.miscellaneous.countries
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.miscellaneous.countries.CountryDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.miscellaneous.countries.AddCountryEvent;

	public class AddCountryCommand extends BaseCommand
	{	
		override public function execute(event:CairngormEvent):void
		{
			_event = AddCountryEvent( event );
			var delegate:CountryDelegate = new CountryDelegate( this );			
			delegate.addCountry(_event as AddCountryEvent);
			super.execute( event );
		}
		
		override public function result(data:Object):void
		{
			super.result(data);	
		}
		
	}
}