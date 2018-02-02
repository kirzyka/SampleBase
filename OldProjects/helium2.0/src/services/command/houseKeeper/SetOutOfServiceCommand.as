package services.command.houseKeeper
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.cashShift.CashShiftDelegate;
	import services.business.houseKeeper.HouseKeeperDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.houseKeeper.SetOutOfServiceEvent;

	public class SetOutOfServiceCommand extends BaseCommand
	{
		/**
		 *  @override
		 */
		override public function execute(event:CairngormEvent):void
		{
			_event = SetOutOfServiceEvent(event);
			var delegate:HouseKeeperDelegate= new HouseKeeperDelegate(this);
			delegate.setOutOfService(_event as SetOutOfServiceEvent);
			
			super.execute(event);
		}
		/**
		 *  @override
		 */
		override public function result(data:Object):void
		{
			super.result(data);
		}
	}
}