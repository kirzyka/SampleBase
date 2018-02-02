package services.command.miscellaneous.loyaltyPrograms
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.miscellaneous.loyaltyPrograms.LoyaltyProgramsDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.miscellaneous.loyaltyPrograms.GetLoyaltyProgramsEvent;
	import services.vo.GlobalStorage;
	
	import mx.collections.ArrayCollection;

	public class GetLoyaltyProgramsCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = GetLoyaltyProgramsEvent( event );
			var delegate:LoyaltyProgramsDelegate = new LoyaltyProgramsDelegate( this );
			
			delegate.getLoyaltyProgram( _event as GetLoyaltyProgramsEvent );
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			GlobalStorage.loyaltyPrograms = new ArrayCollection( data as Array );
			super.result(data);
		}
		
	}
}