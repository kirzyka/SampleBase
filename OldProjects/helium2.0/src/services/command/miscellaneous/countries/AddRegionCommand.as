package services.command.miscellaneous.countries
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.miscellaneous.countries.CountryDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.miscellaneous.countries.AddRegionEvent;

	public class AddRegionCommand extends BaseCommand
	{		
		override public function execute(event:CairngormEvent):void
		{
			_event = AddRegionEvent( event );
			var delegate:CountryDelegate = new CountryDelegate( this );
			
			delegate.addRegion(_event as AddRegionEvent);
			super.execute( event );
		}
		
		override public function result(data:Object):void
		{
			super.result( data );	
		}
	}
}