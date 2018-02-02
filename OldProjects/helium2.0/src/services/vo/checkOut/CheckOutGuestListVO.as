package services.vo.checkOut
{
	import services.vo.frontend.ReservationOrderVO;
	import services.vo.profiles.ProfilePersonalVO;
	import services.vo.reservation.OrderVO;
	
	[RemoteClass(alias="MapCheckOutGuestList")]
	public class CheckOutGuestListVO
	{
	  public var sRoomNumber:String;
	  public var aProfilePersonal:Array = [];//ProfilePersonalVO
	  public var sTAName:String;
	  public var oOrder:OrderVO/*  ReservationOrderVO */;
	  public var fBalance:Number;
	  
	  [Transient]
	  public var oProfilePersonal:ProfilePersonalVO = new ProfilePersonalVO();
	  
	  [Transient]
	  public var bFirst:Boolean = false;
	}

}
