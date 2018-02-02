package services.command.miscellaneous.salutation
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import services.business.miscellaneous.salutation.SalutationDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.miscellaneous.salutation.AddSalutationEvent;

	public class AddSalutationCommand extends BaseCommand
	{		
		override public function execute(event:CairngormEvent):void
		{
			_event = AddSalutationEvent( event );
			var delegate:SalutationDelegate = new SalutationDelegate( this );
			
			delegate.addSalutation(_event as AddSalutationEvent);
			super.execute( event );
		}
		
		override public function result(data:Object):void
		{
			super.result( data );
		}		
			
	}
}