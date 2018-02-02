package services.command.miscellaneous.loyaltyPrograms
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import services.business.miscellaneous.loyaltyPrograms.LoyaltyProgramsDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.miscellaneous.loyaltyPrograms.DeleteLoyaltyProgramEvent;
	import services.vo.GlobalStorage;

	public class DeleteLoyaltyProgramCommand extends BaseCommand
	{
		override public function execute(event:CairngormEvent):void
		{
			_event = DeleteLoyaltyProgramEvent( event );
			var delegate:LoyaltyProgramsDelegate = new LoyaltyProgramsDelegate( this );			
			delegate.deleteLoyaltyProgram(_event as DeleteLoyaltyProgramEvent);
			super.execute( event );
		}
		
		override public function result(data:Object):void
		{
			for (var i:int = 0; i < GlobalStorage.loyaltyPrograms.length; i++)
				if (GlobalStorage.loyaltyPrograms.getItemAt(i).lId == (_event as DeleteLoyaltyProgramEvent).listProgram.getItemAt((_event as DeleteLoyaltyProgramEvent).index).lId)
				{					
					var tempLength:int = GlobalStorage.loyaltyPrograms.length;
					(_event as DeleteLoyaltyProgramEvent).listProgram.removeItemAt((_event as DeleteLoyaltyProgramEvent).index);
					if (GlobalStorage.loyaltyPrograms.length == tempLength) // GlobalStorage.language and deleteEvt.listLanguage don't connect
					GlobalStorage.loyaltyPrograms.removeItemAt(i);
					break;
				}			
			super.result( data );
		}
	}
}