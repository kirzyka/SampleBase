package services.command.miscellaneous.langueges
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.miscellaneous.langueges.LanguageDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.miscellaneous.langueges.GetLanguageEvent;
	import services.vo.GlobalStorage;
	
	import mx.collections.ArrayCollection;

	public class GetLanguageCommand extends BaseCommand
	{
		override public function execute(event:CairngormEvent):void
		{
			_event = GetLanguageEvent( event );
			var delegate:LanguageDelegate = new LanguageDelegate( this );			
			delegate.getLanguage( _event as GetLanguageEvent );
			super.execute( event );
		}
		
		override public function result(data:Object):void
		{
			GlobalStorage.language = new ArrayCollection( data as Array );
			super.result( data );
		}
	}
}