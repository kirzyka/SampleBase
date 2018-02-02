package services.command.miscellaneous.countries
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.miscellaneous.countries.CountryDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.miscellaneous.countries.DeleteCountryEvent;
	import services.vo.GlobalStorage;

	public class DeleteCountryCommand extends BaseCommand
	{
		override public function execute(event:CairngormEvent):void
		{
			_event = DeleteCountryEvent( event );
			var delegate:CountryDelegate = new CountryDelegate( this );
			
			delegate.deleteCountry(_event as DeleteCountryEvent);
			super.execute( event );
		}
		
		override public function result(data:Object):void
		{
			for (var i:int = 0; i < model.commonModule.countries.length; i++)
				if (model.commonModule.countries.getItemAt(i).lId == (_event as DeleteCountryEvent).listCountry.getItemAt((_event as DeleteCountryEvent).index).lId)
				{
					model.commonModule.countries.removeItemAt(i);
					(_event as DeleteCountryEvent).listCountry.removeItemAt((_event as DeleteCountryEvent).index);
					break;
				}			
			super.result( data );
		}
		
	}
}