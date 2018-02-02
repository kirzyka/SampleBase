package framework.view.pages.reservationCreate.renderer
{
	import flash.events.Event;
	
	import mx.controls.NumericStepper;
	
	import services.vo.reservation.ReservationRoomBlockedVO;

	public class NumericStepperRoomOverview extends NumericStepper
	{
		public function NumericStepperRoomOverview()
		{
			super();
			addEventListener(Event.CHANGE, onChange);
			minimum = 1;
			enabled = false;
		}
		
		private function onChange(event:Event):void
		{
			/*if(data is ReservationRoomBlockedVO && data != null)
			{
				(data as ReservationRoomBlockedVO).iRoomQuantityAvail = value;
			}*/
		}
		
		/*override public function set value(val:Number):void
		{
			super.value = val;
			if(data is ReservationRoomBlockedVO && data != null)
			{
				(data as ReservationRoomBlockedVO).iRoomQuantityAvail = value;
			}
		}*/
		
		
	}
}