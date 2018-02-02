package services.command.reservation
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import services.business.reservation.GetGuestListDelegate;
	import services.cairngorm.BaseCommand;
	import services.events.reservation.GetGuestListForReservationEvent;
	
	import mx.collections.ArrayCollection;

	public class GetGuestListForRsrvCommand extends BaseCommand
	{
		override public function execute(event:CairngormEvent):void
		{
			_event = GetGuestListForReservationEvent(event);
			var evt:GetGuestListForReservationEvent = GetGuestListForReservationEvent( event );
			var delegate:GetGuestListDelegate = new GetGuestListDelegate( this );

			delegate.getGuestList(evt);
			super.execute(event);
		}

		override public function result(data:Object):void
		{
			model.reservationCreateModule.guestList = new ArrayCollection(data as Array); //ProfilePersonalVO
			super.result(data);
		}
		
	}
}