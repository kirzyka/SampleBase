package services.command.miscellaneous.salutation
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import services.business.miscellaneous.salutation.SalutationDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.miscellaneous.salutation.DeleteSalutationEvent;

	public class DeleteSalutationCommand extends BaseCommand
	{
		override public function execute(event:CairngormEvent):void
		{
			_event = DeleteSalutationEvent( event );
			var delegate:SalutationDelegate = new SalutationDelegate( this );
			
			delegate.deleteSalutation(_event as DeleteSalutationEvent);
			super.execute( event );
		}
		
		override public function result(data:Object):void
		{						
			super.result( data );
		}
		
		
		
	}
}