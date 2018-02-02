package services.command.reservation
{
	import services.cairngorm.BaseCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import services.events.reservation.SaveGroupReservationEvent;
	import services.business.reservation.ReservationDelegate;

	public class SaveGroupReservationCommand extends BaseCommand
	{
		override public function execute(event:CairngormEvent):void
		{
			_event = SaveGroupReservationEvent(event);
			var delegate:ReservationDelegate = new ReservationDelegate(this);
			delegate.saveGroupReservation(_event as SaveGroupReservationEvent);
			super.execute(event);
		}
		
		override public function result(data:Object):void
		{	
			super.result(data);
		}		
				
	}
}