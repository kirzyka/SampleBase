package services.command.miscellaneous.loyaltyPrograms
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.miscellaneous.loyaltyPrograms.LoyaltyProgramsDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.miscellaneous.loyaltyPrograms.AddLoyaltyProgramEvent;

	public class AddLoyaltyProgramCommand extends BaseCommand
	{
		override public function execute(event:CairngormEvent):void
		{
			_event = AddLoyaltyProgramEvent( event );
			var delegate:LoyaltyProgramsDelegate = new LoyaltyProgramsDelegate( this );			
			delegate.addLoyaltyProgram(_event as AddLoyaltyProgramEvent);			
			super.execute( event );
		}
		
		override public function result(data:Object):void
		{
			super.result( data );
		}		
	}
}