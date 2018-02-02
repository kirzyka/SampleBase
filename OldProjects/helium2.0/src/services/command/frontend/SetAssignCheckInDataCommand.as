package services.command.frontend
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.frontend.SetAssignCheckInDataDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.frontend.SetAssignCheckInDataEvent;

	public class SetAssignCheckInDataCommand extends BaseCommand
	{	
		override public function execute(event:CairngormEvent):void
		{
			_event = SetAssignCheckInDataEvent( event );
			var delegate:SetAssignCheckInDataDelegate = new SetAssignCheckInDataDelegate( this );			
			delegate.setAssign( _event as  SetAssignCheckInDataEvent );
			super.execute( event );
		}
		
		override public function result(data:Object):void
		{
			super.result( data );
		}
		
	}
}