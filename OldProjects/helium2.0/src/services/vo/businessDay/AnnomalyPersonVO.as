package services.vo.businessDay
{
	import services.vo.frontend.ReservationOrderVO;
	import services.vo.profiles.ProfilePersonalVO;
	import services.vo.reservation.OrderVO;
	
	[RemoteClass(alias="MapAnnomalyPerson ")]
	public class AnnomalyPersonVO
	{
	 public var iReservationId:Number;
	 public var sStatus:String;
	 public var sRoom:String;
	 public var sName:String;
	 public var sArrivalDate:String;
	 public var sDepartureDate:String;
	 public var sCompany:String;
	 public var sPhone:String;
	 public var sEmail:String;
	 public var fBalance:Number;
	}

}