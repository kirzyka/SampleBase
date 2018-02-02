package services.vo.reservation
{
	import com.adobe.cairngorm.vo.IValueObject;
	
	[RemoteClass(alias="MapReservationCalendar")]
	[Bindable]	
	public class ReservationCalendarVO implements IValueObject
	{
  		public var aCalendarRoomStatus:Array;
  		public var aCalendar:Array;
  		public var aGroupCalendar:Array;
	}
}