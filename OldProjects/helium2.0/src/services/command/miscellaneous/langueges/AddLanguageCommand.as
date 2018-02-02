package services.command.miscellaneous.langueges
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import services.business.miscellaneous.langueges.LanguageDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.miscellaneous.langueges.AddLanguageEvent;

	public class AddLanguageCommand extends BaseCommand
	{
		override public function execute(event:CairngormEvent):void
		{
			_event = AddLanguageEvent( event );
			var delegate:LanguageDelegate = new LanguageDelegate( this );
			
			delegate.addLanguage(_event as AddLanguageEvent);
			super.execute( event );
		}
		
		override public function result(data:Object):void
		{
			super.result( data );	
		}
	}
}